module ibex_ahb_bridge (

    input wire  clk_i,
	input wire  rst_ni,

	input wire  instr_req_o,
	input wire  [31:0] instr_addr_o,

	output reg  instr_rvalid_i,
	output reg  [31:0] instr_rdata_i,

	input wire  data_req_o,
	input wire  data_we_o,
	input wire  [3:0] data_be_o,
	input wire  [31:0] data_addr_o,
	input wire  [31:0] data_wdata_o,

	output reg   data_rvalid_i,
	output reg  [31:0] data_rdata_i,

    output reg  instr_gnt_i,
    output reg  data_gnt_i,

    output reg   [1:0]  HTRANS,            
    output wire   [2:0]  HSIZE,           
    output wire    [31:0] HADDR,             
    output wire   [2:0]  HBURST,            
    output wire          HWRITE,            
    output wire  [31:0]  HWDATA,           

    input wire  [31:0]  HRDATA,			
    input wire     HREADY			    	


);


reg [1:0] state, next_state;
reg req_type;
reg [2:0] hsize;
reg [1:0] addr_offset;

localparam idel = 2'b00, req = 2'b01, addr = 2'b11, data = 2'b10;
localparam data_r = 1'b0, inst_r = 1'b1;

always @(*)
  begin
    if (instr_gnt_i)
        begin
        hsize <= 3'b010;
        addr_offset <= 2'b00;
        end
   else
   begin
    case (data_be_o)
     //For a byte 
      4'b0001  :
      begin
      addr_offset <= 2'b00;  
      hsize <= 3'b000;
      end

      4'b0010  :
      begin 
      addr_offset <= 2'b01;
      hsize <= 3'b000;
      end

      4'b0100  :
      begin 
      addr_offset <=2'b10;
      hsize <= 3'b000;
      end

      4'b1000  :
      begin
      addr_offset <= 2'b11;
     hsize <= 3'b000;
      end

      //For a halfword
      4'b0011:
      begin
      addr_offset <= 2'b00;
      hsize <= 3'b001;
      end

      4'b0110:
      begin
      addr_offset <= 2'b01;
      hsize <= 3'b001;
      end

      4'b1100:
      begin
      addr_offset <= 2'b10;
      hsize <= 3'b001;
      end

      //For a word
      4'b1111:
      begin
      addr_offset <= 2'b00;
      hsize <= 3'b010;
      end
      //HWDATA = data_wdata_o;
      //data_rdata_i = HRDATA;

      4'b1110:
      begin
      addr_offset <= 2'b00;
      hsize <= 3'b010;
      end


      4'b0111:
      begin
      addr_offset <= 2'b00;
      hsize <= 3'b010;
      end
      //HWDATA = data_wdata_o & 32'h00ffffff;
      //data_rdata_i = HRDATA & 32'ffffff00;
     default :begin
               addr_offset <= 0;
               hsize <= 3'b010;
      end
     
      endcase
    end
  end

 assign HADDR = (instr_req_o)? instr_addr_o : {data_addr_o[31:2],addr_offset}; 
      

always @ (*)
begin

    case (state)

        idel: begin 
           if (instr_req_o) begin
                req_type = inst_r;
                next_state = req;
           end
           else if (data_req_o) begin
                req_type = data_r;
                next_state = req;            
           end
           else next_state = idel;
        end

        req: begin 
            next_state = addr;
        end

        addr: begin
            if (HREADY) next_state = data;
            else next_state = addr;
        end

        data: begin
            next_state = idel;
        end
    endcase
end

always @(posedge clk_i or negedge rst_ni)
begin

    if (!rst_ni) state <= idel;
    else state <= next_state;

end

always @(state)
begin

    case (state)

    idel:begin
        instr_gnt_i = 1'b0;
        instr_rvalid_i = 1'b0;

        data_gnt_i = 1'b0;
        data_rvalid_i = 1'b0;

        HTRANS    = 2'b00; 
    end

    req:begin
        if (req_type == inst_r) begin
            instr_gnt_i = 1'b1;
            instr_rvalid_i = 1'b0;
            HTRANS    = 2'b00; 
        end 
        else if (req_type == data_r) begin
            data_gnt_i = 1'b1;
            data_rvalid_i = 1'b0;
            HTRANS    = 2'b00; 
        end
    end

    addr:begin
        if (req_type == inst_r) begin
            instr_gnt_i = 1'b0;
            instr_rvalid_i = 1'b0;
            //HADDR = instr_addr_o;
            HTRANS    = 2'b10; 
        end 
        else if (req_type == data_r) begin
            data_gnt_i = 1'b0;
            data_rvalid_i = 1'b0;
            //HADDR = { data_addr_o[31:2] , addr_offset};
            HTRANS    = 2'b10; 
        end
       
    end

    data:begin
        if (req_type == inst_r) begin
            instr_gnt_i = 1'b0;
            instr_rvalid_i = 1'b1;
            instr_rdata_i = HRDATA;
            HTRANS    = 2'b00; 
        end 
        else if (req_type == data_r) begin
            data_gnt_i = 1'b0;
            data_rvalid_i = 1'b1;
            data_rdata_i = HRDATA;
            HTRANS    = 2'b00; 
        end
    end


    endcase

end

//assign HTRANS    = 2'b10;                      //NONSEQ
assign HBURST    = 3'b000;                     //Single access
assign HSIZE =  hsize; 
//assign HSIZE     = 3'b000;                      //WORD

assign HWDATA = data_wdata_o;
assign HWRITE = data_we_o;



endmodule