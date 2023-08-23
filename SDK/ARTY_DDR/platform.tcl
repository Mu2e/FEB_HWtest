# 
# Usage: To re-create this platform project launch xsct with below options.
# xsct C:\v23.1\FEB_test\SDK\ARTY_DDR\platform.tcl
# 
# OR launch xsct and run below command.
# source C:\v23.1\FEB_test\SDK\ARTY_DDR\platform.tcl
# 
# To create the platform in a different location, modify the -out option of "platform create" command.
# -out option specifies the output directory of the platform project.

platform create -name {ARTY_DDR}\
-hw {C:\v23.1\ARTY_test\TestDDR_wrapper.xsa}\
-proc {microblaze_0} -os {standalone} -out {C:/v23.1/FEB_test/SDK}

platform write
platform generate -domains 
platform active {ARTY_DDR}
platform generate
platform config -updatehw {C:/v23.1/ARTY_test/TestDDR_wrapper.xsa}
platform generate -domains 
