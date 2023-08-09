// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2023.1 (win64) Build 3865809 Sun May  7 15:05:29 MDT 2023
// Date        : Wed Aug  9 11:16:27 2023
// Host        : CD-135239 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ AFE_DP_Pipeline_sim_netlist.v
// Design      : AFE_DP_Pipeline
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7s50fgga484-2
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "AFE_DP_Pipeline,blk_mem_gen_v8_4_6,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "blk_mem_gen_v8_4_6,Vivado 2023.1" *) 
(* NotValidForBitStream *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix
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
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_blk_mem_gen_v8_4_6 U0
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
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 54672)
`pragma protect data_block
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
VWU8l058fVtv
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
