// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2023.1 (win64) Build 3865809 Sun May  7 15:05:29 MDT 2023
// Date        : Mon Jul 31 10:24:49 2023
// Host        : CD-135239 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               c:/v23.1/FEB_test/FEB_test.gen/sources_1/ip/DDR_ila_0/DDR_ila_0_stub.v
// Design      : DDR_ila_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7s50fgga484-2
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "ila,Vivado 2023.1" *)
module DDR_ila_0(clk, probe0, probe1, probe2, probe3, probe4, probe5, 
  probe6, probe7, probe8, probe9, probe10, probe11, probe12)
/* synthesis syn_black_box black_box_pad_pin="probe0[28:0],probe1[2:0],probe2[0:0],probe3[127:0],probe4[0:0],probe5[15:0],probe6[0:0],probe7[127:0],probe8[0:0],probe9[0:0],probe10[0:0],probe11[0:0],probe12[3:0]" */
/* synthesis syn_force_seq_prim="clk" */;
  input clk /* synthesis syn_isclock = 1 */;
  input [28:0]probe0;
  input [2:0]probe1;
  input [0:0]probe2;
  input [127:0]probe3;
  input [0:0]probe4;
  input [15:0]probe5;
  input [0:0]probe6;
  input [127:0]probe7;
  input [0:0]probe8;
  input [0:0]probe9;
  input [0:0]probe10;
  input [0:0]probe11;
  input [3:0]probe12;
endmodule
