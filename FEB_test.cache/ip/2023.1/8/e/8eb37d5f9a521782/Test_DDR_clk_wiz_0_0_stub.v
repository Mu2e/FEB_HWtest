// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2023.1 (win64) Build 3865809 Sun May  7 15:05:29 MDT 2023
// Date        : Fri Jul 21 15:39:03 2023
// Host        : CD-135239 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ Test_DDR_clk_wiz_0_0_stub.v
// Design      : Test_DDR_clk_wiz_0_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7s50fgga484-2
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix(DDR_sysclock, DDR_200MHz, Clk_100MHz, resetn, 
  locked, clk_in1_p, clk_in1_n)
/* synthesis syn_black_box black_box_pad_pin="resetn,locked,clk_in1_p,clk_in1_n" */
/* synthesis syn_force_seq_prim="DDR_sysclock" */
/* synthesis syn_force_seq_prim="DDR_200MHz" */
/* synthesis syn_force_seq_prim="Clk_100MHz" */;
  output DDR_sysclock /* synthesis syn_isclock = 1 */;
  output DDR_200MHz /* synthesis syn_isclock = 1 */;
  output Clk_100MHz /* synthesis syn_isclock = 1 */;
  input resetn;
  output locked;
  input clk_in1_p;
  input clk_in1_n;
endmodule
