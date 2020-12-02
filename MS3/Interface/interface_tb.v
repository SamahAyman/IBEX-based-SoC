
module bridge_testbench();

    reg  clk_i;
    reg  rst_ni;

    reg  instr_req_o;
    reg  instr_rvalid_i;
    reg  [31:0] instr_addr_o;
    reg  [31:0] instr_rdata_i;

    reg  data_req_o;
    reg  data_rvalid_i;
    reg  data_we_o;
    reg  [3:0] data_be_o;
    reg  [31:0] data_addr_o;
    reg  [31:0] data_wdata_o;
    reg  [31:0] data_rdata_i;
    reg     HREADY;			    	// AHB stall signal
    
    wire  instr_gnt_i;
    wire data_gnt_i;
    wire   [1:0]  HTRANS;            // ICode-bus transfer type   -Done
    wire   [2:0]  HSIZE_out;           // ICode-bus transfer size   
    wire   [31:0] HADDR_out;            // ICode-bus address
    wire   [2:0]  HBURST;             // ICode-bus burst length    -Done
    wire          HWRITE;              // DCode-bus write not read  -Done
    wire  [31:0]  HWDATA;               // DCode-bus write data      -Done
    wire  [31:0]  HRDATA;			    // AHB read-data

initial begin 
    clk_i = 1'b0;

    forever begin
    #10 clk_i = ~clk_i;
    end

end

initial begin
$dumpfile("ibex.vcd"); // vcd dump file
$dumpvars; // dump everything
end

initial begin
  rst_ni = 1'b0; 
  
   #10
  instr_req_o = 1'b1;
  instr_addr_o = 32'h4;
  data_req_o = 1'b0;
  data_we_o = 1'b0;
  data_be_o = 4'b0;
  data_addr_o = 32'b0;
  data_wdata_o = 32'b0;
  HREADY = 1'b1; 

  #20
  rst_ni = 1'b1;
  instr_req_o = 1'b1;
  data_req_o = 1'b1;
  
  instr_addr_o = 32'h4;
  data_addr_o = 32'h6;

  data_we_o = 1'b0;
  data_be_o = 4'b0;

  data_wdata_o = 32'b0;
  HREADY = 1'b1;

  
  #30
  rst_ni = 1'b1;
  instr_req_o = 1'b0;
  data_req_o = 1'b1;
  
  instr_addr_o = 32'h4;
  data_addr_o = 32'h6;

  data_we_o = 1'b0;
  data_be_o = 4'b0;

  data_wdata_o = 32'b0;
  HREADY = 1'b1;

    #40
  rst_ni = 1'b1;
  instr_req_o = 1'b0;
  data_req_o = 1'b0;
  
  instr_addr_o = 32'h4;
  data_addr_o = 32'h6;

  data_we_o = 1'b0;
  data_be_o = 4'b0;

  data_wdata_o = 32'b0;
  HREADY = 1'b1;

	    

end

ibex_ahb_bridge  uut(
    .clk_i (clk_i),
	.rst_ni (rst_ni),

	.instr_req_o (instr_req_o),
    .instr_rvalid_i (instr_rvalid_i),
	.instr_addr_o (instr_addr_o),
    .instr_rdata_i (instr_rdata_i),
	.data_req_o (data_req_o),
    .data_rvalid_i (data_rvalid_i),
	.data_we_o (data_we_o),
    .data_be_o (data_be_o),
	.data_addr_o (data_addr_o),
	.data_wdata_o (data_wdata_o),
	.data_rdata_i (data_rdata_i),

    .instr_gnt_i (instr_gnt_i),
    .data_gnt_i (data_gnt_i),

    .HTRANS (HTRANS),               // ICode-bus transfer type   -Done
    .HSIZE_out (HSIZE_out),         // ICode-bus transfer size   
    .HADDR_out (HADDR_out),         // ICode-bus address
    .HBURST (HBURST),               // ICode-bus burst length    -Done
    .HWRITE (HWRITE),               // DCode-bus write not read  -Done
    .HWDATA (HWDATA),               // DCode-bus write data      -Done
    .HRDATA (HRDATA),		      	// AHB read-data

    .HREADY	(HREADY)		    	// AHB stall signal

); 

endmodule