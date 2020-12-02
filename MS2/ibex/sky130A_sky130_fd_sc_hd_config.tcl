#Routing


set ::env(CLOCK_PERIOD) "10"
set ::env(FP_CORE_UTIL) 60

set ::env(SYNTH_MAX_FANOUT) 5

# Regression
set ::env(FP_CORE_UTIL) 65


set ::env(FP_ASPECT_RATIO) 1
#set script_dir [file dirname [file normalize [info script]]]
#set ::env(PDN_CFG) $script_dir/pdn.tcl 
#set ::env(FP_PDN_CORE_RING) 1

# Extra

set ::env(PL_TARGET_DENSITY) [ expr ($::env(FP_CORE_UTIL)-10) / 100.0 ] 

# Suggested Clock Period:
 set ::env(CLOCK_PERIOD) "10.0"
