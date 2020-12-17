
`timescale 1ns/1ns
module AHBlite_sys_0(
		input HCLK,
		input HRESETn,
     
		input [31: 0] HADDR,
		input [31: 0] HWDATA,
		input HWRITE,
		input [1: 0] HTRANS,
		input [2:0] HSIZE,

		output HREADY,
		output [31: 0] HRDATA,

		input [7: 0] Input_DATA,
		input [0: 0] Input_irq,
		output Output_DATA,
		input wire [3: 0] fdi_S0,
		output wire [3: 0] fdo_S0,
		output wire [3: 0] fdoe_S0,
		output wire [0: 0] fsclk_S0,
		output wire [0: 0] fcen_S0,
		input wire [31: 0] SRAMRDATA_S1,
		output wire [3: 0] SRAMWEN_S1,
		output wire [31: 0] SRAMWDATA_S1,
		output wire [0: 0] SRAMCS0_S1,
		output wire [0: 0] SRAMCS1_S1,
		output wire [0: 0] SRAMCS2_S1,
		output wire [0: 0] SRAMCS3_S1,
		output wire [14: 0] SRAMADDR_S1,
		input wire [15: 0] GPIOIN_S2,
		output wire [15: 0] GPIOOUT_S2,
		output wire [15: 0] GPIOPU_S2,
		output wire [15: 0] GPIOPD_S2,
		output wire [15: 0] GPIOOEN_S2,
		output wire [3:0] db_reg,
		input wire [0: 0] scl_i_SS0_S0,
		output wire [0: 0] scl_o_SS0_S0,
		output wire [0: 0] scl_oen_o_SS0_S0,
		input wire [0: 0] sda_i_SS0_S0,
		output wire [0: 0] sda_o_SS0_S0,
		output wire [0: 0] sda_oen_o_SS0_S0,
		input wire [0: 0] MSI_SS0_S1,
		output wire [0: 0] MSO_SS0_S1,
		output wire [0: 0] SSn_SS0_S1,
		output wire [0: 0] SCLK_SS0_S1,
		output wire [0: 0] pwm_SS0_S2,
		output IRQ_SS0_S3
	);
        
        //Inputs
        wire HSEL_S0, HSEL_S1, HSEL_S2, HSEL_S3, HSEL_SS0;
        //wire [31: 0] HADDR;
        //wire HWRITE;
        //wire [1: 0] HTRANS;
        //wire [1: 0] HSIZE;
        //wire [31: 0] HWDATA;

        //Outputs
        wire    [31:0]   HRDATA_S0, HRDATA_S1, HRDATA_S2, HRDATA_S3, HRDATA_SS0, HRDATA;
        wire             HREADY_S0, HREADY_S1, HREADY_S2, HREADY_S3, HREADY_SS0, HREADY;
        wire  [1:0]   HRESP;
        wire          IRQ;
        
		wire [15: 0] WGPIODIN_S2;

		wire [15: 0] WGPIODOUT_S2;

		wire [15: 0] WGPIOPU_S2;

		wire [15: 0] WGPIOPD_S2;

		wire [15: 0] WGPIODIR_S2;

        //Digital module # 0
        QSPIXIP S0 ( 
            .HCLK(HCLK),
                .HRESETn(HRESETn),
			.HSEL(HSEL_S0),
			.HADDR(HADDR),
			.HREADY(HREADY),
			.HWRITE(HWRITE),
			.HTRANS(HTRANS),
			.HSIZE(HSIZE),
			.HRDATA(HRDATA_S0),
			.HREADYOUT(HREADY_S0),
			.fdi(fdi_S0),
			.fdo(fdo_S0),
			.fdoe(fdoe_S0),
			.fsclk(fsclk_S0),
			.fcen(fcen_S0)
            );
            
        //Digital module # 1
        AHBSRAM S1 ( 
            .HCLK(HCLK),
                .HRESETn(HRESETn),
			.HSEL(HSEL_S1),
			.HADDR(HADDR),
			.HREADY(HREADY),
			.HWRITE(HWRITE),
			.HTRANS(HTRANS),
			.HSIZE(HSIZE),
			.HWDATA(HWDATA),
			.HRDATA(HRDATA_S1),
			.HREADYOUT(HREADY_S1),
			.SRAMRDATA(SRAMRDATA_S1),
			.SRAMWEN(SRAMWEN_S1),
			.SRAMWDATA(SRAMWDATA_S1),
			.SRAMCS0(SRAMCS0_S1),
			.SRAMCS1(SRAMCS1_S1),
			.SRAMCS2(SRAMCS2_S1),
			.SRAMCS3(SRAMCS3_S1),
			.SRAMADDR(SRAMADDR_S1)
            );
            
        //Digital module # 2
        GPIO S2 ( 
			.WGPIODIN(WGPIODIN_S2),
			.WGPIODOUT(WGPIODOUT_S2),
			.WGPIOPU(WGPIOPU_S2),
			.WGPIOPD(WGPIOPD_S2),
			.WGPIODIR(WGPIODIR_S2),
			.GPIOIN(GPIOIN_S2),
			.GPIOOUT(GPIOOUT_S2),
			.GPIOPU(GPIOPU_S2),
			.GPIOPD(GPIOPD_S2),
			.GPIOOEN(GPIOOEN_S2)
            );
            
            //AHB Slave # 2
            AHBlite_GPIO S_2 (
                .HCLK(HCLK),
                .HRESETn(HRESETn),
                .HSEL(HSEL_S2),
                .HADDR(HADDR[23:2]),
                .HREADY(HREADY),
                .HWRITE(HWRITE),
                .HTRANS(HTRANS),
                .HSIZE(HSIZE),
                .HWDATA(HWDATA),
    
                
			.WGPIODIN(WGPIODIN_S2),
			.WGPIODOUT(WGPIODOUT_S2),
			.WGPIOPU(WGPIOPU_S2),
			.WGPIOPD(WGPIOPD_S2),
			.WGPIODIR(WGPIODIR_S2),
                .HRDATA(HRDATA_S2),
                .HREADYOUT(HREADY_S2),
                .HRESP(HRESP)
            );
                
            //AHB Slave # 3
            AHBlite_db_reg S_3 (
                .HCLK(HCLK),
                .HRESETn(HRESETn),
                .HSEL(HSEL_S3),
                .HADDR(HADDR[23:2]),
                .HREADY(HREADY),
                .HWRITE(HWRITE),
                .HTRANS(HTRANS),
                .HSIZE(HSIZE),
                .HWDATA(HWDATA),
                .db_reg(db_reg),

                .HRDATA(HRDATA_S3),
                .HREADYOUT(HREADY_S3),
                .HRESP(HRESP));
                
        
        //AHB Bus
        AHBlite_BUS0 AHB(
            .HCLK(HCLK),
            .HRESETn(HRESETn),
          
            // Master Interface
            .HADDR(HADDR),
            .HWDATA(HWDATA), 
            .HREADY(HREADY),
            .HRDATA(HRDATA),
            
            // Slave # 0
            .HSEL_S0(HSEL_S0),
            .HREADY_S0(HREADY_S0),
            .HRDATA_S0(HRDATA_S0),
            
            // Slave # 1
            .HSEL_S1(HSEL_S1),
            .HREADY_S1(HREADY_S1),
            .HRDATA_S1(HRDATA_S1),
            
            // Slave # 2
            .HSEL_S2(HSEL_S2),
            .HREADY_S2(HREADY_S2),
            .HRDATA_S2(HRDATA_S2),
            
            // Slave # 3
            .HSEL_S3(HSEL_S3),
            .HREADY_S3(HREADY_S3),
            .HRDATA_S3(HRDATA_S3),
            
            // Subsystem # 0
            .HSEL_SS0(HSEL_SS0),
            .HREADY_SS0(HREADY_SS0),
            .HRDATA_SS0(HRDATA_SS0)
        );
    
    //SubSystem Instantiation #0 
    apb_sys_0 apb_sys_inst_0(
        // Global signals --------------------------------------------------------------
        .HCLK(HCLK),
        .HRESETn(HRESETn),
    
        // AHB Slave inputs ------------------------------------------------------------
        .HADDR(HADDR),
        .HTRANS(HTRANS),
        .HWRITE(HWRITE),
        .HWDATA(HWDATA),
        .HSEL(HSEL_SS0),
        .HREADY(HREADY),
    
        // AHB Slave outputs -----------------------------------------------------------
        .HRDATA(HRDATA_SS0),
        .HREADYOUT(HREADY_SS0),
		.scl_i_S0(scl_i_SS0_S0),
		.scl_o_S0(scl_o_SS0_S0),
		.scl_oen_o_S0(scl_oen_o_SS0_S0),
		.sda_i_S0(sda_i_SS0_S0),
		.sda_o_S0(sda_o_SS0_S0),
		.sda_oen_o_S0(sda_oen_o_SS0_S0),
		.MSI_S1(MSI_SS0_S1),
		.MSO_S1(MSO_SS0_S1),
		.SSn_S1(SSn_SS0_S1),
		.SCLK_S1(SCLK_SS0_S1),
		.pwm_S2(pwm_SS0_S2),
		.IRQ_S3(IRQ_SS0_S3)
    );
    
    always @(posedge HCLK)
	if(HTRANS[1] & HREADY)
        $display("Mem request (%d) A:%X", HWRITE, HADDR);
        
    endmodule
        