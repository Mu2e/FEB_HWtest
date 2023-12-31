#-------------------------------------
# FEB Pinout -- Micol Rigatti
#-------------------------------------

#-------------------------------------
# Clocks
#-------------------------------------

set_property PACKAGE_PIN P15 [get_ports VXO_P]
set_property IOSTANDARD MINI_LVDS_25 [get_ports VXO_P]
set_property IOSTANDARD MINI_LVDS_25 [get_ports VXO_N]

#-------------------------------------
# uController Interface
#-------------------------------------

set_property PACKAGE_PIN N20 [get_ports {uCA[0]}]
set_property PACKAGE_PIN N19 [get_ports {uCA[1]}]
set_property PACKAGE_PIN P20 [get_ports {uCA[2]}]
set_property PACKAGE_PIN P17 [get_ports {uCA[3]}]
set_property PACKAGE_PIN R20 [get_ports {uCA[4]}]
set_property PACKAGE_PIN R19 [get_ports {uCA[5]}]
set_property PACKAGE_PIN T20 [get_ports {uCA[6]}]
set_property PACKAGE_PIN T19 [get_ports {uCA[7]}]
set_property PACKAGE_PIN U20 [get_ports {uCA[8]}]
set_property PACKAGE_PIN U19 [get_ports {uCA[9]}]
set_property PACKAGE_PIN V20 [get_ports {uCA[10]}]
set_property PACKAGE_PIN AA22 [get_ports {uCA[11]}]
set_property IOSTANDARD LVCMOS25 [get_ports {uCA[0]}]
set_property IOSTANDARD LVCMOS25 [get_ports {uCA[1]}]
set_property IOSTANDARD LVCMOS25 [get_ports {uCA[2]}]
set_property IOSTANDARD LVCMOS25 [get_ports {uCA[3]}]
set_property IOSTANDARD LVCMOS25 [get_ports {uCA[4]}]
set_property IOSTANDARD LVCMOS25 [get_ports {uCA[5]}]
set_property IOSTANDARD LVCMOS25 [get_ports {uCA[6]}]
set_property IOSTANDARD LVCMOS25 [get_ports {uCA[7]}]
set_property IOSTANDARD LVCMOS25 [get_ports {uCA[8]}]
set_property IOSTANDARD LVCMOS25 [get_ports {uCA[9]}]
set_property IOSTANDARD LVCMOS25 [get_ports {uCA[10]}]
set_property IOSTANDARD LVCMOS25 [get_ports {uCA[11]}]

set_property PACKAGE_PIN M19 [get_ports {uCD[0]}]
set_property PACKAGE_PIN M22 [get_ports {uCD[1]}]
set_property PACKAGE_PIN M21 [get_ports {uCD[2]}]
set_property PACKAGE_PIN N22 [get_ports {uCD[3]}]
set_property PACKAGE_PIN N21 [get_ports {uCD[4]}]
set_property PACKAGE_PIN P22 [get_ports {uCD[5]}]
set_property PACKAGE_PIN P21 [get_ports {uCD[6]}]
set_property PACKAGE_PIN T22 [get_ports {uCD[7]}]
set_property PACKAGE_PIN T21 [get_ports {uCD[8]}]
set_property PACKAGE_PIN U22 [get_ports {uCD[9]}]
set_property PACKAGE_PIN V22 [get_ports {uCD[10]}]
set_property PACKAGE_PIN V21 [get_ports {uCD[11]}]
set_property PACKAGE_PIN W22 [get_ports {uCD[12]}]
set_property PACKAGE_PIN W21 [get_ports {uCD[13]}]
set_property PACKAGE_PIN Y22 [get_ports {uCD[14]}]
set_property PACKAGE_PIN Y21 [get_ports {uCD[15]}]
set_property IOSTANDARD LVCMOS25 [get_ports {uCD[0]}]
set_property IOSTANDARD LVCMOS25 [get_ports {uCD[1]}]
set_property IOSTANDARD LVCMOS25 [get_ports {uCD[2]}]
set_property IOSTANDARD LVCMOS25 [get_ports {uCD[3]}]
set_property IOSTANDARD LVCMOS25 [get_ports {uCD[4]}]
set_property IOSTANDARD LVCMOS25 [get_ports {uCD[5]}]
set_property IOSTANDARD LVCMOS25 [get_ports {uCD[6]}]
set_property IOSTANDARD LVCMOS25 [get_ports {uCD[7]}]
set_property IOSTANDARD LVCMOS25 [get_ports {uCD[8]}]
set_property IOSTANDARD LVCMOS25 [get_ports {uCD[9]}]
set_property IOSTANDARD LVCMOS25 [get_ports {uCD[10]}]
set_property IOSTANDARD LVCMOS25 [get_ports {uCD[11]}]
set_property IOSTANDARD LVCMOS25 [get_ports {uCD[12]}]
set_property IOSTANDARD LVCMOS25 [get_ports {uCD[13]}]
set_property IOSTANDARD LVCMOS25 [get_ports {uCD[14]}]
set_property IOSTANDARD LVCMOS25 [get_ports {uCD[15]}]

set_property PACKAGE_PIN V18 [get_ports {GA[0]}]
set_property PACKAGE_PIN V19 [get_ports {GA[1]}]
set_property IOSTANDARD LVCMOS25 [get_ports {GA[1]}]
set_property IOSTANDARD LVCMOS25 [get_ports {GA[0]}]

set_property PACKAGE_PIN AA21 [get_ports CpldCS]
set_property IOSTANDARD LVCMOS25 [get_ports CpldCS]

set_property PACKAGE_PIN Y19 [get_ports CpldRst]
set_property IOSTANDARD LVCMOS25 [get_ports CpldRst]

set_property PACKAGE_PIN U17 [get_ports uCRd]
set_property IOSTANDARD LVCMOS25 [get_ports uCRd]

set_property PACKAGE_PIN AB21 [get_ports uCWr]
set_property IOSTANDARD LVCMOS25 [get_ports uCWr]

#-------------------------------------
# DEBUG Header
#-------------------------------------


set_property PACKAGE_PIN N18 [get_ports {DBG[1]}]
set_property PACKAGE_PIN U18 [get_ports {DBG[2]}]
set_property PACKAGE_PIN T17 [get_ports {DBG[3]}]
set_property PACKAGE_PIN R18 [get_ports {DBG[4]}]
set_property PACKAGE_PIN N17 [get_ports {DBG[5]}]
set_property PACKAGE_PIN T8 [get_ports {DBG[6]}]
set_property PACKAGE_PIN T7 [get_ports {DBG[7]}]
set_property PACKAGE_PIN T6 [get_ports {DBG[8]}]
set_property PACKAGE_PIN V5 [get_ports {DBG[9]}]
set_property IOSTANDARD LVCMOS25 [get_ports {DBG[9]}]
set_property IOSTANDARD LVCMOS25 [get_ports {DBG[8]}]
set_property IOSTANDARD LVCMOS25 [get_ports {DBG[7]}]
set_property IOSTANDARD LVCMOS25 [get_ports {DBG[6]}]
set_property IOSTANDARD LVCMOS25 [get_ports {DBG[5]}]
set_property IOSTANDARD LVCMOS25 [get_ports {DBG[4]}]
set_property IOSTANDARD LVCMOS25 [get_ports {DBG[3]}]
set_property IOSTANDARD LVCMOS25 [get_ports {DBG[2]}]
set_property IOSTANDARD LVCMOS25 [get_ports {DBG[1]}]


#-------------------------------------
# AFE Interface
#-------------------------------------

# ADC CLOCKS
set_property PACKAGE_PIN M4 [get_ports AFE0Clk_P]
set_property PACKAGE_PIN M3 [get_ports AFE0Clk_N]
set_property PACKAGE_PIN AA6 [get_ports AFE1Clk_P]
set_property PACKAGE_PIN AB6 [get_ports AFE1Clk_N]
set_property IOSTANDARD LVDS_25 [get_ports AFE1Clk_P]
set_property IOSTANDARD LVDS_25 [get_ports AFE1Clk_N]
set_property IOSTANDARD LVDS_25 [get_ports AFE0Clk_P]
set_property IOSTANDARD LVDS_25 [get_ports AFE0Clk_N]

# ADC D CLOCKS
set_property PACKAGE_PIN L1 [get_ports {AFEDCLK_P[0]}]
set_property PACKAGE_PIN Y6 [get_ports {AFEDCLK_P[1]}]
set_property PACKAGE_PIN K1 [get_ports {AFEDCLK_N[0]}]
set_property PACKAGE_PIN Y5 [get_ports {AFEDCLK_N[1]}]
set_property IOSTANDARD LVDS_25 [get_ports {AFEDCLK_N[1]}]
set_property IOSTANDARD LVDS_25 [get_ports {AFEDCLK_N[0]}]
set_property IOSTANDARD LVDS_25 [get_ports {AFEDCLK_P[1]}]
set_property IOSTANDARD LVDS_25 [get_ports {AFEDCLK_P[0]}]

# ADC F CLOCKS
set_property PACKAGE_PIN U4 [get_ports AFE1FCLK_P]
set_property PACKAGE_PIN U3 [get_ports AFE1FCLK_N]
set_property PACKAGE_PIN L8 [get_ports AFE0FCLK_P]
set_property PACKAGE_PIN K8 [get_ports AFE0FCLK_N]
set_property IOSTANDARD LVDS_25 [get_ports AFE1FCLK_N]
set_property IOSTANDARD LVDS_25 [get_ports AFE0FCLK_N]
set_property IOSTANDARD LVDS_25 [get_ports AFE1FCLK_P]
set_property IOSTANDARD LVDS_25 [get_ports AFE0FCLK_P]

# ADC Control

set_property PACKAGE_PIN AB10 [get_ports {AFECS[0]}]
set_property PACKAGE_PIN AA10 [get_ports {AFECS[1]}]
set_property IOSTANDARD LVCMOS25 [get_ports {AFECS[1]}]
set_property IOSTANDARD LVCMOS25 [get_ports {AFECS[0]}]

set_property PACKAGE_PIN AA8 [get_ports {AFEPDn[0]}]
set_property PACKAGE_PIN AB7 [get_ports {AFEPDn[1]}]
set_property IOSTANDARD LVCMOS25 [get_ports {AFEPDn[1]}]
set_property IOSTANDARD LVCMOS25 [get_ports {AFEPDn[0]}]

set_property PACKAGE_PIN AA7 [get_ports AFERst]
set_property PACKAGE_PIN AB9 [get_ports AFESDI]
set_property PACKAGE_PIN AA9 [get_ports AFESClk]
set_property PACKAGE_PIN V7 [get_ports AFESDO]
set_property IOSTANDARD LVCMOS25 [get_ports AFERst]
set_property IOSTANDARD LVCMOS25 [get_ports AFESClk]
set_property IOSTANDARD LVCMOS25 [get_ports AFESDI]
set_property IOSTANDARD LVCMOS25 [get_ports AFESDO]


# ADC Data

set_property PACKAGE_PIN AB5 [get_ports {AFE1Dat_P[7]}]
set_property PACKAGE_PIN AB4 [get_ports {AFE1Dat_N[7]}]
set_property PACKAGE_PIN AB3 [get_ports {AFE1Dat_P[6]}]
set_property PACKAGE_PIN AB2 [get_ports {AFE1Dat_N[6]}]
set_property PACKAGE_PIN AA2 [get_ports {AFE1Dat_P[5]}]
set_property PACKAGE_PIN AA1 [get_ports {AFE1Dat_N[5]}]
set_property PACKAGE_PIN W7 [get_ports {AFE1Dat_P[4]}]
set_property PACKAGE_PIN Y7 [get_ports {AFE1Dat_N[4]}]
set_property PACKAGE_PIN W3 [get_ports {AFE1Dat_P[3]}]
set_property PACKAGE_PIN Y3 [get_ports {AFE1Dat_N[3]}]
set_property PACKAGE_PIN V1 [get_ports {AFE1Dat_P[2]}]
set_property PACKAGE_PIN W1 [get_ports {AFE1Dat_N[2]}]
set_property PACKAGE_PIN U2 [get_ports {AFE1Dat_P[1]}]
set_property PACKAGE_PIN U1 [get_ports {AFE1Dat_N[1]}]
set_property PACKAGE_PIN T3 [get_ports {AFE1Dat_P[0]}]
set_property PACKAGE_PIN T2 [get_ports {AFE1Dat_N[0]}]
set_property IOSTANDARD LVDS_25 [get_ports {AFE1Dat_P[7]}]
set_property IOSTANDARD LVDS_25 [get_ports {AFE1Dat_P[6]}]
set_property IOSTANDARD LVDS_25 [get_ports {AFE1Dat_P[5]}]
set_property IOSTANDARD LVDS_25 [get_ports {AFE1Dat_P[4]}]
set_property IOSTANDARD LVDS_25 [get_ports {AFE1Dat_P[3]}]
set_property IOSTANDARD LVDS_25 [get_ports {AFE1Dat_P[2]}]
set_property IOSTANDARD LVDS_25 [get_ports {AFE1Dat_P[1]}]
set_property IOSTANDARD LVDS_25 [get_ports {AFE1Dat_P[0]}]
set_property IOSTANDARD LVDS_25 [get_ports {AFE1Dat_N[7]}]
set_property IOSTANDARD LVDS_25 [get_ports {AFE1Dat_N[6]}]
set_property IOSTANDARD LVDS_25 [get_ports {AFE1Dat_N[5]}]
set_property IOSTANDARD LVDS_25 [get_ports {AFE1Dat_N[4]}]
set_property IOSTANDARD LVDS_25 [get_ports {AFE1Dat_N[3]}]
set_property IOSTANDARD LVDS_25 [get_ports {AFE1Dat_N[2]}]
set_property IOSTANDARD LVDS_25 [get_ports {AFE1Dat_N[1]}]
set_property IOSTANDARD LVDS_25 [get_ports {AFE1Dat_N[0]}]
set_property PACKAGE_PIN M2 [get_ports {AFE0Dat_P[4]}]
set_property PACKAGE_PIN M1 [get_ports {AFE0Dat_N[4]}]
set_property PACKAGE_PIN N4 [get_ports {AFE0Dat_P[5]}]
set_property PACKAGE_PIN N3 [get_ports {AFE0Dat_N[5]}]
set_property PACKAGE_PIN P3 [get_ports {AFE0Dat_P[6]}]
set_property PACKAGE_PIN P2 [get_ports {AFE0Dat_N[6]}]
set_property PACKAGE_PIN L5 [get_ports {AFE0Dat_P[3]}]
set_property PACKAGE_PIN K5 [get_ports {AFE0Dat_N[3]}]
set_property PACKAGE_PIN K3 [get_ports {AFE0Dat_P[2]}]
set_property PACKAGE_PIN K2 [get_ports {AFE0Dat_N[2]}]
set_property PACKAGE_PIN H4 [get_ports {AFE0Dat_P[1]}]
set_property PACKAGE_PIN H3 [get_ports {AFE0Dat_N[1]}]
set_property PACKAGE_PIN J3 [get_ports {AFE0Dat_P[0]}]
set_property PACKAGE_PIN H2 [get_ports {AFE0Dat_N[0]}]
set_property PACKAGE_PIN P1 [get_ports {AFE0Dat_P[7]}]
set_property PACKAGE_PIN N1 [get_ports {AFE0Dat_N[7]}]
set_property IOSTANDARD LVDS_25 [get_ports {AFE0Dat_N[7]}]
set_property IOSTANDARD LVDS_25 [get_ports {AFE0Dat_N[6]}]
set_property IOSTANDARD LVDS_25 [get_ports {AFE0Dat_N[5]}]
set_property IOSTANDARD LVDS_25 [get_ports {AFE0Dat_N[4]}]
set_property IOSTANDARD LVDS_25 [get_ports {AFE0Dat_N[3]}]
set_property IOSTANDARD LVDS_25 [get_ports {AFE0Dat_N[2]}]
set_property IOSTANDARD LVDS_25 [get_ports {AFE0Dat_N[1]}]
set_property IOSTANDARD LVDS_25 [get_ports {AFE0Dat_N[0]}]
set_property IOSTANDARD LVDS_25 [get_ports {AFE0Dat_P[7]}]
set_property IOSTANDARD LVDS_25 [get_ports {AFE0Dat_P[6]}]
set_property IOSTANDARD LVDS_25 [get_ports {AFE0Dat_P[5]}]
set_property IOSTANDARD LVDS_25 [get_ports {AFE0Dat_P[4]}]
set_property IOSTANDARD LVDS_25 [get_ports {AFE0Dat_P[3]}]
set_property IOSTANDARD LVDS_25 [get_ports {AFE0Dat_P[2]}]
set_property IOSTANDARD LVDS_25 [get_ports {AFE0Dat_P[1]}]
set_property IOSTANDARD LVDS_25 [get_ports {AFE0Dat_P[0]}]


set_property BITSTREAM.CONFIG.CCLK_TRISTATE TRUE [current_design]
set_property CONFIG_VOLTAGE 2.5 [current_design]
set_property CFGBVS VCCO [current_design]
set_property BITSTREAM.STARTUP.STARTUPCLK JTAGCLK [current_design]





set_property CLOCK_DEDICATED_ROUTE FALSE [get_nets CpldRst_IBUF]



set_property C_CLK_INPUT_FREQ_HZ 300000000 [get_debug_cores dbg_hub]
set_property C_ENABLE_CLK_DIVIDER false [get_debug_cores dbg_hub]
set_property C_USER_SCAN_CHAIN 1 [get_debug_cores dbg_hub]
connect_debug_port dbg_hub/clk [get_nets Clk_100MHz]
