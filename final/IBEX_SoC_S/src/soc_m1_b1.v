
`timescale 1ns/1ns
module IBEX_SoC_S(
	input HCLK, 
	input HRESETn,
	input [7: 0] Input_DATA,
	input [0: 0] Input_irq,
	output Output_DATA,
	output [3:0] db_reg_Sys0,
	inout[3:0] PAD_fdio_Sys0_S0,
	output[0:0] PAD_fsclk_Sys0_S0,
	output[0:0] PAD_fcen_Sys0_S0,
	inout[15:0] PAD_GPIO_Sys0_S2,
	inout[0:0] PAD_i2c_cl_Sys0_SS0_S0,
	inout[0:0] PAD_i2c_da_Sys0_SS0_S0,
	input [0:0] PAD_MSI_Sys0_SS0_S1,
	output[0:0] PAD_MSO_Sys0_SS0_S1,
	output[0:0] PAD_SSn_Sys0_SS0_S1,
	output[0:0] PAD_SCLK_Sys0_SS0_S1,
	output[0:0] PAD_pwm_Sys0_SS0_S2);


	wire [3:0] fdi_Sys0_S0;
	wire [3:0] fdo_Sys0_S0;
	wire [3:0] fdoe_Sys0_S0;
	wire [3:0] PAD_fdio_Sys0_S0;
	dio dio_Sys0_S0_IO0_0( .in(fdi_Sys0_S0[0]), .out(fdo_Sys0_S0[0]), .en(fdoe_Sys0_S0[0]), .PU(1'b1), .PD(1'b0), .PAD(PAD_fdio_Sys0_S0[0]));
	dio dio_Sys0_S0_IO0_1( .in(fdi_Sys0_S0[1]), .out(fdo_Sys0_S0[1]), .en(fdoe_Sys0_S0[1]), .PU(1'b1), .PD(1'b0), .PAD(PAD_fdio_Sys0_S0[1]));
	dio dio_Sys0_S0_IO0_2( .in(fdi_Sys0_S0[2]), .out(fdo_Sys0_S0[2]), .en(fdoe_Sys0_S0[2]), .PU(1'b1), .PD(1'b0), .PAD(PAD_fdio_Sys0_S0[2]));
	dio dio_Sys0_S0_IO0_3( .in(fdi_Sys0_S0[3]), .out(fdo_Sys0_S0[3]), .en(fdoe_Sys0_S0[3]), .PU(1'b1), .PD(1'b0), .PAD(PAD_fdio_Sys0_S0[3]));
	wire [0:0] fsclk_Sys0_S0;
	wire [0:0] PAD_fsclk_Sys0_S0;
	do do_Sys0_S0_IO1_0( .out(fsclk_Sys0_S0), .PAD(PAD_fsclk_Sys0_S0));
	wire [0:0] fcen_Sys0_S0;
	wire [0:0] PAD_fcen_Sys0_S0;
	do do_Sys0_S0_IO2_0( .out(fcen_Sys0_S0), .PAD(PAD_fcen_Sys0_S0));
	wire [15:0] GPIOIN_Sys0_S2;
	wire [15:0] GPIOOUT_Sys0_S2;
	wire [15:0] GPIOOEN_Sys0_S2;
	wire [15:0] GPIOPU_Sys0_S2;
	wire [15:0] GPIOPD_Sys0_S2;
	wire [15:0] PAD_GPIO_Sys0_S2;
	dio dio_Sys0_S2_IO0_0( .in(GPIOIN_Sys0_S2[0]), .out(GPIOOUT_Sys0_S2[0]), .en(GPIOOEN_Sys0_S2[0]), .PU(GPIOPU_Sys0_S2[0]), .PD(GPIOPD_Sys0_S2[0]), .PAD(PAD_GPIO_Sys0_S2[0]));
	dio dio_Sys0_S2_IO0_1( .in(GPIOIN_Sys0_S2[1]), .out(GPIOOUT_Sys0_S2[1]), .en(GPIOOEN_Sys0_S2[1]), .PU(GPIOPU_Sys0_S2[1]), .PD(GPIOPD_Sys0_S2[1]), .PAD(PAD_GPIO_Sys0_S2[1]));
	dio dio_Sys0_S2_IO0_2( .in(GPIOIN_Sys0_S2[2]), .out(GPIOOUT_Sys0_S2[2]), .en(GPIOOEN_Sys0_S2[2]), .PU(GPIOPU_Sys0_S2[2]), .PD(GPIOPD_Sys0_S2[2]), .PAD(PAD_GPIO_Sys0_S2[2]));
	dio dio_Sys0_S2_IO0_3( .in(GPIOIN_Sys0_S2[3]), .out(GPIOOUT_Sys0_S2[3]), .en(GPIOOEN_Sys0_S2[3]), .PU(GPIOPU_Sys0_S2[3]), .PD(GPIOPD_Sys0_S2[3]), .PAD(PAD_GPIO_Sys0_S2[3]));
	dio dio_Sys0_S2_IO0_4( .in(GPIOIN_Sys0_S2[4]), .out(GPIOOUT_Sys0_S2[4]), .en(GPIOOEN_Sys0_S2[4]), .PU(GPIOPU_Sys0_S2[4]), .PD(GPIOPD_Sys0_S2[4]), .PAD(PAD_GPIO_Sys0_S2[4]));
	dio dio_Sys0_S2_IO0_5( .in(GPIOIN_Sys0_S2[5]), .out(GPIOOUT_Sys0_S2[5]), .en(GPIOOEN_Sys0_S2[5]), .PU(GPIOPU_Sys0_S2[5]), .PD(GPIOPD_Sys0_S2[5]), .PAD(PAD_GPIO_Sys0_S2[5]));
	dio dio_Sys0_S2_IO0_6( .in(GPIOIN_Sys0_S2[6]), .out(GPIOOUT_Sys0_S2[6]), .en(GPIOOEN_Sys0_S2[6]), .PU(GPIOPU_Sys0_S2[6]), .PD(GPIOPD_Sys0_S2[6]), .PAD(PAD_GPIO_Sys0_S2[6]));
	dio dio_Sys0_S2_IO0_7( .in(GPIOIN_Sys0_S2[7]), .out(GPIOOUT_Sys0_S2[7]), .en(GPIOOEN_Sys0_S2[7]), .PU(GPIOPU_Sys0_S2[7]), .PD(GPIOPD_Sys0_S2[7]), .PAD(PAD_GPIO_Sys0_S2[7]));
	dio dio_Sys0_S2_IO0_8( .in(GPIOIN_Sys0_S2[8]), .out(GPIOOUT_Sys0_S2[8]), .en(GPIOOEN_Sys0_S2[8]), .PU(GPIOPU_Sys0_S2[8]), .PD(GPIOPD_Sys0_S2[8]), .PAD(PAD_GPIO_Sys0_S2[8]));
	dio dio_Sys0_S2_IO0_9( .in(GPIOIN_Sys0_S2[9]), .out(GPIOOUT_Sys0_S2[9]), .en(GPIOOEN_Sys0_S2[9]), .PU(GPIOPU_Sys0_S2[9]), .PD(GPIOPD_Sys0_S2[9]), .PAD(PAD_GPIO_Sys0_S2[9]));
	dio dio_Sys0_S2_IO0_10( .in(GPIOIN_Sys0_S2[10]), .out(GPIOOUT_Sys0_S2[10]), .en(GPIOOEN_Sys0_S2[10]), .PU(GPIOPU_Sys0_S2[10]), .PD(GPIOPD_Sys0_S2[10]), .PAD(PAD_GPIO_Sys0_S2[10]));
	dio dio_Sys0_S2_IO0_11( .in(GPIOIN_Sys0_S2[11]), .out(GPIOOUT_Sys0_S2[11]), .en(GPIOOEN_Sys0_S2[11]), .PU(GPIOPU_Sys0_S2[11]), .PD(GPIOPD_Sys0_S2[11]), .PAD(PAD_GPIO_Sys0_S2[11]));
	dio dio_Sys0_S2_IO0_12( .in(GPIOIN_Sys0_S2[12]), .out(GPIOOUT_Sys0_S2[12]), .en(GPIOOEN_Sys0_S2[12]), .PU(GPIOPU_Sys0_S2[12]), .PD(GPIOPD_Sys0_S2[12]), .PAD(PAD_GPIO_Sys0_S2[12]));
	dio dio_Sys0_S2_IO0_13( .in(GPIOIN_Sys0_S2[13]), .out(GPIOOUT_Sys0_S2[13]), .en(GPIOOEN_Sys0_S2[13]), .PU(GPIOPU_Sys0_S2[13]), .PD(GPIOPD_Sys0_S2[13]), .PAD(PAD_GPIO_Sys0_S2[13]));
	dio dio_Sys0_S2_IO0_14( .in(GPIOIN_Sys0_S2[14]), .out(GPIOOUT_Sys0_S2[14]), .en(GPIOOEN_Sys0_S2[14]), .PU(GPIOPU_Sys0_S2[14]), .PD(GPIOPD_Sys0_S2[14]), .PAD(PAD_GPIO_Sys0_S2[14]));
	dio dio_Sys0_S2_IO0_15( .in(GPIOIN_Sys0_S2[15]), .out(GPIOOUT_Sys0_S2[15]), .en(GPIOOEN_Sys0_S2[15]), .PU(GPIOPU_Sys0_S2[15]), .PD(GPIOPD_Sys0_S2[15]), .PAD(PAD_GPIO_Sys0_S2[15]));
	wire [0:0] scl_i_Sys0_SS0_S0;
	wire [0:0] scl_o_Sys0_SS0_S0;
	wire [0:0] scl_oen_o_Sys0_SS0_S0;
	wire [0:0] PAD_i2c_cl_Sys0_SS0_S0;
	dio dio_Sys0_SS0_S0_IO0_0( .in(scl_i_Sys0_SS0_S0), .out(scl_o_Sys0_SS0_S0), .en(~scl_oen_o_Sys0_SS0_S0), .PU(1'b1), .PD(1'b0), .PAD(PAD_i2c_cl_Sys0_SS0_S0));
	wire [0:0] sda_i_Sys0_SS0_S0;
	wire [0:0] sda_o_Sys0_SS0_S0;
	wire [0:0] sda_oen_o_Sys0_SS0_S0;
	wire [0:0] PAD_i2c_da_Sys0_SS0_S0;
	dio dio_Sys0_SS0_S0_IO1_0( .in(sda_i_Sys0_SS0_S0), .out(sda_o_Sys0_SS0_S0), .en(~sda_oen_o_Sys0_SS0_S0), .PU(1'b1), .PD(1'b0), .PAD(PAD_i2c_da_Sys0_SS0_S0));
	wire [0:0] MSI_Sys0_SS0_S1;
	wire [0:0] PAD_MSI_Sys0_SS0_S1;
	di di_Sys0_SS0_S1_IO0_0( .in(MSI_Sys0_SS0_S1), .PU(1'b1), .PD(1'b0), .PAD(PAD_MSI_Sys0_SS0_S1));
	wire [0:0] MSO_Sys0_SS0_S1;
	wire [0:0] PAD_MSO_Sys0_SS0_S1;
	do do_Sys0_SS0_S1_IO1_0( .out(MSO_Sys0_SS0_S1), .PAD(PAD_MSO_Sys0_SS0_S1));
	wire [0:0] SSn_Sys0_SS0_S1;
	wire [0:0] PAD_SSn_Sys0_SS0_S1;
	do do_Sys0_SS0_S1_IO2_0( .out(SSn_Sys0_SS0_S1), .PAD(PAD_SSn_Sys0_SS0_S1));
	wire [0:0] SCLK_Sys0_SS0_S1;
	wire [0:0] PAD_SCLK_Sys0_SS0_S1;
	do do_Sys0_SS0_S1_IO3_0( .out(SCLK_Sys0_SS0_S1), .PAD(PAD_SCLK_Sys0_SS0_S1));
	wire [0:0] pwm_Sys0_SS0_S2;
	wire [0:0] PAD_pwm_Sys0_SS0_S2;
	do do_Sys0_SS0_S2_IO0_0( .out(pwm_Sys0_SS0_S2), .PAD(PAD_pwm_Sys0_SS0_S2));

//SoC Module Instantiation

soc_core_m1_b1 uut(
	.HCLK(HCLK), 
	.HRESETn(HRESETn),
	.Input_DATA(Input_DATA),
	.Input_irq(Input_irq),
	.Output_DATA(Output_DATA),
	.fdi_Sys0_S0(fdi_Sys0_S0),
	.fdo_Sys0_S0(fdo_Sys0_S0),
	.fdoe_Sys0_S0(fdoe_Sys0_S0),
	.fsclk_Sys0_S0(fsclk_Sys0_S0),
	.fcen_Sys0_S0(fcen_Sys0_S0),
	.GPIOIN_Sys0_S2(GPIOIN_Sys0_S2),
	.GPIOOUT_Sys0_S2(GPIOOUT_Sys0_S2),
	.GPIOPU_Sys0_S2(GPIOPU_Sys0_S2),
	.GPIOPD_Sys0_S2(GPIOPD_Sys0_S2),
	.GPIOOEN_Sys0_S2(GPIOOEN_Sys0_S2),
	.db_reg_Sys0(db_reg_Sys0),
		.scl_i_Sys0_SS0_S0(scl_i_Sys0_SS0_S0),
		.scl_o_Sys0_SS0_S0(scl_o_Sys0_SS0_S0),
		.scl_oen_o_Sys0_SS0_S0(scl_oen_o_Sys0_SS0_S0),
		.sda_i_Sys0_SS0_S0(sda_i_Sys0_SS0_S0),
		.sda_o_Sys0_SS0_S0(sda_o_Sys0_SS0_S0),
		.sda_oen_o_Sys0_SS0_S0(sda_oen_o_Sys0_SS0_S0),
		.MSI_Sys0_SS0_S1(MSI_Sys0_SS0_S1),
		.MSO_Sys0_SS0_S1(MSO_Sys0_SS0_S1),
		.SSn_Sys0_SS0_S1(SSn_Sys0_SS0_S1),
		.SCLK_Sys0_SS0_S1(SCLK_Sys0_SS0_S1),
		.pwm_Sys0_SS0_S2(pwm_Sys0_SS0_S2));




endmodule
