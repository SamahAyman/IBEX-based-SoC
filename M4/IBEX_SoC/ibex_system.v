module ibex_system (

	input	HCLK,							// System clock
	input	HRESETn,						// System Reset, active low

	output wire [31:0]  HADDR,				// AHB transaction address
	output wire [ 2:0]  HSIZE,				// AHB size: byte, half-word or word
	output wire [ 1:0]  HTRANS,				// AHB transfer: non-sequential only
	output wire [31:0]  HWDATA,				// AHB write-data
	output wire         HWRITE,				// AHB write control

	input  wire [31:0]  HRDATA,				// AHB read-data
	input  wire         HREADY				// AHB stall signal
	
);

	wire clk_i;
	wire rst_ni;
	wire test_en_i;
	wire [31:0] hart_id_i;
	wire [31:0] boot_addr_i;
	wire instr_req_o;
	wire instr_gnt_i;
	wire instr_rvalid_i;
	wire [31:0] instr_addr_o;
	wire [31:0] instr_rdata_i;
	wire instr_err_i;
	wire data_req_o;
	wire data_gnt_i;
	wire data_rvalid_i;
	wire data_we_o;
	wire [3:0] data_be_o;
	wire [31:0] data_addr_o;
	wire [31:0] data_wdata_o;
	wire [31:0] data_rdata_i;
	wire data_err_i;
	wire irq_software_i;
	wire irq_timer_i;
	wire irq_external_i;
	wire [14:0] irq_fast_i;
	wire irq_nm_i;
	wire debug_req_i;
	wire fetch_enable_i;
	wire alert_minor_o;
	wire alert_major_o;
	wire core_sleep_o;

	/* initial begin
		$dumpfile("ibex.vcd"); // vcd dump file
		$dumpvars;
		#100000;
		$finish;
	end */

	
	ibex_core #(
		.PMPEnable        ( 0                   ),
		.PMPGranularity   ( 0                   ),
		.PMPNumRegions    ( 4                   ),
		.MHPMCounterNum   ( 0                   ),
		.MHPMCounterWidth ( 40                  ),
		.RV32E            ( 0                   ),
		.ICache           ( 0                   ),
		.ICacheECC        ( 0                   ),
		.BranchPrediction ( 0                   ),
		.SecureIbex       ( 0                   ),
		.DbgTriggerEn     ( 0                   ),
		.DmHaltAddr       ( 32'h1A110800        ),
		.DmExceptionAddr  ( 32'h1A110808        )
	) u_core (
		// Clock and reset
		.clk_i          (HCLK),
		.rst_ni         (HRESETn),
		.test_en_i      ('b0),

		// Configuration

		.hart_id_i             (32'b0),
		// First instruction executed is at 0x0 + 0x80
		.boot_addr_i           (32'h00000000),

		// Instruction memory interface
		.instr_req_o    (instr_req_o),
		.instr_gnt_i    (instr_gnt_i),
		.instr_rvalid_i (instr_rvalid_i),
		.instr_addr_o   (instr_addr_o),
		.instr_rdata_i  (instr_rdata_i),
		.instr_err_i    (instr_err_i),

		// Data memory interface
		.data_req_o     (data_req_o),
		.data_gnt_i     (data_gnt_i),
		.data_rvalid_i  (data_rvalid_i),
		.data_we_o      (data_we_o),
		.data_be_o      (data_be_o),
		.data_addr_o    (data_addr_o),
		.data_wdata_o   (data_wdata_o),
		.data_rdata_i   (data_rdata_i),
		.data_err_i     (data_err_i),

		// Interrupt inputs


		.irq_software_i        (1'b0),
		.irq_timer_i    (irq_timer_i),
		.irq_external_i        (1'b0),
		.irq_fast_i            (15'b0),
		.irq_nm_i              (1'b0),

		// Debug interface
		.debug_req_i           ('b0),

		// Special control signals
		.fetch_enable_i        ('b1),
		.alert_minor_o         (),
		.alert_major_o         (),
		.core_sleep_o          ()
	);

	ibex_ahb_bridge interface (

    .clk_i(HCLK),
	.rst_ni(HRESETn),

	.instr_req_o(instr_req_o),
	.instr_addr_o(instr_addr_o),

	.instr_rvalid_i(instr_rvalid_i),
	.instr_rdata_i(instr_rdata_i),

	.data_req_o(data_req_o),
	.data_we_o(data_we_o),
	.data_be_o(data_be_o),
	.data_addr_o(data_addr_o),
	.data_wdata_o(data_wdata_o),

	.data_rvalid_i(data_rvalid_i),
	.data_rdata_i(data_rdata_i),

    .instr_gnt_i(instr_gnt_i),
    .data_gnt_i(data_gnt_i),

    .HTRANS(HTRANS),            // ICode-bus transfer type   -Done
    .HSIZE(HSIZE),             // ICode-bus transfer size   
    .HADDR(HADDR),             // ICode-bus address
    .HBURST(),            // ICode-bus burst length    -Done
    .HWRITE(HWRITE),            // DCode-bus write not read  -Done
    .HWDATA(HWDATA),            // DCode-bus write data      -Done
    .HRDATA(HRDATA),			// AHB read-data

    .HREADY(HREADY)		    	// AHB stall signal


);

	





endmodule