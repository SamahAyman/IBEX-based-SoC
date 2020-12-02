module ibex_ahb_bridge (

    input wire  clk_i,
	input wire  rst_ni,

	input wire  instr_req_o,
	input wire  instr_rvalid_i,
	input wire  [31:0] instr_addr_o,
	input wire  [31:0] instr_rdata_i,

	input wire  data_req_o,
	input wire  data_rvalid_i,
	input wire  data_we_o,
	input wire  [3:0] data_be_o,
	input wire  [31:0] data_addr_o,
	input wire  [31:0] data_wdata_o,
	input wire  [31:0] data_rdata_i,

    output wire  instr_gnt_i,
    output wire  data_gnt_i,

    output wire   [1:0]  HTRANS,            // ICode-bus transfer type   -Done
    output wire   [2:0]  HSIZE_out,             // ICode-bus transfer size   
    output wire   [31:0] HADDR_out,             // ICode-bus address
    output wire   [2:0]  HBURST,            // ICode-bus burst length    -Done
    output wire          HWRITE,            // DCode-bus write not read  -Done
    output wire  [31:0]  HWDATA,            // DCode-bus write data      -Done
    output wire  [31:0]  HRDATA,			// AHB read-data

    input  wire     HREADY			    	// AHB stall signal


);

reg [31:0] HADDR;
reg [2:0] HSIZE;
reg HREADY_T;

reg instr_gnt_t;
reg data_gnt_t;

assign HTRANS = 2'b10;                      //NONSEQ
assign HBURST = 3'b000;                     //Single access

assign HWDATA = data_wdata_o;
assign HRDATA = data_rdata_i;

assign HWRITE = data_we_o;
      
//  I-D arbiter -- high priority to I

reg counter;

always @(posedge clk_i) begin

    counter = ~counter;
    
end


always @(posedge clk_i or negedge rst_ni)

    if (!rst_ni) begin
        counter = 1'b0;
    end

    else 
    begin

		if (instr_req_o && !data_req_o )   // I-request -- NO D-request
			begin                          // serving instruction request

                HADDR = instr_addr_o;
                HSIZE = 3'b010;            //word
                data_gnt_t = 1'b0; 

                instr_gnt_t = 1'b1 ;         //signaling that this request would be served

                HREADY_T = HREADY;

            end

        else if (instr_req_o && data_req_o )     // I-request & D-request
			begin                           // serving instruction request, also

           

                HADDR = instr_addr_o;
                HSIZE = 3'b010;            //word

                instr_gnt_t = 1'b1 ;        //signaling that this request would be served
                data_gnt_t = 1'b0;        


                HREADY_T = HREADY;

            end

        else if (!instr_req_o && data_req_o )     // NO I-request -- D-request
			begin                           // serving data request, also

         

                HADDR = data_addr_o;
                HSIZE = 3'b010;            //word

                data_gnt_t = 1'b1 ;           //signaling that this request would be served
                instr_gnt_t = 1'b0;         //signaling that this request would be served

                HREADY_T = HREADY;

            end
        else begin
            
                HADDR = instr_addr_o;
                HSIZE = 3'b010;            //word

                instr_gnt_t = 1'b1 ;         //signaling that this request would be served
                data_gnt_t = 1'b0; 

                HREADY_T = HREADY;      
        end
    end

    assign HREADY = HREADY_T;
    assign HADDR_out = HADDR;
    assign HREADY = HREADY_T;
    assign HSIZE_out = HSIZE;

    assign instr_gnt_i = instr_gnt_t;
    assign data_gnt_i = data_gnt_t;


endmodule
