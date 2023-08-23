# Usage with Vitis IDE:
# In Vitis IDE create a Single Application Debug launch configuration,
# change the debug type to 'Attach to running target' and provide this 
# tcl script in 'Execute Script' option.
# Path of this script: C:\v23.1\FEB_test\SDK\ARTY_Test_DDR_system\_ide\scripts\systemdebugger_arty_test_ddr_system_standalone.tcl
# 
# 
# Usage with xsct:
# To debug using xsct, launch xsct and run below command
# source C:\v23.1\FEB_test\SDK\ARTY_Test_DDR_system\_ide\scripts\systemdebugger_arty_test_ddr_system_standalone.tcl
# 
connect -url tcp:127.0.0.1:3121
targets -set -filter {jtag_cable_name =~ "Digilent Arty S7 - 50 210352B59CF7A" && level==0 && jtag_device_ctx=="jsn-Arty S7 - 50-210352B59CF7A-0362f093-0"}
fpga -file C:/v23.1/FEB_test/SDK/ARTY_Test_DDR/_ide/bitstream/download.bit
targets -set -nocase -filter {name =~ "*microblaze*#0" && bscan=="USER2" }
loadhw -hw C:/v23.1/FEB_test/SDK/ARTY_DDR/export/ARTY_DDR/hw/TestDDR_wrapper.xsa -regs
configparams mdm-detect-bscan-mask 2
targets -set -nocase -filter {name =~ "*microblaze*#0" && bscan=="USER2" }
rst -system
after 3000
targets -set -nocase -filter {name =~ "*microblaze*#0" && bscan=="USER2" }
dow C:/v23.1/FEB_test/SDK/ARTY_Test_DDR/Debug/ARTY_Test_DDR.elf
bpadd -addr &main
