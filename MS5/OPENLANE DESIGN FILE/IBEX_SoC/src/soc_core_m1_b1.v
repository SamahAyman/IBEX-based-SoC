
`timescale 1ns/1ns
module soc_core_m1_b1(
	input HCLK, 
	input HRESETn,
	input [7: 0] Input_DATA,
	input [0: 0] Input_irq,
	output Output_DATA,
	input wire [3: 0] fdi_Sys0_S0,
	output wire [3: 0] fdo_Sys0_S0,
	output wire [3: 0] fdoe_Sys0_S0,
	output wire [0: 0] fsclk_Sys0_S0,
	output wire [0: 0] fcen_Sys0_S0,
	input wire [15: 0] GPIOIN_Sys0_S2,
	output wire [15: 0] GPIOOUT_Sys0_S2,
	output wire [15: 0] GPIOPU_Sys0_S2,
	output wire [15: 0] GPIOPD_Sys0_S2,
	output wire [15: 0] GPIOOEN_Sys0_S2,
	output [3:0] db_reg_Sys0,
		input wire [0: 0] scl_i_Sys0_SS0_S0,
		output wire [0: 0] scl_o_Sys0_SS0_S0,
		output wire [0: 0] scl_oen_o_Sys0_SS0_S0,
		input wire [0: 0] sda_i_Sys0_SS0_S0,
		output wire [0: 0] sda_o_Sys0_SS0_S0,
		output wire [0: 0] sda_oen_o_Sys0_SS0_S0,
		input wire [0: 0] MSI_Sys0_SS0_S1,
		output wire [0: 0] MSO_Sys0_SS0_S1,
		output wire [0: 0] SSn_Sys0_SS0_S1,
		output wire [0: 0] SCLK_Sys0_SS0_S1,
		output wire [0: 0] pwm_Sys0_SS0_S2
    );


	// wire HCLK_Sys0;
	// wire HRESETn_Sys0;

	wire [31: 0] HADDR_Sys0;
	wire [31: 0] HWDATA_Sys0;
	wire HWRITE_Sys0;
	wire [1: 0] HTRANS_Sys0;
	wire [2:0] HSIZE_Sys0;

	wire HREADY_Sys0;
	wire [31: 0] HRDATA_Sys0;

	wire IRQ_Sys0_SS0_S3;
	wire [31: 0] SRAMRDATA_Sys0_S1;
	wire [3: 0] SRAMWEN_Sys0_S1;
	wire [31: 0] SRAMWDATA_Sys0_S1;
	wire [0: 0] SRAMCS0_Sys0_S1;
	wire [0: 0] SRAMCS1_Sys0_S1;
	wire [0: 0] SRAMCS2_Sys0_S1;
	wire [0: 0] SRAMCS3_Sys0_S1;
	wire [14: 0] SRAMADDR_Sys0_S1;
	// AHB LITE Master3 Signals
	wire [31:0] M3_HADDR;
	wire [0:0] M3_HREADY;
	wire [0:0] M3_HWRITE;
	wire [1:0] M3_HTRANS;
	wire [2:0] M3_HSIZE;
	wire [31:0] M3_HWDATA;
	wire [31:0] M3_HRDATA;
wire [0: 0] M3_IRQ;

	wire [3:0] M3_HPROT;
	wire [2:0] M3_HBURST;
	wire M3_HBUSREQ;
	wire M3_HLOCK;
	wire M3_HGRANT;
	assign M3_HREADY = HREADY_Sys0; 
	assign M3_HRDATA = HRDATA_Sys0;

	assign HADDR_Sys0 = M3_HADDR; 
	assign HWDATA_Sys0 = M3_HWDATA; 
	assign HWRITE_Sys0 = M3_HWRITE; 
	assign HTRANS_Sys0 = M3_HTRANS; 
	assign HSIZE_Sys0 = M3_HSIZE;
	assign M3_HGRANT = 1'b1;
	assign M3_HBUSREQ = 1'b1;


	assign M3_IRQ = 1'b0;

  

	//AHBlite_SYS0 instantiation

	AHBlite_sys_0 ahb_sys_0_uut(
		// .HCLK(HCLK_Sys0),
		// .HRESETn(HRESETn_Sys0),
    
		.HCLK(HCLK),
		.HRESETn(HRESETn),
         
		.HADDR(HADDR_Sys0),
		.HWDATA(HWDATA_Sys0),
		.HWRITE(HWRITE_Sys0),
		.HTRANS(HTRANS_Sys0),
		.HSIZE(HSIZE_Sys0),
    
		.HREADY(HREADY_Sys0),
		.HRDATA(HRDATA_Sys0),
    
		.Input_DATA(Input_DATA),
		.Input_irq(Input_irq),
		.Output_DATA(Output_DATA),
		.fdi_S0(fdi_Sys0_S0),
		.fdo_S0(fdo_Sys0_S0),
		.fdoe_S0(fdoe_Sys0_S0),
		.fsclk_S0(fsclk_Sys0_S0),
		.fcen_S0(fcen_Sys0_S0),
		.SRAMRDATA_S1(SRAMRDATA_Sys0_S1),
		.SRAMWEN_S1(SRAMWEN_Sys0_S1),
		.SRAMWDATA_S1(SRAMWDATA_Sys0_S1),
		.SRAMCS0_S1(SRAMCS0_Sys0_S1),
		.SRAMCS1_S1(SRAMCS1_Sys0_S1),
		.SRAMCS2_S1(SRAMCS2_Sys0_S1),
		.SRAMCS3_S1(SRAMCS3_Sys0_S1),
		.SRAMADDR_S1(SRAMADDR_Sys0_S1),
		.GPIOIN_S2(GPIOIN_Sys0_S2),
		.GPIOOUT_S2(GPIOOUT_Sys0_S2),
		.GPIOPU_S2(GPIOPU_Sys0_S2),
		.GPIOPD_S2(GPIOPD_Sys0_S2),
		.GPIOOEN_S2(GPIOOEN_Sys0_S2),
		.db_reg(db_reg_Sys0),
		.scl_i_SS0_S0(scl_i_Sys0_SS0_S0),
		.scl_o_SS0_S0(scl_o_Sys0_SS0_S0),
		.scl_oen_o_SS0_S0(scl_oen_o_Sys0_SS0_S0),
		.sda_i_SS0_S0(sda_i_Sys0_SS0_S0),
		.sda_o_SS0_S0(sda_o_Sys0_SS0_S0),
		.sda_oen_o_SS0_S0(sda_oen_o_Sys0_SS0_S0),
		.MSI_SS0_S1(MSI_Sys0_SS0_S1),
		.MSO_SS0_S1(MSO_Sys0_SS0_S1),
		.SSn_SS0_S1(SSn_Sys0_SS0_S1),
		.SCLK_SS0_S1(SCLK_Sys0_SS0_S1),
		.pwm_SS0_S2(pwm_Sys0_SS0_S2),
		.IRQ_SS0_S3(IRQ_Sys0_SS0_S3));
        
        
	openstriVe_soc_mem openstriVe_soc_mem_Sys0_S1(
	.clk(HCLK),
	.rdata(SRAMRDATA_Sys0_S1),
	.wdata(SRAMWDATA_Sys0_S1),
	.addr(SRAMADDR_Sys0_S1),
	.ena(SRAMCS0_Sys0_S1),
	.wen(SRAMWEN_Sys0_S1)
	);
	// Instantiation of IBEX_wrapper
	ibex_wrapper IBEX(
		.HCLK(HCLK),
		.HRESETn(HRESETn),
		.HADDR(M3_HADDR),
		.HREADY(M3_HREADY),
		.HWRITE(M3_HWRITE),
		.HTRANS(M3_HTRANS),
		.HSIZE(M3_HSIZE),
		.HWDATA(M3_HWDATA),
		.HRDATA(M3_HRDATA)

		//Interrupts

		//Interrupts

		//.IRQ(M3_IRQ)

		//Ports
		);
 
  endmodule
  