#
#Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
#Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
#
set_param project.singleFileAddWarning.threshold 0
set_param chipscope.maxJobs 4
set_param runs.launchOptions { -jobs 16  }
set_param synth.enableIncremental 0
set_param simulator.modelsimInstallPath C:/intelFPGA/20.1/modelsim_ae/win32aloem
set_param chipscope.flow 0
set part xc7s50fgga484-2
set board_part_repo_paths {}
set board_part {}
set board_connections {}
set tool_flow Vivado
set ip_vlnv xilinx.com:ip:xsdbm:3.0
set ip_module_name dbg_hub
set params {{{PARAM_VALUE.C_BSCAN_MODE} {false} {PARAM_VALUE.C_BSCAN_MODE_WITH_CORE} {false} {PARAM_VALUE.C_CLK_INPUT_FREQ_HZ} {300000000} {PARAM_VALUE.C_ENABLE_CLK_DIVIDER} {false} {PARAM_VALUE.C_EN_BSCANID_VEC} {false} {PARAM_VALUE.C_NUM_BSCAN_MASTER_PORTS} {0} {PARAM_VALUE.C_TWO_PRIM_MODE} {false} {PARAM_VALUE.C_USER_SCAN_CHAIN} {1} {PARAM_VALUE.C_USE_EXT_BSCAN} {false} {PARAM_VALUE.C_XSDB_NUM_SLAVES} {4}}}
set intf_params {}
set connectivity {}
set output_xci c:/v23.1/FEB_test/FEB_test.runs/impl_1/.Xil/Vivado-5032-CD-135239/dbg_hub_CV.0/out/result.xci
set output_dcp c:/v23.1/FEB_test/FEB_test.runs/impl_1/.Xil/Vivado-5032-CD-135239/dbg_hub_CV.0/out/result.dcp
set output_dir c:/v23.1/FEB_test/FEB_test.runs/impl_1/.Xil/Vivado-5032-CD-135239/dbg_hub_CV.0/out
set ip_repo_paths {}
set ip_output_repo C:/v23.1/FEB_test/FEB_test.cache/ip
set ip_cache_permissions {read write}

set oopbus_ip_repo_paths [get_param chipscope.oopbus_ip_repo_paths]

set synth_opts {}
set xdc_files {}
