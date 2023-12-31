##################################################################################################
## 
##  Xilinx, Inc. 2010            www.xilinx.com 
##  Tue Sep 19 14:21:06 2023

##  Generated by MIG Version 4.2
##  
##################################################################################################
##  File name :       example_top.xdc
##  Details :     Constraints file
##                    FPGA Family:       SPARTAN7
##                    FPGA Part:         XC7S50-FGGA484
##                    Speedgrade:        -2
##                    Design Entry:      VHDL
##                    Frequency:         320 MHz
##                    Time Period:       3125 ps
##################################################################################################

##################################################################################################
## Controller 0
## Memory Device: DDR3_SDRAM->Components->MT41K256M16XX-107
## Data Width: 16
## Time Period: 3125
## Data Mask: 1
##################################################################################################
############## NET - IOSTANDARD ##################



set_property INTERNAL_VREF  0.675 [get_iobanks 16]