set script_dir [file dirname [file normalize [info script]]]

set ::env(DESIGN_NAME) IBEX_SoC
set ::env(FP_PIN_ORDER_CFG) $script_dir/pin_order.cfg

set ::env(PDN_CFG) $script_dir/pdn.tcl
set ::env(FP_PDN_CORE_RING) 1
set ::env(FP_SIZING) absolute
set ::env(DIE_AREA) "0 0 2920 3520"
set ::env(FP_CORE_UTIL) 25

set ::env(SYNTH_READ_BLACKBOX_LIB) 1


set ::env(RUN_MAGIC) 1
set ::env(RUN_ROUTING_DETAILED) 1
set ::env(SYNTH_STRATEGY) 0
set ::env(PL_TARGET_DENSITY) 0.4
set ::env(DIODE_INSERTION_STRATEGY) 20


set ::unit 2.4
set ::env(FP_IO_VEXTEND) [expr 2*$::unit]
set ::env(FP_IO_HEXTEND) [expr 2*$::unit]
set ::env(FP_IO_VLENGTH) $::unit
set ::env(FP_IO_HLENGTH) $::unit

set ::env(FP_IO_VTHICKNESS_MULT) 4
set ::env(FP_IO_HTHICKNESS_MULT) 4


set ::env(CLOCK_PORT) "HCLK"

set ::env(CLOCK_PERIOD) "10"

set ::env(PL_OPENPHYSYN_OPTIMIZATIONS) 0
set ::env(DIODE_INSERTION_STRATEGY) 0

# Need to fix a FastRoute bug for this to work, but it's good
# for a sense of "isolation"
set ::env(MAGIC_ZEROIZE_ORIGIN) 0
set ::env(MAGIC_WRITE_FULL_LEF) 1


set ::env(VERILOG_FILES) "[glob $::env(DESIGN_DIR)/src/*.v]"




#set ::env(VERILOG_FILES_BLACKBOX) "\
#	$script_dir/../../verilog/rtl/defines.v \
#	$script_dir/../../verilog/rtl/user_proj_example.v"

#set ::env(EXTRA_LEFS) "\
#	$script_dir/../../lef/user_proj_example.lef"

#set ::env(EXTRA_GDS_FILES) "\
#	$script_dir/../../gds/user_proj_example.gds"
