// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2023.1 (win64) Build 3865809 Sun May  7 15:05:29 MDT 2023
// Date        : Wed Aug  9 11:16:28 2023
// Host        : CD-135239 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               c:/v23.1/FEB_test/FEB_test.gen/sources_1/ip/AFE_DP_Pipeline/AFE_DP_Pipeline_sim_netlist.v
// Design      : AFE_DP_Pipeline
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7s50fgga484-2
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "AFE_DP_Pipeline,blk_mem_gen_v8_4_6,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "blk_mem_gen_v8_4_6,Vivado 2023.1" *) 
(* NotValidForBitStream *)
module AFE_DP_Pipeline
   (clka,
    wea,
    addra,
    dina,
    clkb,
    addrb,
    doutb);
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME BRAM_PORTA, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE OTHER, READ_LATENCY 1" *) input clka;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA WE" *) input [0:0]wea;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA ADDR" *) input [7:0]addra;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA DIN" *) input [111:0]dina;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME BRAM_PORTB, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE OTHER, READ_LATENCY 1" *) input clkb;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB ADDR" *) input [7:0]addrb;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB DOUT" *) output [111:0]doutb;

  wire [7:0]addra;
  wire [7:0]addrb;
  wire clka;
  wire clkb;
  wire [111:0]dina;
  wire [111:0]doutb;
  wire [0:0]wea;
  wire NLW_U0_dbiterr_UNCONNECTED;
  wire NLW_U0_rsta_busy_UNCONNECTED;
  wire NLW_U0_rstb_busy_UNCONNECTED;
  wire NLW_U0_s_axi_arready_UNCONNECTED;
  wire NLW_U0_s_axi_awready_UNCONNECTED;
  wire NLW_U0_s_axi_bvalid_UNCONNECTED;
  wire NLW_U0_s_axi_dbiterr_UNCONNECTED;
  wire NLW_U0_s_axi_rlast_UNCONNECTED;
  wire NLW_U0_s_axi_rvalid_UNCONNECTED;
  wire NLW_U0_s_axi_sbiterr_UNCONNECTED;
  wire NLW_U0_s_axi_wready_UNCONNECTED;
  wire NLW_U0_sbiterr_UNCONNECTED;
  wire [111:0]NLW_U0_douta_UNCONNECTED;
  wire [7:0]NLW_U0_rdaddrecc_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_bid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_bresp_UNCONNECTED;
  wire [7:0]NLW_U0_s_axi_rdaddrecc_UNCONNECTED;
  wire [111:0]NLW_U0_s_axi_rdata_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_rid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_rresp_UNCONNECTED;

  (* C_ADDRA_WIDTH = "8" *) 
  (* C_ADDRB_WIDTH = "8" *) 
  (* C_ALGORITHM = "1" *) 
  (* C_AXI_ID_WIDTH = "4" *) 
  (* C_AXI_SLAVE_TYPE = "0" *) 
  (* C_AXI_TYPE = "1" *) 
  (* C_BYTE_SIZE = "9" *) 
  (* C_COMMON_CLK = "0" *) 
  (* C_COUNT_18K_BRAM = "0" *) 
  (* C_COUNT_36K_BRAM = "2" *) 
  (* C_CTRL_ECC_ALGO = "NONE" *) 
  (* C_DEFAULT_DATA = "0" *) 
  (* C_DISABLE_WARN_BHV_COLL = "0" *) 
  (* C_DISABLE_WARN_BHV_RANGE = "0" *) 
  (* C_ELABORATION_DIR = "./" *) 
  (* C_ENABLE_32BIT_ADDRESS = "0" *) 
  (* C_EN_DEEPSLEEP_PIN = "0" *) 
  (* C_EN_ECC_PIPE = "0" *) 
  (* C_EN_RDADDRA_CHG = "0" *) 
  (* C_EN_RDADDRB_CHG = "0" *) 
  (* C_EN_SAFETY_CKT = "0" *) 
  (* C_EN_SHUTDOWN_PIN = "0" *) 
  (* C_EN_SLEEP_PIN = "0" *) 
  (* C_EST_POWER_SUMMARY = "Estimated Power for IP     :     13.369 mW" *) 
  (* C_FAMILY = "spartan7" *) 
  (* C_HAS_AXI_ID = "0" *) 
  (* C_HAS_ENA = "0" *) 
  (* C_HAS_ENB = "0" *) 
  (* C_HAS_INJECTERR = "0" *) 
  (* C_HAS_MEM_OUTPUT_REGS_A = "0" *) 
  (* C_HAS_MEM_OUTPUT_REGS_B = "1" *) 
  (* C_HAS_MUX_OUTPUT_REGS_A = "0" *) 
  (* C_HAS_MUX_OUTPUT_REGS_B = "0" *) 
  (* C_HAS_REGCEA = "0" *) 
  (* C_HAS_REGCEB = "0" *) 
  (* C_HAS_RSTA = "0" *) 
  (* C_HAS_RSTB = "0" *) 
  (* C_HAS_SOFTECC_INPUT_REGS_A = "0" *) 
  (* C_HAS_SOFTECC_OUTPUT_REGS_B = "0" *) 
  (* C_INITA_VAL = "0" *) 
  (* C_INITB_VAL = "0" *) 
  (* C_INIT_FILE = "AFE_DP_Pipeline.mem" *) 
  (* C_INIT_FILE_NAME = "no_coe_file_loaded" *) 
  (* C_INTERFACE_TYPE = "0" *) 
  (* C_LOAD_INIT_FILE = "0" *) 
  (* C_MEM_TYPE = "1" *) 
  (* C_MUX_PIPELINE_STAGES = "0" *) 
  (* C_PRIM_TYPE = "1" *) 
  (* C_READ_DEPTH_A = "256" *) 
  (* C_READ_DEPTH_B = "256" *) 
  (* C_READ_LATENCY_A = "1" *) 
  (* C_READ_LATENCY_B = "1" *) 
  (* C_READ_WIDTH_A = "112" *) 
  (* C_READ_WIDTH_B = "112" *) 
  (* C_RSTRAM_A = "0" *) 
  (* C_RSTRAM_B = "0" *) 
  (* C_RST_PRIORITY_A = "CE" *) 
  (* C_RST_PRIORITY_B = "CE" *) 
  (* C_SIM_COLLISION_CHECK = "ALL" *) 
  (* C_USE_BRAM_BLOCK = "0" *) 
  (* C_USE_BYTE_WEA = "0" *) 
  (* C_USE_BYTE_WEB = "0" *) 
  (* C_USE_DEFAULT_DATA = "0" *) 
  (* C_USE_ECC = "0" *) 
  (* C_USE_SOFTECC = "0" *) 
  (* C_USE_URAM = "0" *) 
  (* C_WEA_WIDTH = "1" *) 
  (* C_WEB_WIDTH = "1" *) 
  (* C_WRITE_DEPTH_A = "256" *) 
  (* C_WRITE_DEPTH_B = "256" *) 
  (* C_WRITE_MODE_A = "NO_CHANGE" *) 
  (* C_WRITE_MODE_B = "WRITE_FIRST" *) 
  (* C_WRITE_WIDTH_A = "112" *) 
  (* C_WRITE_WIDTH_B = "112" *) 
  (* C_XDEVICEFAMILY = "spartan7" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  (* is_du_within_envelope = "true" *) 
  AFE_DP_Pipeline_blk_mem_gen_v8_4_6 U0
       (.addra(addra),
        .addrb(addrb),
        .clka(clka),
        .clkb(clkb),
        .dbiterr(NLW_U0_dbiterr_UNCONNECTED),
        .deepsleep(1'b0),
        .dina(dina),
        .dinb({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .douta(NLW_U0_douta_UNCONNECTED[111:0]),
        .doutb(doutb),
        .eccpipece(1'b0),
        .ena(1'b0),
        .enb(1'b0),
        .injectdbiterr(1'b0),
        .injectsbiterr(1'b0),
        .rdaddrecc(NLW_U0_rdaddrecc_UNCONNECTED[7:0]),
        .regcea(1'b0),
        .regceb(1'b0),
        .rsta(1'b0),
        .rsta_busy(NLW_U0_rsta_busy_UNCONNECTED),
        .rstb(1'b0),
        .rstb_busy(NLW_U0_rstb_busy_UNCONNECTED),
        .s_aclk(1'b0),
        .s_aresetn(1'b0),
        .s_axi_araddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arburst({1'b0,1'b0}),
        .s_axi_arid({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arlen({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arready(NLW_U0_s_axi_arready_UNCONNECTED),
        .s_axi_arsize({1'b0,1'b0,1'b0}),
        .s_axi_arvalid(1'b0),
        .s_axi_awaddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awburst({1'b0,1'b0}),
        .s_axi_awid({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awlen({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awready(NLW_U0_s_axi_awready_UNCONNECTED),
        .s_axi_awsize({1'b0,1'b0,1'b0}),
        .s_axi_awvalid(1'b0),
        .s_axi_bid(NLW_U0_s_axi_bid_UNCONNECTED[3:0]),
        .s_axi_bready(1'b0),
        .s_axi_bresp(NLW_U0_s_axi_bresp_UNCONNECTED[1:0]),
        .s_axi_bvalid(NLW_U0_s_axi_bvalid_UNCONNECTED),
        .s_axi_dbiterr(NLW_U0_s_axi_dbiterr_UNCONNECTED),
        .s_axi_injectdbiterr(1'b0),
        .s_axi_injectsbiterr(1'b0),
        .s_axi_rdaddrecc(NLW_U0_s_axi_rdaddrecc_UNCONNECTED[7:0]),
        .s_axi_rdata(NLW_U0_s_axi_rdata_UNCONNECTED[111:0]),
        .s_axi_rid(NLW_U0_s_axi_rid_UNCONNECTED[3:0]),
        .s_axi_rlast(NLW_U0_s_axi_rlast_UNCONNECTED),
        .s_axi_rready(1'b0),
        .s_axi_rresp(NLW_U0_s_axi_rresp_UNCONNECTED[1:0]),
        .s_axi_rvalid(NLW_U0_s_axi_rvalid_UNCONNECTED),
        .s_axi_sbiterr(NLW_U0_s_axi_sbiterr_UNCONNECTED),
        .s_axi_wdata({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_wlast(1'b0),
        .s_axi_wready(NLW_U0_s_axi_wready_UNCONNECTED),
        .s_axi_wstrb(1'b0),
        .s_axi_wvalid(1'b0),
        .sbiterr(NLW_U0_sbiterr_UNCONNECTED),
        .shutdown(1'b0),
        .sleep(1'b0),
        .wea(wea),
        .web(1'b0));
endmodule
`pragma protect begin_protected
`pragma protect version = 1
`pragma protect encrypt_agent = "XILINX"
`pragma protect encrypt_agent_info = "Xilinx Encryption Tool 2023.1"
`pragma protect key_keyowner="Synopsys", key_keyname="SNPS-VCS-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
aMT3usC6uizzcwnzOCX4OsS16Ob+YxFcsGovFpFklbnaIaD1S0lVdxenTwHPp6ByIEi+ehwr6Rgg
z/3AlTheI5NFTM8ihiMA18/wmUxI7EbaftJACA1LykUKCuj5myy0T+DACuv3sGYIZS38TZTZnnBC
FGAlvTZmRWs+JzneH3o=

`pragma protect key_keyowner="Aldec", key_keyname="ALDEC15_001", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
lR9ZerhYSAb39nzEkeYvhnwEs5t9y/+yTDf8KuoUtR1BGeHZq8pA/YxtjzQLtaOW1R1IQUb0FtSI
e3CYAb7WHYbIjcpw3vKHvW1SqcGn9CMGa556CYKmD2oF12Kow8xRaFvMSBUVxX7HsHxNWnRd+PU1
+C0YayU2KFIY/7Yl6cZ5luAzhw/6SW3PFYUIyyqWy5MCIXweHOwQR2IpQEdlDur5nluN7i7BeB+i
fxwwHh8TU/g7T4mhZFkiTuBKdLAtQOjxWxzqTMxgcuAjlTylY16FgMFOASdvvSbqBZJjbxMdVloU
rYjS8O/8rWktv8GXcaIdBJ2BRj01q7jsChsbwA==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VELOCE-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
Qvl63GHz9mq2xOB7elt/vAQ7URLGdD1Lkcz7f3Wtw31dwjjjbP62Ny/Jr6OmBIheWlgejx38qxAT
TrHiiEyjKmGcnPn1Tn2n+cH4RAxCbOFnCI9n6+YsYMTe9JkplGhGGr39SkFgJz0I2IKpPsuqTjCj
rhf49TAryNMQeRpREJA=

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VERIF-SIM-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
MA+9Ro+dh339m0iZrkKbqTKN8gQ5xkxN/SPCfhkOn+5jjgCTS5IOKLHil+HsZDjX333ebxnornwG
MOBxyEdFfLM8SA+bs2r41J/j0af2VVMmCM3hOh8JmZxB4X9Jg/glegNCbvwzqxMbOQNEy+zt7j5t
TFVD82RtPFmYVVYZZyll/WvAA+0aVpyjzLCIM1GznFky0RWLv65Wp4MJJnNRRrtG3muMznVO/u2s
tACsJ9jzv9M0IlMYjYH9BixhG6cZX02I4LEXXaPkhdOINlMMhsbArXtc9NphzmS4bY1/1yF1D6YD
EKLyS2Sr3HDl0O/lefN+jvfG8iKuVl55PNNrVQ==

`pragma protect key_keyowner="Real Intent", key_keyname="RI-RSA-KEY-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
wpMTg7STjFkUDhOqdNPa0FHXTnHQgKmhvqDv+rRVBvMiQ8O7u8oj7ibITq3o+jugJsMJ60B410gQ
JFTcqCJKYmYJvqi8rPLLOYDmFG6ZLP/Ixr3n62IyIaCeDltBahi3yV009QN0X+iuzuFCL+Y7g9ff
IvAgyBly+Z3Itv2H9EJMZPMl17Sa7IkgjmWqzVXIKNMKn0iDVYsQw6ZgzQDYQ8N8IvTIEggU3/lh
6Nf0hV0ev3qOv/2P+4w0U766Ux3yLuzPJSI7bKm3/ip9NjhOytxOiKKqVXhKG8dzbbuS5u3EE/eq
q6YxkL7gpvNltVqqBnJB6vHSyWrD6+MqsCtR9A==

`pragma protect key_keyowner="Xilinx", key_keyname="xilinxt_2022_10", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
Q7Q4SSp70lxFryaopuic9VVP/Ire0pSsPEIMYdURBAczC7ShkuYeV02U7L3BlAiyBE4vBKcwYSQd
cWiaj8sVP7q4kxoRHKxLV1R5PIO6l4DsLWE2E+1MLyUPME0w5KTular/oX8EPCJ5n/8VCtW7x4Vf
dpeyki1/IAPJkAyi3zVZKHzgKhEwnZaZZtZYuMWoPZMt4V38sAcE42Raf+7yfFWG5HO74JY6iEnW
gJeRk58K+avB/XLF2/j2RQZfjTYizrprT2tUMBK6e7DRWZZtk8AOcsMhUikev44IFGNbNXjP8BXC
0J3y3P7pCFT6l+saU83nRwi/H25fSA34diJtNw==

`pragma protect key_keyowner="Metrics Technologies Inc.", key_keyname="DSim", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
a/8ooC+s+6nfvfa1+oBhsvYWLJjFgp83DI1kNyOi5Am+ugPbGRmgGZudfyo6yw6Yd5gGbLm5aToQ
5G4cGF5HaXD5TU6A0ZZFMTIbzFLE76JMjjIxX8JcaJIZpSmrXqlru8l5gDINUEAmwUY3mRQnjcGJ
0Z+kMRH8iAEF+gEviPiFZSBbJeOPqivIS217kimQJX3BeNbNPQTP+GUidcRywpGMh5avxtA0kDRO
F9SoCSyTm9hr2v9hsK1IUAYQLb7n2/R+z5YNKNzt1oN4qgJH1wZfdI8if2K8+ohyOdnxrrgJOWdj
cOqr7cGqEOYfBMTIQeHVZzb7NGWVN+9B8XSUaQ==

`pragma protect key_keyowner="Atrenta", key_keyname="ATR-SG-RSA-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=384)
`pragma protect key_block
FLPvOUNRWNW2GU+FEGmt2XWthOT5bY/31DRbol2cUmEGNF6b2XzpCosNKGx/o2n6sQvGP39KRFCs
nJu0ihe2dUGee9nEZZUcpwPjnEfXVI3yJaRVYy8iL+rm59lXq0jX4sjAPieDvv8shgAnoXLTZGlq
K+2c1JhaHt+nFi27TDrYar/+P8nP1MhocOS7BjzCvSs0foEXj92/qD+71Sm/LqGr8cjlH2qTJJ8B
ynxoH6iT+bksVA2VbtPT9o6h1kJ/zwP4wcsL9l+qSlJhd4GI11JPux26DlNyIi41WmufQcfiT0PB
r6O9+0E9lV9ODwKdjaxfZRK29rjKeq2yr0jWhMV38XKKqHAJli7MIypGRXcCo+u89H87KgYt+ebw
s3foIqCe0JKR57WzI8VD6XdNtOL8eBxK539oemx4vkE0cGYECZKYru6A2hPeZOYDD5eyWSUlQl1R
EciK49WM8HnssyRVcmE6di6bISMbVi0TZG/v98bz+9UZa8DtqMVYH0tz

`pragma protect key_keyowner="Cadence Design Systems.", key_keyname="CDS_RSA_KEY_VER_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
fphquQOeFuqByo36Gh2C1zEC1J6u9swSMbMzsKldIvLm+SZ6/hr/N8KJ/G2vBABzX6UtbVuP1ZXx
AxdftP4Aqis1B3Bs6989aQG9eo0SOHA7r6aFLtFb3qoD5Pvqw4aVNU4z4EtTpFpn/jCWD21lKROf
q5X32HRfFq1jwqod+9vIbUNRRzz5y9VHvXfacZlxDazSPmcCF4hxB1KqWqT44KmYVkDedgkgnYgb
ZGidHnTb3W7C8tSqC9ac4kNJCL429QndtddweESJNlpX+65pt9Irok9pkOodwoj0QScswOIFjhBZ
/GrzZLQcFWiD3gXRU4DazzxQnGdRH4qEIRWziw==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP15_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
1lUYYHPCt1BUJOvcBbgMU2GSQiqfxItz4ntieMaenjrtsE9SLwaU6xB0tBl8Atw5yP/RRNww1kX/
9uZbTz5He3r9mPVt+mGxB4N3f9BbCrQRb4USVPgKO/+vWUfMQERGklScy0+fz75WuxH74CjRUoDI
8iyssb2cUNnfDe13jIoI8gM1w4w/Pkxkmb6Mef53QMxacHAWEZeytcH3fuL/adO263D8P90U3XJv
vBXJmbjkRVi9qzjBzfMxuOy2KbZaZgR3BLzaffIfFnMwg/Rb8sGls5pQsZv5jL2wk3+Bj3OXBYdd
pDyjGoalJBzObKzd/t15kNHwY4FXYFcZLQPncw==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-PREC-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
YRmSEzaa2WFVvMH1BwWc1TIUpVbzSEIP0VbI6n0sEgct/X4PiTfMQmK1jBVCaISIzwBxscKQwZOt
mb/nmINGg6I7ih39LSbBMtx6cdCUiyaLkPeRbqfyPpKhvnUIFmdKVvTd1dYzxeOeuDnhSVaBaAcN
3lngSg7lIbmhLIGjC29yQrBTiLArbVZi6IRGronMK51e3UrYa6GspsznhiuRcXjEb4bHKrJ2CM5Z
BUwA+E9949sQgyOagFZbLVle2ESbwBaoxcAPn2gxfRHlT0leqyLgUGDZLsfArzGzw9BTGzyEG2TR
XOrKFNYRfMXMrnGsBM7acIelY4LdAMgsKgDH/A==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 54576)
`pragma protect data_block
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
d0jlY3NpYLihEqxnMz+s3eahZhxp8aPAo4aO
`pragma protect end_protected
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;
    parameter GRES_WIDTH = 10000;
    parameter GRES_START = 10000;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    wire GRESTORE;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;
    reg GRESTORE_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;
    assign (strong1, weak0) GRESTORE = GRESTORE_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

    initial begin 
	GRESTORE_int = 1'b0;
	#(GRES_START);
	GRESTORE_int = 1'b1;
	#(GRES_WIDTH);
	GRESTORE_int = 1'b0;
    end

endmodule
`endif
