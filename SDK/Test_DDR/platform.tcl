# 
# Usage: To re-create this platform project launch xsct with below options.
# xsct C:\v23.1\FEB_test\SDK\Test_DDR\platform.tcl
# 
# OR launch xsct and run below command.
# source C:\v23.1\FEB_test\SDK\Test_DDR\platform.tcl
# 
# To create the platform in a different location, modify the -out option of "platform create" command.
# -out option specifies the output directory of the platform project.

platform create -name {Test_DDR}\
-hw {C:\v23.1\FEB_test\Test_DDR_wrapper.xsa}\
-proc {microblaze_0} -os {standalone} -out {C:/v23.1/FEB_test/SDK}

platform write
platform generate -domains 
platform active {Test_DDR}
bsp reload
platform generate
platform config -updatehw {C:/v23.1/FEB_test/Test_DDR_wrapper.xsa}
platform generate -domains 
platform active {Test_DDR}
domain create -name {linux_microblaze_0} -display-name {linux_microblaze_0} -os {linux} -proc {microblaze_0} -runtime {cpp} -arch {32-bit} -support-app {empty_application}
domain config -bif {}
domain config -boot {}
domain config -image {}
platform write
domain active {standalone_domain}
domain active {linux_microblaze_0}
platform generate -quick
platform generate -domains 
platform config -updatehw {C:/v23.1/FEB_test/Test_DDR_wrapper.xsa}
platform generate -domains 
platform generate -domains 
platform active {Test_DDR}
platform config -updatehw {C:/v23.1/FEB_test/Test_DDR_wrapper.xsa}
platform config -updatehw {C:/v23.1/FEB_test/Test_DDR_wrapper.xsa}
platform generate
platform generate
