set_property SRC_FILE_INFO {cfile:c:/v23.1/FEB_test/FEB_test.gen/sources_1/ip/PLL_0/PLL_0.xdc rfile:../../../FEB_test.gen/sources_1/ip/PLL_0/PLL_0.xdc id:1 order:EARLY scoped_inst:inst} [current_design]
current_instance inst
set_property src_info {type:SCOPED_XDC file:1 line:57 export:INPUT save:INPUT read:READ} [current_design]
set_input_jitter [get_clocks -of_objects [get_ports clk_in1_p]] 0.063
