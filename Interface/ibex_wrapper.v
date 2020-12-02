module ibex_system (
	// Inputs
	HRESETn, 
	HCLK,  
	HREADY, HREADYOUT, HRDATA, HRESP, 
	// Outputs
  
   	HTRANS, HSIZE, HADDR, HBURST, 
	HWRITE, HWDATA, 
);


	//----------------------------------------------------------------------------
	// Port declarations
	//----------------------------------------------------------------------------
	
	
	// RESET and CLK
	
	input reg          HRESETn;            // System reset
	input          HCLK;               // System clock
	

	// AHB Master Port
	input          HREADYOUT;          // ICode-bus ready
	input   [31:0] HRDATA;             // ICode-bus read data
	
	
	// Output Ports
	output   [1:0]  HTRANS;            // ICode-bus transfer type
	output   [2:0]  HSIZE;             // ICode-bus transfer size
	output   [31:0] HADDR;             // ICode-bus address
	output   [2:0]  HBURST;            // ICode-bus burst length
	
	output          HWRITE;            // DCode-bus write not read
	output  [31:0]  HWDATA;            // DCode-bus write data

	output HREADY;



	//----------------------------------------------------------------------------
	// IBEX declarations
	//----------------------------------------------------------------------------

	 

    wire          test_en_i;     // enable all clock gates for testing

    wire   [31:0] hart_id_i;
    wire   [31:0] boot_addr_i;

    // Instruction memory interface
    wire         instr_req_o;
    wire          instr_gnt_i;
    wire          instr_rvalid_i;
    wire  [31:0] instr_addr_o;
    wire   [31:0] instr_rdata_i;
    wire          instr_err_i;

    // Data memory interface
    wire         data_req_o;
    wire          data_gnt_i;
    wire          data_rvalid_i;
    wire         data_we_o;
    wire  [3:0]  data_be_o;
    wire  [31:0] data_addr_o;
    wire  [31:0] data_wdata_o;
    wire   [31:0] data_rdata_i;
    wire          data_err_i;

    // Interrupt inputs
    wire          irq_software_i;
    wire          irq_timer_i;
    wire          irq_external_i;
    wire   [14:0] irq_fast_i;
    wire          irq_nm_i;       // non-maskeable interrupt

    // Debug Interface
    wire          debug_req_i;


	ibex_core ic (

		HCLK,
		HRESETn,
		test_en_i,

		hart_id_i,
		boot_addr_i,

		instr_req_o,
		instr_gnt_i,
		instr_rvalid_i,
		instr_addr_o,
		instr_rdata_i,
		instr_err_i,

		data_req_o,
		data_gnt_i,
		data_rvalid_i,
		data_we_o,
		data_be_o,
		data_addr_o,
		data_wdata_o,
		data_rdata_i,
		data_err_i,

		irq_software_i,
		irq_timer_i,
		irq_external_i,
		irq_fast_i,
		irq_nm_i,

		debug_req_i,
		
		fetch_enable_i,
		alert_minor_o,
		alert_major_o,
		core_sleep_o
);


ibex_ahb_bridge bridge  (

	clk_i,
	rst_ni,

	instr_req_o,
	instr_rvalid_i,
	instr_addr_o,
	instr_rdata_i,

	data_req_o,
	data_rvalid_i,
	data_we_o,
	data_be_o,
	data_addr_o,
	data_wdata_o,
	data_rdata_i,

	instr_gnt_i,
	data_gnt_i,

	HTRANS,            // ICode-bus transfer type   -Done
	HSIZE,             // ICode-bus transfer size   
	HADDR,             // ICode-bus address
	HBURST,            // ICode-bus burst length    -Done
	HWRITE,            // DCode-bus write not read  -Done
	HWDATA,            // DCode-bus write data      -Done
	HRDATA,			// AHB read-data

	HREADY			    	// AHB stall signal

);




endmodule