// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2023.1 (win64) Build 3865809 Sun May  7 15:05:29 MDT 2023
// Date        : Wed Aug  9 10:53:14 2023
// Host        : CD-135239 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub c:/v23.1/FEB_test/FEB_test.gen/sources_1/ip/EVB_ila0/EVB_ila0_stub.v
// Design      : EVB_ila0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7s50fgga484-2
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "ila,Vivado 2023.1" *)
module EVB_ila0(clk, probe0, probe1, probe2, probe3, probe4, probe5, 
  probe6, probe7, probe8, probe9)
/* synthesis syn_black_box black_box_pad_pin="probe0[0:0],probe1[0:0],probe2[31:0],probe3[31:0],probe4[0:0],probe5[0:0],probe6[15:0],probe7[3:0],probe8[15:0],probe9[15:0]" */
/* synthesis syn_force_seq_prim="clk" */;
  input clk /* synthesis syn_isclock = 1 */;
  input [0:0]probe0;
  input [0:0]probe1;
  input [31:0]probe2;
  input [31:0]probe3;
  input [0:0]probe4;
  input [0:0]probe5;
  input [15:0]probe6;
  input [3:0]probe7;
  input [15:0]probe8;
  input [15:0]probe9;
endmodule
