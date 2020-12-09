# Design
set ::env(DESIGN_NAME) "ibex_core"

set ::env(VERILOG_FILES) [glob $::env(OPENLANE_ROOT)/designs/ibex/src/*.v]

set ::env(CLOCK_PERIOD) "10.000"
set ::env(CLOCK_PORT) "clk_i"
set ::env(SYNTH_READ_BLACKBOX_LIB) 1


set ::env(RUN_MAGIC) 1
set ::env(RUN_ROUTING_DETAILED) 1
set ::env(FP_CORE_UTIL) 20
set ::env(SYNTH_STRATEGY) 0
set ::env(PL_TARGET_DENSITY) 0.4
set ::env(DIODE_INSERTION_STRATEGY) 3


set ::env(CLOCK_NET) "clk_i"
set ::env(CLOCK_NET) $::env(CLOCK_PORT)

# set ::env(FP_PIN_ORDER_CFG) $::env(OPENLANE_ROOT)/designs/ibex/pin_order.cfg

set filename $::env(OPENLANE_ROOT)/designs/$::env(DESIGN_NAME)/$::env(PDK)_$::env(STD_CELL_LIBRARY)_config.tcl
if { [file exists $filename] == 1} {
        source $filename
}

