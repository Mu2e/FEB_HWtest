// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2023.1 (win64) Build 3865809 Sun May  7 15:05:29 MDT 2023
// Date        : Thu Aug  3 18:37:11 2023
// Host        : CD-135239 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               c:/v23.1/FEB_test/FEB_test.gen/sources_1/ip/DAC_Ram/DAC_Ram_sim_netlist.v
// Design      : DAC_Ram
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7s50fgga484-2
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "DAC_Ram,blk_mem_gen_v8_4_6,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "blk_mem_gen_v8_4_6,Vivado 2023.1" *) 
(* NotValidForBitStream *)
module DAC_Ram
   (clka,
    wea,
    addra,
    dina,
    douta);
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME BRAM_PORTA, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE OTHER, READ_LATENCY 1" *) input clka;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA WE" *) input [0:0]wea;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA ADDR" *) input [7:0]addra;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA DIN" *) input [15:0]dina;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA DOUT" *) output [15:0]douta;

  wire [7:0]addra;
  wire clka;
  wire [15:0]dina;
  wire [15:0]douta;
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
  wire [15:0]NLW_U0_doutb_UNCONNECTED;
  wire [7:0]NLW_U0_rdaddrecc_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_bid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_bresp_UNCONNECTED;
  wire [7:0]NLW_U0_s_axi_rdaddrecc_UNCONNECTED;
  wire [15:0]NLW_U0_s_axi_rdata_UNCONNECTED;
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
  (* C_COUNT_18K_BRAM = "1" *) 
  (* C_COUNT_36K_BRAM = "0" *) 
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
  (* C_EST_POWER_SUMMARY = "Estimated Power for IP     :     2.87285 mW" *) 
  (* C_FAMILY = "spartan7" *) 
  (* C_HAS_AXI_ID = "0" *) 
  (* C_HAS_ENA = "0" *) 
  (* C_HAS_ENB = "0" *) 
  (* C_HAS_INJECTERR = "0" *) 
  (* C_HAS_MEM_OUTPUT_REGS_A = "0" *) 
  (* C_HAS_MEM_OUTPUT_REGS_B = "0" *) 
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
  (* C_INIT_FILE = "DAC_Ram.mem" *) 
  (* C_INIT_FILE_NAME = "no_coe_file_loaded" *) 
  (* C_INTERFACE_TYPE = "0" *) 
  (* C_LOAD_INIT_FILE = "0" *) 
  (* C_MEM_TYPE = "0" *) 
  (* C_MUX_PIPELINE_STAGES = "0" *) 
  (* C_PRIM_TYPE = "1" *) 
  (* C_READ_DEPTH_A = "256" *) 
  (* C_READ_DEPTH_B = "256" *) 
  (* C_READ_LATENCY_A = "1" *) 
  (* C_READ_LATENCY_B = "1" *) 
  (* C_READ_WIDTH_A = "16" *) 
  (* C_READ_WIDTH_B = "16" *) 
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
  (* C_WRITE_MODE_A = "WRITE_FIRST" *) 
  (* C_WRITE_MODE_B = "WRITE_FIRST" *) 
  (* C_WRITE_WIDTH_A = "16" *) 
  (* C_WRITE_WIDTH_B = "16" *) 
  (* C_XDEVICEFAMILY = "spartan7" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  (* is_du_within_envelope = "true" *) 
  DAC_Ram_blk_mem_gen_v8_4_6 U0
       (.addra(addra),
        .addrb({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .clka(clka),
        .clkb(1'b0),
        .dbiterr(NLW_U0_dbiterr_UNCONNECTED),
        .deepsleep(1'b0),
        .dina(dina),
        .dinb({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .douta(douta),
        .doutb(NLW_U0_doutb_UNCONNECTED[15:0]),
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
        .s_axi_rdata(NLW_U0_s_axi_rdata_UNCONNECTED[15:0]),
        .s_axi_rid(NLW_U0_s_axi_rid_UNCONNECTED[3:0]),
        .s_axi_rlast(NLW_U0_s_axi_rlast_UNCONNECTED),
        .s_axi_rready(1'b0),
        .s_axi_rresp(NLW_U0_s_axi_rresp_UNCONNECTED[1:0]),
        .s_axi_rvalid(NLW_U0_s_axi_rvalid_UNCONNECTED),
        .s_axi_sbiterr(NLW_U0_s_axi_sbiterr_UNCONNECTED),
        .s_axi_wdata({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
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
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 20176)
`pragma protect data_block
s/buh7KMPWyLqrfzprIEof9/+ExmGJafpTfrGxVltKdfVUoo5T0PnIyrXuCyNhu2Dwoe1htoXYiO
Niu3fiwwEvNf4XWd300Sjx/oRPTYs/KcLHyrw01ptP5bYBKFxGi724OItp0oYNPySZ4LntKsA817
Bjb6SfbBslEHe3J2CyX3L2rzDfmKm6i/G2Lx6Yd83ed9Q5FmOAht/i0aQ12UKVIkn7/2WLOn1n0R
hkXKjiOrSg/KwVsxx16Lv5ke0JKnrwLFiuCtpaySZYVxnaJYNlRhomd02g27AwdTNn01XBHKzO5V
X4BcaGHVMs9GA13rgSD98FDIIpdkf5f67QHhbj6iOyCrH/Z7l8jymeJ/GpeUkG9txBY698y3ai8n
f4knnZm0MU2JO4wppf2CEqSHtpaLje9gRW25mZe/CcWAxtXziwBkSgImz2QLW2X7tUruMcsMhqdl
rzZz7sDccDOlVCjjp9/pMVCXdVbl3Q6IQzVIB8sLDr22a6bXCkRJ5xEmg5V1KacpGgLBEUI1leiR
EFMAXnDxhqlS4y7wxYK5VtPN8Sf7TPBvHSHQ3BDzEibMNqSUBztlJR80PqM9m/W2K7VhE1tOt9Ut
xa/M0qhe9NEa/sZH8qdpYTEye6tgvyFDRZdNw1FsSPK0fAjd7oV+RGOHxVvJKHhQPYi4g0zEkU6v
BGzj64SQfGpHjBS6FnCOhp3UwcYXXQGy4nMcY6SA8iROvxi8XADlhjujm5FXzw/HPJo4Z6zazuZL
gY2BdQLZ2P/HM4dqmAI8F/Je+ujv74jUR/HhjUV/tZ5dPT4DSxqESQrtYuxnvllIrBfgHig0c2tP
x3iuIQKc2qP9bwlb9KeWHuy0qo3zivUtAB4Tgx0zroWy31PcBIjfKpqTVT/Fo/tiAkWZaOtu11I2
+7xKnSywK2O1TTV/vxIqvyc50hQAZUv2Zh4ic+OzQC+GJ25reg+p/uM9zD2Bce2DJ/ern7g4jJdr
0DbnHps7iF7zAhSUZCsldUVSK/DlTgnVePZ0aOlqCtXSuBB0Z5m1GUfizfJFbGb8bmblsfO/sZGZ
5kMrPqCZt47Wo1RJ583jNUZO/L8fRhbwdMGWAKzwkzrEaAOBIsce4zzF2qx0nLAiSjw+xOgArWnx
MXgg4m9ZwYR39ZmlE6t8D6rNP48HDTrEn+XropElElVCEPX/ohk9do+hnRYj8xEOb6oGLoaSyJGA
aRwBuZTAuuqzqrhqxUYUIqiIuc0fBZGbcWHxaPf4uLWop6+f7rV/paMClTFiyJMz9GGTtOqmvFNJ
fHN1NXxVs0DF3JTcE10QYMdvMCBdnDuib1wyIZCyRztF1lf1D/5ts663vW3cPP9YV3R+cBYommBR
klEr85g22mXATXV4XT2ouR0oMcJSB4YlkdAqSDzILJ7vKDkOUOEt+IW/NGpP0T3jHm/XIckooato
oyEqi0DTJvikwBaYrhRGkL652GAZKocz15UruLnWeedNz3KP9sHvMpzphrtoFqN99umeti0nGwjP
qvRVW7X7t2ypVpKMB00bNcFwYkP5z+2lu7VmogxdVITyRZRsaZfcuE7xnw4dnJtwcCt/px9qfGp6
8Rp1tLcNVegMOR9QiuVAdEoUJvoGLi+xZX0NxREBOTlTtZoBQJxUtGrQWpRKFTVDm4MvQPM42ZM+
/zva1vCfkuPA9LvL7dgXUCDB8bV8fLohPoHIMhaC08pwZtM5oSk23/J7yD4IXBbMj6brYtwZfKD+
Qomt0B8arN40H4Kj2o2Ys6Kf97+9Xi6G1qQPaGByLKJ/4vYDL9OXK0swA1Ga0vnnL6TrcUNiKtfU
FFQxfs0SZuIrjVYYhKPTmIxN4U0pLWWaaNITNryEjZtN6PWNRl16KqMTBeQdvi/qayOQ86W1DTAL
0OtGQlncvLW7OZ7LQ5RYEVnpRXLQMCqnr9WYxfcyhjfNNYxDycnkIHpWSMTMqBCzggRV8QexX+vN
RC9d2ft6WRLjeVwhaYgl0W2aPjT1KZV6gYSTYJYyL8Div6NSBI47qPIm7w2uLNvlBdJM/LIeCIyC
CNcd3pNxatMME2TijgDX+S6nWaDH/sI6CT59HGFfHHehlwVOH7Sm0qT1J2R3SdfCJtUUh0+Pk4UC
xrT+DQH21zk5KUDarPptJRB4ITLSeax30yI9vWu9K5v6DvBnTyeT8IW+LZBSiflKr/i8AosqbHLZ
wXswTko6AX7af4d4R7XEOL/mqTLYhOTjqUTzUC80sghphi0v2YlMA2Eqg+PTzIPn/NY3DbbnZGgv
pnHUuKxVC9PTWOumE9gkGLDgKv2PmCIHqsnOlyTU3pvxb4lFDJ6lWZmEAlxt41LfWtg6eF2YOcGD
ubdqJgCg433CrqKfH33LSkFyW15n4KfNefv0INS8nQDTIuzH4tWxDoXlYBI2vB3Ku0Iu+ltt+uU7
+m0YXwnEmzkSM00q7jhZyacWdMTQNBFTBOUf2NcgINCKMtMHWNWrYuB9SMKGXPkhF11YNrehNNDt
OkYcJAIZrOm68vHzXrkaDDy1nceNOwfpzpna9a/uVr+DpzKo++xU7IztqWJRG/00jzCRwJ4KpTtU
bTiqLfgKoiKselPjW7M6Ar6BSU2Tez10WnMyCGkB/oSiSJbcoesrZsKAW+tXpjqlmMgkLDA9288a
G2Lqh+ObifbuLOrSGuW8Qlpkb5bB/oMGHngxXOJSjR9OthuTrOEuW413vluSvJmv4BQEg6g9BxXs
T8B/cExabHJvoArjQqLk6LL3HtzY/H3Gr4qcqt5eMSJnjKB36UrAX6kbwJZRLbHYVibIGAYHoPMw
g9ZUYj8pnV2ltfvsSp+I+QCfMuH1YFjY5u6py1BNvd0pYLA1MQQlYQ04xs+oqlQmXqN1pbbK9x+w
dA5e28PRL34cP5OPITlUOEYM/7fWlZENBEwMrNMvoo7Q7Jg6+hh44WLY1cYgip8JJ8LcZiu46xyo
WpVwcMkOhKy/hJBeBpZfu4rw/NaIdRRYL6V+XNbLBCFd4RRBu47vIFN2UWuN4unUSWYaX039xb30
JV9Q9pnNSzU4CeeOl+8+ioICD4KeKy2aLyfsg4JBeLMjOPN5hMaMlGUsGpPCDlPO3mDk/oRKo/nJ
imnFijclrQzjpgA4h8YYB0Lj3bc64y0Rd3FRHChuR/IDkZMtJBzpwGMngzW+olVTMF+s1bK8lZ7P
JKU17GUsVztfVwePCmZf6k/U6PwwDmTnmEddQ9Lgz4oBQKqPJXL5I/C7dseXuyEYMRGC5HDn8sbf
TGXZH/kYSP2WH3SljQ4KttdYQsw9/E4+M/aupg/77WSTfIdDU1vACHH6PpjdoUpon7bKHacLoS8u
YaWC0KQgQdvvoWXTRO9/TgOH6PT5yW2UDPai+QSA//w8ihIlSq65GGCrsdE2ExkZ2vETeT0Bb0s1
IHDhWaIDUCbqfgKjN9scKb8BzfcP1tsYAEdVvS9Bh9bNL/yeSnnbsLazDqBiB43M+A8ftCMTNJC+
e5BzW8jFoUUwUR89QDdfYq5198uudPzeZaGIDd6UT/XV1jFKruDmkL6Od4/v+TH2p1+hhJBIwaEx
YgtS6mxvnxFKplmWKjVurnTMJxc9ttkfTD3hMpDX02vimsC9mbQzIIcTP/ysedkqstIpESrbpiVs
MeNyWapj3CxRkynu8qIqJkQAEzCklUJ1YMcwbkqygVuPvsFgw+3qKZ6CffccbygRQ2MdmkjiirOu
4j5FBaezRlimI8hHIjOEvf6tvRc7bWhw+EgnzCDqlLqGzGAC8IyoYXeAtT7rZsJAhg5IyDvs45XZ
laxmbSMzSbZqRij556Ve0Yu0bxcVAEz343pi74Agjr4dbQfQpFLMlNnY2NDE2Kho1GTFFM6BP4+D
/cTDeblwe4DdGeUgwvBVFfgfZgUlfY9hV8pPERe6LOma5gCzXtHH3xnkeWoRnRqvfQ3WLtSx0vNl
xZempVgUZ48QEQG4JatEUP2ZZp3QMGDdZ4Le9WXToB0byUodD069B9vLnpnSeLc2G5nkPeoYfTTG
5Sv9ey4/7QE1jkzy1myMTfn6LX67gbjH5zJlNb78MrE6F5GNXWKtjczqlmpEIdSMFnKjXWybGRhy
coUJRLftGpvdzbZ1FPKA5lwPc7YYqAPySUHBewK7n+o7WpZJIPEDLRHd8g7YYKxlrWijApoENgU8
0y5jDXdd4DpMiUktwlGy80AqsqS1syTwzEa0aBBNOAS9llbIeLe6s/xVoEPB4Y54HUx8u91V2/Qo
Yc/vdgrbdliyfCd8jYFb7msGZHVZtcjj/TYpUIdBkYwY2RrCTinZKCy4u/915JGn+KxM2cu0GgR3
4+GLy5khzTP2//Wq2yvpqnAxinMz/wfX+XdHKqkjbzGJUWF1mjG7dGscV9+LAgCXC2ax9w2vo47D
5YBpk4NSICdccKQj7088j87zq0+Ixvm5BbXJUHqQ8ZafAKK963kzdNCe9Mr8vXRtxjGS8v9bFpd/
eMYYCm8ZOusKfl8qhuCjn3InY51k1jcZ56nHABPu2+jgu11t+cBIGWeyD2sohK9EorE6t0Zyqi7v
pn47g0kZznWbq2hK6qWt3xp3kDm50GNYViIvSBbhFODTwUrk4vEtDmyzfT+Do65RiabY5cFwzOBt
UX/GNDcRtUX1pHvSDux6E8vbm8k1vml1u4njatgFEqWZXjy4ZApg/CI4ustK3S/i8d7wCgK+OpwI
64FVAa/e51fOudp/RljNrwayLzgpOpgJBt7b//kK2ymI30p/dI7WboUifeXnItRfyTfoOP1tuzu+
zr0CJqLU6XCTYNXU706/wCHGeij5j5J7bXH+KMqrB1nyoEWybN3km2VT2WfZSWpzEjHqr6ZJInaz
3yeIRo6R5ZrvRWNOLt9dnLRDiTJ4OBqr10jWNc1MO1qACZTTvk3zWzzVAQjF6MKbrRUuhvHPawYd
R4bkeqkENDS4d96m4/t0a9JoF3+4Yi6oaM6Ekg3QLpvLi1a916KlRYubtwflPbI2BnBRBibd5WyG
LgNc9wQjTv7Rvdab8qgj/UqwIk/YQhoCihbUnICbheqIc3lw3b1Z6JYfsFlPgTfhQK62nIhcBdiZ
bzE/gblvQ1slgk0FvPUxM9haEA0aX61k+4agSXvlkoH4zpW8iuz+qGa5PdzZ9fAJPiqgqyxYjUqd
s6bfix0S8v0EVRrDzK1YRT2mRS1kOiNi61VXx4e7NHTWVl2rQO2QRvJyTUUgQVzNgzjkDC5Hbp9n
vrQSNuS/mjCy0J9w6Cp2I7GckpAoEfFsd3DN8bv4MslklEv511hOCAcbg9j0kV4s9CPZNuUbAxXk
n/TQHWWkdwU5hy3dH8Nu5mjU54H/DnFXvvPgKYBU+9isaB2wkGXtfIPiouYrY6CGGrmzfUlQQvtT
ZL5zdU5m3zzZtRvh8adRPuBYQBGria3m29xC52bJk4rQl2nmut+0cpPTa+BANOqdqx4/3l3jn4kJ
kj0JQA1rcednxRsodH0vrromePHoPPbi6BWxCovATjambCYTaxylQEo/wI127ari0++2OMEjlaYG
U+lpX/JW7RvAZ6czeOHxqT+29gOCgDr4paZ4KauXdF0mveTcPyUGa3fZyz9anF9JKTQp2AoEG/NO
qcENa7RcZmF/AgfBRN5XjUjutAvk5j0XOHZ9+xnBGIg+Q2p/D0tU8Z9Kc3STkZf6uSVP80SaMU3h
j9gqEUiU60TIXbRemtwdKKeZZ2nJsaYHXYpCEHvC99fZzuHyRW4IQ+vtBog+0KChv9phdq+muEhA
X1pkX0uhvnaVZaMb8m6rwP3TVGWrzbAywZw9r11GAXwcYkokdL76Du4cNtWVlWifi0GroAtNhh0S
LYOfpy9bnav6rkNE1R7VP1ldrww3vYnYDeGRIbka8QpgC+sjQLrzVQblV32saqo/A1VPD8yeqWM4
nyMr2ZGlMhgu2S8BublHBeJt2CDwHqIxA0bWIYxZXwPlw1we4obvcnRySYY2NgJRuOLjHzbeOa5U
PZN/SaTHuqR4YHwLXLWDZVIlzDBZauIZwLeZvqIA1WD8xY1mynSxDN5I8agOklETMRwNYUVJDvxX
v5+vmcdBCahxOSIsjAVlXcDa3KMdSMUQC/7g/wzG9OJPge8vviQY5xOO+wOOUGv1oc73rRskHTJq
O+EkZCRGkhgvDpvRagMqTZguutWzMW4Xt67rgHZd0gsVcXF1cYtKtG6NU6m/kwhiz0+7zQpRRdwu
f/rKf01EKCk96qvb7FOSB3B1Id9ZIAM8cfIBa1IbGbHYhEb9Xe0eKL+D5XfGVo33an/Ip5FD2MK4
k04d/USShdm9rXzpeTfjZHgh2QDz/lan92otQSmVmpQj3DPsSP9pyvFDZcKf+HahK3bQm3rOcL01
o3s7kYRbb18w+JuuuELH9bP+vpyedQVS6wUMm1utR2u11OjWfX8+6YMAAG7w2308R9EO8AAmy1ON
UoN7F+v/hPr5MQzF5ktQ4fECVzUuUV21BOfXgnfl7LO2pLDpXMw0rQbMU6Ph88p4yDUqizbcmnRu
aAeiWOLvMUqXUsMLvOEbVPxhHiukzK7IPWAtyBhqg3MjpOT8C098F2fVwIRJmbN3w0sdy/b+SRHj
XjlvgwFiyR7D2GVKGCDKvgYXjwwGFMheLvn2F/gonZQKGg60qNIwIEJw9cTUCVCBj82wl2ufnCqD
GjXVhz1Nruo3qcg8PsXbUWItCO39A+aNL3rJfHq287qHZt6Ce5oKq38sA6f9qPMToY2uHVLUWrPK
pnbMBImiCvSdUG9FDOISPzREycPGPaCXMn37ULTAERTCcoGDqVQn30ZUhsE9RSBWTD2FmNUQeBJK
F2/h+atBjP8zPphuwv8UMju+eIIYm3ddNtvHnzPRjriMEcN7M1ilOoarX7lM1iqPk1kdScIdi2cK
/Hu7JM9JUo5gt1UYBzPo7tERgk0bsDMA0QNjf+2+js3CyBFH1WnkTDY61cKMTqyjOEK78UC+PgYX
36mGM3ynFeXsbiFdZKHAmrWbcQxIHE8GAN3SyuC2tx/gZlgKDeDx+pUkeFHoEVMEYGdLO4EPZNqg
iC9JAZC/kP3v2x3qiZKf8JfGB0Pj/mApZIf+rzn/4LMJyM3Or2OvVbCFVN2+ufYCQq+IRkDP6Tdg
GQ+tlnBMQ3uNPAd6iZrcwQMZyZA3UCXlqE8/AI35V/8KIo5cz4ykVcF6qx0K6IDyY5V9jLqkA6IF
KsZOZzcRAdVyIQAAQCzYD14tbYOPKKuIqk+oFpj3wFxM82Wtu+dq7VlYlzmx2exvCmoRMqS44zoC
x8M1Gvtunihz4B0f4B7Q8Ah0fwzSo3CwyNb3gNOUlSvuRNHa66jJAPh14v1Uqs+BpXaMYQgyvgnp
PssX2fX2uPIJ5BKOV3uOlY+RRTtZuyxipN8OosiMjB/VFrDsBG5NsqFS7faXcyxHpnndKkorRM8W
7jqj99LZ0L4IhKrd4A/Tsn9zkVNn9/1IuOpwW+h5cDaF6KxbPiANif7txYoUKNB1ByaKUIVLvFAF
57WnRxFUwkVIk9TpYrSSrMVvCb91qdMLmJPLM8bLg0/FmbWd6bjCcuSWngAAxvon5r6Xv5YCeY2q
Jsoncc/2tQeCMlAnLs2GsETRAO5MAx324W2hB7/OrDTKIXQkI3CwZWMZ+XJJ+7eNwVlVscpoUJjd
TrpSksmfWHnfkQDiMgWfgRDuYpk4i8QJMyoCwgGINWGwQm8lR/K4nfLxmYSzstUhyr2NJsT9oL9e
KjUCSFF0UwCaWiR62ShMbuLRoWbVwNhW0bU5RaowWYNzzChp4oQ07mEuIxBoN9muiRL7Xfj2/TVH
CIy8cUV76oGjw/BGmRXUG9+Gn84XKvSAmKaH7EVy0IXw1bn569QY3Uw+LG9zm3ljuXlckrN35IKf
vrnobWFS6IOx4BXopaSokpEfPBks+2q/IeKjhCIdFHHwlz0AsRMo6/I3DJpMmp7AsdaxIyJ1V2QR
o/I9V6tSN/JAgZdLBazO0EkJnSgQ4BQjRdDG+8EGGYXMSUcNiDq3It4dzi6j8cROJCofQfCaqdCT
bsn/8bo4xhFcOklD1DjQ7sQMbhDZG+nGNAUmZsSYjHKJ5sdxj5VjsQowf1suA+rfE3/r4CdEyENT
8Ko8GrbhS1GfQo5+qz5QcJBiWrSGDf8bBNsscHh+WVgpw37Jwm8lIYec1f1tfRIp6FWzhLjsotc5
ht4X1E9qRZByCPIQXGNNn0fMeemV8RO6FfBsJ9czEzTP1g+JHIvV25R0YiGXlrkIxej5OEpvUt1l
OImTcQljWCtiyjMjeyxdTY6/CsT3Gnks44UrqzfyOXpa5ioY2pITEm5JU4y1jG5sJAiXpLi8KfEn
xg+mf/FgNpF3vCEPPSoaztb9XMX1frbSjeqlUIXmC5lp+0Ea83rYyXoBVJ9ad/KEQVcWAlVAPA8E
4BAri2ve1OjJU4Ibwrp2Ea08HIjfkzEB0IJf+Krt0HegLxfwUOzS99fior9nC84Pn9aSyRD7dCPA
YIDfTPCJxN2Zkjd73luoeO7n8c5FyuFJ01zPXIpYSZu86dE6H4uuSTxYQoHZcc7IqiUdvkzIjPlE
DPvfAnPITYnHUXfNxK3qwjFeeVh1VcXq0P5Fth7fzd/GGmtAlcE3n6CpNR89JzcTDM9JIhYUSS/P
dxy/O+whraTyZ28fmy67QzV9MR2valykB3Ue54K6kP1xsB4SmwtMsWHZoPenBJsTpbXMxiaeoo1/
iQe5Rv3FMd8/ZHYVbF89GnUB1Kc2xFUVXxjuHFMLXYz+SZLSWLKB0rHbcW+h4VR9PGOxy0IIVSEL
Lsa9ycTL1xVbUKM41XL5LESpjX56mSL/PFOUABBJDyJ1o4GOHXNvV4KU3TZzXqnEy2rfjZwfyWb7
9V542dgruFMMJ8li3x5UEPiEzl0KlS8cFTsNPea6VosgFht/xeZkEDKZsc5DYxtm4oP2+V+F/LM+
RBpT6CqlZoVRiqzBL9XcHJ0hUK5cMJVp1aOGa/y5kXE+2OuWaETm6YwCptOvqjlQimxTqwV1s/+h
qHuVxPgPI/jJDFsGbUvz5QemiHeBbtHCtHFMCfG+WRCLLSQ1CR5rAVbopjZDb75UmDYAu840vX0j
MKmpkP/W7gGcz3dXk0s68W8zTh3WgrFGJj+D8rX2xRNAY5godPK1QPpWNDafvrC01YsOPQB0DN69
B6+tXzrU9g160MKEpuskyJbRYQYTPpKoa5zr6a06gZSs4h5G8AT6cgb4EYIPl2jUxqEh1rjg3bQr
HZNy8PMP7niHL1acY3czzXpbY5H2dI8WD8O+IEcUsQFQh5YBToke4WVt72b3Lfqa0sQ6d4TwlA1O
Y7aThttsYQtUBUXyy5d3JIUItR6LhRCH8qmypURGU5LsGqq5tketwGgjjxeKO62igAalKhl/O4nd
FLlECqkIxe7xOWFLPpaKiPLBJU5RqPn952rocZVqcxf26sl4fecII8G/sli5w0xMkOqlajOGLnup
rvX7XpVC9WxB5dMXNL8sqzEgiv3W8/hGA22wFkK8W8upjJLB4bHQgP0rN0HfF9jYwgM2Sv8ldCoj
UduOKw4RE8+LFF9o+UyfaXdeBv+gacgrhEzngEfZwZdgWfjSLxvMbcXhzobRP/oSWJWKd4K8Wlwb
+NqsIUzhjDPlx9lKf6Pl4dM2umsfZ7ixvRd+6RlLXXZiS4sbifCjBWntu2i7Aj3FwfRBRp/8oV5R
0M3UBwt24f7n4eHddWYVLVJd64DK1eHKcQ7bFTXDiidaQdWj2Wg2MyRZR3xtxGuVITdgRdszDwF6
ggaKw5rYOXPiV8RRrIMbvSQCcxy/p/YwAT3AwiJ6Bo9i259tPbMc7sEGkFCd1Aq/Kap13EwGQR5M
R0pgzLO9LapGCAicTcXIEbQO9M9fYcQLsbeFzxq92MoTZUuW83JwaCPhUqSQxVuM/j94vRBkh4A/
m2nklSU7prdfVjq7M/5BRHhtoz3uTSpymICRv24NqPdjQ6D6qfHPohZw5o1Cz3vFvxDU+WE/kQ1b
z3XWB7TvBp+jRDqvYLLqH/n0SR//hgZz4BEazHt74znU+wXmnnyUe31UOE/cuKFtBq6IpxHe7wEN
t7X0ktG40JKTVSVEL//ELq39CWDJiGUfrwn8dGvgLu8R5y/88gOjlOpPo1d/qyJQ4T0+MaD39Lnk
39LDq+DpnBE+vWKr/QyOTd8+nDpIGw38TzOQNtQOQcpr15s0x4co0C+3hkoxL0bTn+7N+XPaJn4K
a1T56DtYQyW1vTAvRhFCHBRI8NqJgIQzSCyFxNcIUg9i5fZmigVbIERavx+d6FiTKHvgrr+X2ffm
iQ7zBkv2CHrI89QQ1SxwcB3GStcux4ZCgyJKfTqXIlkbk90PQPqhS021HefQdy4yMOqeZNFCzpNo
duPJ0ywhBlN3aP5ujcpXSP/CRFqdDq9SiHJfYNh8+2nXeOUSCLi87DZk+7A3c5V6jXvf5jTa6Ngx
v09FXIMM9enTpa+b/GM/YPKZnG+FwzaY7sg5actPHU1W+S2dbJT3iTWsR7zsavF7HINOM7NCpkIQ
51ybi26YkyTnk0NoDcvurzx3uOs9eZuPFgQGbFkBLWo5/6y/FkPTliifNbM4CXX+Q2W5afStZo2p
iOGZh/w5uH99I7v3Xtj0UgHJ4rOAk266CGy/ccXgmT2QorFlpTUCkVQ0DK8x2epYAAAqAmofYgSg
RjBkNwVrBJ7YbN9TgqEPrYTpq7T0876kFFgXKd8e5358n80OWkWvTS6e7hCUO6HUg8J5i79h8HfL
qxruglbPxwDTKJ+HSQyWGfRVKKioGTPQ6BdXpwzkdCFfa/cUTvGdc4/koWO0xiCCnSDAyQPym/2s
fNmtVCe/SljMpR7Gshws4Gl/Y8NHV6yJnUOKtHs1zAEEqzMTrZHU8gJedsVkguqL+mI2gvXG2xvV
C0/Es3ym9ang9GJAWnRpV7sLrkZJAN0Ikctuw/086C92fsxRpEEe9Data3Vi5vieMEgfXLBn4ZKX
zMH3qLzC5GuTjCoMn8PygnqVeFwE0+qYhNY1OL/46beT35dTKQkl3q6cG8GoCDSlO4gnlKlyAHjt
+KL31ww6M/DYTJ2Nam3QjdB93gxSDiFDCXaYV41w3Bf9z6PoXQxlltG1pMPjgC9W02OHiyBqdIkI
EKdamrTdaQpKVsF64R0oTYw2fFcZ/acjSvgxEj1J/k7vcit+Xf0r4rofmqz6237tRSiUG44hDNYh
9MEzxXjKrPYcNVFzKsBmL0WDT/HzHJPCZytzx9e0kHYafywZC/8zclnDrfdP3tM5gV4TOygk43in
GLpKEior2maX+phoqS1+QQoLCE5PYPFmD1wvdV7/JlaQM7bph/o52eu6uBAis7aENjV0PaIHAtmO
wxIVOBfCjvh9sSemzEhhOlpNxzqy5Ht4R/7UM4ABNSfpFz49mf9L5XtI+azR8vDhVxtXsGOjJYTW
v9xKObxI/xAaLiNWfPFDFyx8lCCXQBPAvQxhYGdp6n7xftTy90fYVr4BHVKoGWK88Uqz75Xuf2oY
C2cxPRcWcwdtUKsxsFJX97FEb/BlC4Ez9WuGn6j5yS5EaJqu+XxGLxad64mwpczrbB91N2Q/v0yf
r9uCzn4IJH7jn4qAt72bC8jGx2E1S3kj0jP4BGP4zfvsZlSUkbyD9g8nuQSI/gDIqbEDWDZBYYAC
Y0VMeOPKoJKkAtAlwcJdbA9mD3CeFwBkcVZbRWutxrZiSyf/FquX/5l+W00HuRE8iRoKdJq490b1
2K8sASzevPnE6TOMzkGQRBEEwbofBEHYNjpBzbxjUKOXgpV8fHUVdzlCAGMaJnDmwhYuqcVzVpUH
7eKWFZgkdPOtEPGzWnksAvJUGl6DxH4bpottc4AIOHKOEw7TSkSjDLR+Oa8JN0bYrMWhqhY/nmDB
lFCFAC/Kc2eUpX5aM+sp+dWiboIJqlH2O2gsnE53VCjBtajOc65Lbyje7cndtgZcCOFNJAPz5Rzu
wYCjWzKAoL3jnT9aszMSyUrqbFHeCD3vs0OZlT2qAONMuZKPCWPooBKBI2ZiiKpv5Laqoz5PXjw9
SkedsPknykzMNCnWt4N5fb/A6uPQwDXFQWgVBStrKgFRpFPKxUxTKIiU8hMcTPnGPqcc05caS5PW
mhhdGUyDG7yOl33NsnKErG4b4EA0Xk1kcIdgdqPSRP3sch4poDyzMQwBGOBlkDb+STOkIqcfBkx0
5VfLw5uw52d5Q5ZS1gD9nK7z1wGdJ1EEuOMQEjHUw+ryqd+LbKMte4A6rCMuhOoMHkiQT6uzJElx
v2Hlw8kw8sdUQJ4YxF3ICd2iftkgoU0oxrgWEfJGiYFzJwtM32d7UMcEXXwKrqSegl2lzJLyOb20
ni9Qg/WrcwEOuBKdNe0wkXo4wuwBMEnsgReK4QUioyNCdXy6QzE2igMrjga+97vX3rTmXsPSbfpT
r9rZxgoTUttfKoFkWvdaKxUFUgjbXPfNv3t3Ln+KATReZToQJi0bJHfsb1ZAAlopnZXQRkF5lI4J
wIBad7fPBTPEZdb7PiQBf3Rk77JoSFzt8gyJGKSF6YKU7lb2pIQ5U+lotrMlwAkjPQcTvEQBtbhl
Fl+GOnjONOg7uDfUQ5Xp9sQ48Dv7wjDwqTBLpMYZMCy/NNf2H51XfDkrLWWq5ydE0HJ01t12Ysgv
9FAp6VNRrzdvP0AKSqfeLuhH+klr3VAP68xy46PBfUh5mom6yjYtYVSITXcwKG1UTQCTlLIao1AM
RIu+0dDmEO5ntFXDEfOkc9KXdkBnebY7vQZxnSdNNOs71dfYtc/4cT+Me6ToWL+EgxSJy+m+mBHl
hrE0E8cJ7djklZdELZIbshoBYCCr8v+1PiOJRQUNElfsrF0rdeJUESAIcI0JR6hVMO0s3wtXmDEh
BWB/xSYmea9eI9OYVWdK8QLFntHRLNZ9d5noQnllLuVc3UtKdt1Yfg9PpvI07NHykR4sNcHfFUfb
kDzt0YpRS4FbgD6HLqdQPSQlY5CUDGD4JHymImlS/kD7Wj5i75qwYfB7P/L4r2sMgZPkdmhRBoRD
mEAum1+FZPpzto4RMkVYGuORB1cz4aojKj4S2FAf//gklABMUb2rZrRn0jnAPvfxl78QkXR8Bt3G
/O5aXruIxMKYuoj66nSHGLLkiE8KL1P/hejZ0daNHyNTix0guWKzliusBrqAPGdy2ul5qE62NbEw
iGWyaevfh1gzL+Ahm1t8YqnDTvnj6l01iH95PaDtRyF/9h3rG10DUPDmhexEmjKU5cjXbtT98fGQ
2fzPq105mQNFvqtc/GVcbpqnlCe64S0Jpx83tl8DO5Rz9oo6Sxd1Aw6Ue3uhQRNM0ieXk0Oeei0w
NVdF4ABoRtUEg2GLb1nQZB1QESFcSO7G2SNswXr9hRT17ijK7Skm7kUM/EnyTJUDQZkesAZhdFlO
jrwV3JDlnYKGMpHT0gPxzHPoqniItx5xYAtsXCDxMi6/6rg7dT97D46qEeKOoQ3sDs6fKDdbxy0M
SkHEaT2ulyMPgXWmT3NLzF9MIEFg0o7LESSs7ij7PsT3YUx6inzkEbsHXR7s3w+0vyNFCOx4HS1R
hVk8IScYcalPn0is1MPXFFMrmOb34VNgYgrOu31BxyotSv7EFuKfsbyiH8DLfrrdq1uU1D5LZVVF
iOnuRHVKC5eq2UFR/RyfUklSX9u2Ksa0I+zzc1hN7Bu3jL8m/W3PWm789wDEE2xuR68BeumOJTxM
BCKJ+J5jrQ7K5pgFbpMpMUOiAxgfqpw1s+q+oGXLdZxfedx3/04yyLPVKHQxAQxSudLZrlXeOgkJ
Uy32ncdldIwS3HAb6LkgkXI2zZHUVPbRgrEmOEzCcDXkpc76Fx7yK6PUOsyoJm2T112tmX3p3NTU
+iI1hY0Gw1ESFRdTdxdrLaVd/fNaGmeRY8+FGgX/AajJa/ZJkW775UEQpptzLPyVpXjoPPUgiF61
jxgiwB/0uxiHoiXktD6uo7XErd/lL4HumulD9AOVP9670/X3bkzjJzskv0CimJrc31u2+TWEn5f+
4oAdfRpSAMUQ8fxk+I0aXYKzqfxdPGIbdBzvGRWxG4BM+0/C9ThZ56leBkuEfDO2/H7sbHs81JuS
I+C/uCVHyujPSC3hh20yswWYGFA4suuNaZHFwAGl1ilcLxWzR+ctq96dxsTdpbOanCH6c1vA3vd9
t15vOcXO9fBWn37hToWtvAiddxLyWIyfc9HzpbzeeYPcZUu5z6wDcQTRvQVqHGq7sFdzviVfjgVW
+d7nDkq2elx2z1jktrqQFKwYq2F2EyYf5Y+366fiGMUyuHCVsb5uUie4zfN6HqR/jGaR8fEy6k0g
mnuOG7cXe5INJH7qWA9WykdKwYBrnVkBDZKSyDU8oU34sT/lVYMaRDz7iLXUUHDCxfNxYJGBm1GX
NsVlxlvrMFf0C2P1h/lpYwkfr84y75zyrh8+BxSIHiHyULLM+aNKobOD1ElUrSPVDxwsY6z0HrTX
maSgjWPlkHbQfDV7oNPRRW1qiOpYRufYw9ulGza40vVOFas7P7k44yNGL9D6J9aawR/WUSjGTcVo
OgLjF4eu2h5hnviHJLccJf/boiKqyihN+mFQH7LMLA0eR32IBj5G2QeD1ZDthrSKbAcYNEu9misp
dXFozJ6XPsUwbScQH+4SIQm2l9e85cdEa/R2A154s9OxsEZ3Q7CvaWuQ3sZGiRywQxAYvAU4rls0
puLvBaOxOO2j5MP2v0LJXpd30UOEGdmIjxzWDvyyD7lOQXa2Xqoyy0ierbm2ttQn4ZEdnvWigOSm
gPuei6zcfBT4pgE9p0OKo9x43m4v/RNpVFGZ3tvGSas0ZEHsrD64gATHGiD3E3fJvv7Wp5LmwfMV
FVEsvHuA3WUbAZTwWc9809swxbDxcWyFZhb6JEaaNnemB/jOvWWjHg7TBWtM5tkpGO5CcDbU02Ut
D3fqJohy3+IH9BN/ibNXnJFF1nAppllHk1Uh81U/NGFC5nQK996WudbANBvu2gh+DbRn5zg24rVm
sSgSt/QYet3uZHuBoWfaYUtHxi/3fMlsVvpNAzHnoWXCInu2StMROiJfiXNungCWCWeUgvR39O/a
eKJIBn8sdqpcSvjqg5AnKufe6903JYjHpu9Wa287x/5FYYnbL+RVDoVWLQfgnVokHOQMlgf99/cg
iTsoNTS6jLol15Wn6g10XGmps7S2M7RoOCKgl+Tet7ZJz1CPRymaiHjYC/Yd0blN/6m4zGJi6l7+
mO0Y7aSGXMBfT1B9WJTS2ARJQytcyHFXXEKLyzoIauejn1VAX6JszS4CUFIa0uLB+Jj0amM19zDu
F4IIczk9itou2UB7SR5tMlw+ZX1yHBmgSltjtHhFCoZVfuLvH2heqcuBofUM17psANjQ70Q/hv6t
YJqVXPzsrw7K3eO0YjDukxd9aIAiqrWkSVWLSl6iJyFLeuHT/gBFWfhyVyHJCXowI0eg519WqV8B
84j/XFsJJfyE2US2uJ4iglWB3WuBDVmLhaKTxmVDn9lZLVtuWqt3kba18j9wyrPlqTJUouZLpYhW
M2CnJqFkX+Z4HNHxH/QwO0+pD5kdPyl9eAWnkQ33bfF/BWlrrRlvh4Sio39HckkK5LD/ly/2huzl
5I9XEdG9ph262yDza+t6W69uGDT2N0uIEjLkQRbX0sLv+HpzC+RqFR+kzcVjWaIdyPftM/IET1l4
6DK60myLRim3ztBekWYdB4nLiLJMm+20AFrZV+7ogLurIYR4/XoqXgJcdJQ374FUQBcbjHhno2j2
NfkshQCU33Nv9Uogmu5MVWGcPI0uwxiTWVtmeYi3vXf0WYDWmJpr8+//pGQlf9iO5QJWTywsAuYr
Z1ebctS45N7MzhxwbKNI6F/ioTWkLqf/1vo85to5ZuVJoyWk02KQ7mhNUCWNIjv43Q7Xv9Gif1ls
YYeGrcYKXUJSBxu9mCl5uy9JmqgUqbIlnfWCdUIGr8CKGbsRRl/bnaJwq+62AEQNX+pMzMTGRHcj
VGGqnpkQSERuq3GZ3LVACL7z9V0XKAhpTSd07yY50rA4ah8q3C0EwthZCPyBd4n1kWbezSRNDig+
DOTqBe1ekLFwV9iY5dQEH0CNQjOJkQEn5RpuLLq/rLqc8MTkcbXcqgKJ4apqSn7UNlG+Alr/49HX
pxDMWveIC6uLEi+4qs+u1oGDEpMXWfwQY6M9SuqwRoZBSKHFu37gSd1fWDtRwMK2xnO1IB4R21sE
R2FRaaE3WkIUxpia1LHxGJBZpXQlDmi0tlbZgkvqKhrYpIkfiKIGWPwY58MyHTMBEUZRrgQ+nPTy
Mwd35NbZYf9sxPWDlQmx/cTT3VMcSjY3DIl7t026i5NLMRdEyzP3KSzd9pp7MHzJxNebsDCMlOVe
fAW1sEbkBGpZRMzEPRRikZa7I+HZwGzWe2wb9h6qCQ/9yZ0KhpYbI18An/T92k9BcahmUYYRuvEL
sT1l16LvoXsIvEMJ5sQyF1EHpaWJLkLw0YAil+nOjlQVkCyvt4+0kcYgffEDMrJm2fqKQsmqGIln
mk8tqyiER6jVzF6yivJgOLjrurGi7XHml2S6BMS+jRHIjwrkKzXRxHABPptUyCfM7pZ14/pXovjW
heYuCqbqJYWeOA6Ss4hhRA6fYg5IWLCRfZX7pRiNtdOoU223jqVEslSy+hXH/vsedYe1iFGT299k
ynPmb2OhfRnFcDa5uHC0AX6Zen3i4QBSvindYyvybrUdkq1Ul0oJ2vkbYgqsKPkWvv1Xsr0YpAgD
X72wvKN0N9CDYziWg6Vw5U00vOwoiM6ccMsMM1riJhdLR7gTKVTi1Hnp61o/NIEFjANmsi1/WhI/
6ez4Lvd/Awh59pNYyrWG8titSF6gg8n5QuoEo9kdlwXXBOaq7M9LMNkNTzS3yW0+eUqTzP/WMRRr
3RdjsE4s/4WAjJH8DEM7nshShVyoT5X2CweNzs+AsC+UEGSp71hX1ytXpIOinsn1X6eNx+JZ1y9Q
IaSeqnQiHXMYdiQC4taCTy9Akv+aY9OAG99JFsoMmCimZL8Fmme/9Nb4u1jBRKM+1OQhso4L00Xv
fKJgJwsjgredJ+TsbFrsgVmdZKHlKNnaTXqQHHx+fu020J9N+q4lWQ4H7bw0a0dhOPdtPyJcLOf0
LxJQPf23mqQ4YmhxG+gNydETDnXfZu/X94pNo3U4GI1iKQ4LKwtl5O6w6Kx1FUhT8sciovKVo/ET
WsfwL8mIvq8z/143Lid+Ihgk89dM54dfq+eriXvING7k7DD2SJJeqPsjH9B6Lqll4wactcgwnB/U
0lV4Ohv11R8eQrLW2ZgK2de+A8Mj2jHlDVwQ+Oxpx2BWo1zfQs5ZfKimnHffQGzr4mAvDCZ0naLN
OBub+ayN/KsITbkvlf0cO8Qk1AwhonzIdQN79uqJENIS5fmIKHGVF08jO2fxqBSzoVCDasFoPKBG
YmnCgRZoQR7W/Ajg3Zix6a2m7vtSwaz9Ci3oL4uVCffJRZw2mcfRl41GI1w1/FclvhAzGYVBcaLK
6rqJpr/DIlDSkFjaaW/sJRHSqvCXTpfNP0zGOoLyV1GY1F0T1FXfEWs378F6doPXZW4g7ocPK2CV
ArIUQf5wOR4mrvfGYLk8dOo103vQ7hKLbyaJpjsnBxxdQNgmQ2jJVSaRrsA0SU/jfWr3wyB5nkJf
67DIjvW49PC+/5A6IoMQ6lQLOaPEgkm5yWjrG/RvQkbq01CbgTEbVTKEDuwsTYcE0Fporxf1Jkxr
v1PGcbmWaZl3NoIvv3kRGdWbmB+n7fhGx6UMd90aaruu9JsPZSmoHXqRGwuu2KxdRjDTyDSe/Zbe
Yh1Z1VBr9fQM5AML6nQg9VyPo1oYInukb6BgAN8I4q41Nub36UxcgfKpYeWbRHmFSAQIKxu54stb
Shh9b0iQQ71hSDyg0p6rmjST3flRbiPSK/+A0G4MyzPjlzu8H3Q/iYwweirqx9N6jHt6y5SiLfeZ
WzIAU43RHHeo+wWiBdTbJq7yJm9XTVKrHGlDihYoh/mhF7i8sVqLC54MSC3s3AjNnOeS5hQdNeRz
Em4scAH1ewQdu3y3YoqJVOLmU6zYTzZRN2gUhO+jvIzuzyCVxoeqTYRpn8ctyXYGj02THykHM9Y7
Kj3Ao+8bVrJoRtPNZBak8i472Jukz4Tup0LDCdmuMX0Z/9xXDQ527YOSWBHFPcPZ1c2NHlcjFpP1
Hu3QdmUyUJVS8loXOfgc+7t2M8QMFth6IJG0lnkAa4LsZPUJgcgTHf2byThBOk2pubnBHVkmB9FA
BEd0uT0VGMd9rzJQ2mAf7lSS6QnJry94JfE8x0M1tTQueWYsumfyEFnBl8kuzSJ8MOqNpKp7SoLW
q2q43flupOFZDLFd0dkZOb8LbB8n2ly6EMv5CNKoZ42mfjtT6qaMxOFH30dTQWoQK4ZG2vLoRiPp
mFfUaSc5/HoWvvu+6/Xk0J5sTifB3+SM+Cdua4uiGkP24S4KX3Qq4HybGGttFLiNxjKE3nt98w4F
bN4j7umfuDldRcLWoxggpzSQNtyR3wrSRTjw5S/D1lFyE8TJo5hgsX7KdmO+lngSGWj002klyQxM
3Ku8IfLxCu/b9ME1H0luK5wwQNOFmxjr/EPr8EPCGxPqpgKQFogW0P1XOv0ToLiRZ8oHD+RM39RQ
kZVF/DSSPIpZcqYGrzZBV6vqEp+AWyp3uHlffoqSeGmHIrPJwMSHf+JfxZpjADxoBARnT1qWeT1n
7vxU9JEfbzcadRbCwIYAmMxNbQgrmyooktbj50R6FE6pcNLqq9b42qxnsRLwkofxHl9vzzPn7t4A
b+S8dIAQSzKrnsTvj5Lu7qrZBfY0pPAaJxljqGc4NqMU1QsppKeKoEoEUf/t/zc5kesrtaBUY+zN
3MLfMhBh2+rsLfc2Hl7Lw93yZyxg0UVIdOxx/PIN0e4nrES0qWsE1/tyin705hK58wERN+G4JS9P
kNajkQQH8SrMkivf1PYzfKvba548ix2bTYq+LeqyGyow4XJ6/MpYFcJ9XThLHVHBWBqOX3mjBrCD
rxQQag9iv2f6UXqcYTnFu0AZtHzLGuCV+qTWh6/zd2S+DKZoqkeGbK3cFS+ZGXgvByXR8Urpx6+w
aMqBX2XHHVkQMvjlCGlxLe1lIv55QSG1XzcNcmx8Tt2bisfxlo7fZgDKZp1TptJMzQO8svYwVazJ
EBPOuw/5c8mR7/505w1WLfSWFFGTdNiJMzIPe/Rau8BbB9s82BDkbT+ysZs3+4POuW/CFqQRq8OS
wgU8yjOlwyedPDMc0Ph3nA4AaSQ9+aeST03gk5uuYDRYl/syiEhBFaqgsScX4Z0+rxtHjHkZvYjY
nURUbRCKLy3aaaS/ZMUKUmzJJGeFHXLHPYtiqn5v71RqgVAhsWVGt4edSLOtM7HiMow+gjcdEzfz
63Usn6sUn+g8tLIY+TkYNPffm9KZnQwJORL4gJbqY1cAH7Yd6C4Osvbl+b6SdwgzsSU6P91nmIMs
fnncD/ro+oLrhrDaW2CFksab4WuxUvMqaTItof0ptrIDJLfaWAaMNkY+uZgiKy5l7zgXmezHu/gY
E9s9vvlGY9ECPJvu9Nc980bKOMNm6j5IlHdjBX0I3mERmDS+8Rs90EEZBFCbkiFCdW4Lr+/d7SwI
YoYsdgKTpy/hQtA+Wz/EeLUq0PC6Mcp/252tTo5Epe8gnWlbqoSvt2JlYyiySinx1VhhSeCcfPrP
OKfVRcBf4uDoG8KrCLKaFvWKQMdk3mjBK9xDtR+PnS+dnOnPmQgUwxc6JLmZ7pPUi8zALrrGi5M5
fc+vxMz1SIO3IUoxWXo00RmKJVVNLxCC6Y7ZcymUbnzf5viEgJgzJFs3KGFRY1NFXjvWrD/HU7gM
XuMszLYTCv36VJCR9e/wGN+7NHV0ODDf3OY8hKArpcEfNP1822unKVsxhJRZ3QEugN8a8SPiQASR
mOulqdqxipfHspXO+MyD/sS0ujCXQLJScF5CZRfJhyqZeR9+0M3YFdeF5Fsxgk6WlrcH9rnzY6Hz
AZFsxYSKmY1MpupAyfUwElSHQ7eX/wn9OVp3pFaFZcxdSqb7cAvXHbw2RkD3Fqqnp1ZDLzf/plny
LSMjTPdUjH9PUO52n5VokU+Cn2Plq2VNQgEi7OsiCVmqxbQ/a2P9ZmLM/VycRJSc8Qd93Q7NuGl8
rkF5x8enNh0d8V/gBIrPenqQNWPjtNI8JU+lZUoxF0c91d2Kmm9/x9mZmYhPOUROxw1GJYfMHVfP
+sxd2GNIxyAhZP7BzebfTxEejfJmtaBSxfFBDMiK5UfwnCovApA5bDseDsQWDAnas9+qqoXgKpOt
4YKVs5lJZHSs9gUHZpzvV/vfVZDwFu2cWlZ88CQP29N0G+Or1u+FwQbVyHKJ6ehf3OA+UlzlU3aw
QIN7u2ODxdGUFNZcasyQfGCz4LNz+EAeFcAHr+sltHu9mOaSTNx/qCS744ptGjHbwK84NqdqL7G0
gC2HqVLfU2dMwBP16qcuQQ3NhCkMyhwrZjOFOvOZZomIjyUfNe6MRUOt6NxboYo7jgy6VrGodCJa
lz0nxQ2j4KMkAQ4qkBrQZLDr2dRMzd+vcou1nXOr7L28T9GX/z2ifxO1mL1Vj7ct4qb8ZDSMv/lV
//fZfVzd94mJrPNxF9Kcg5UwCj9399cNWP0sNwJ6oEZUPizhzi3Q+ePL4RVCBm9zoTUHX/YxoGoG
KjbDiuMbasZ5JbXFB3w4Yk0EeXY+DefFTXm8gMGoCNK1q6Qkcm3rJ/NBjFe7fpEAY4sxoOYYS9nq
blVnkBMpIl1GxUQSLZep2TWggtytCBbo3NrlqVe3J4ElYXjTv3sHZHkfwJjyL6/4jaJCU40UPw8G
LgzHk2la58d/bVv8onlh9Sr/g373IMRzlvUCFA8hd+6bz4fAxx5SbytRNw/46quiFF4RNg+CdKfD
h08Bg6gzUYXVLsDDrGBXVHVbhZT6FWn0ZYm0CM2qGfdu6lXMn1S7PKnq5LkeLelGDehNzIQiy23v
/VOeWBwhFCe1CRrMZFkUT9w9poC209kuEV+wUjeZaoT5Ulm1eZ75oUzZbf28r7NSOMvt6Uiy8e5t
evqMHQijET/Y5VymvLy5lysI4lYmAftOagOkjDnAULZO/yC559pYG2cCA/Mj4gUGoNB08e1+DsPJ
Kl6p+HV1TdSGZp37N86dIjLcOi2Duo7oYuQv/gzf0d94sZvlu9iUeIFc28hOSoeMWf4DpODKMsW9
O4shYBSitNVwyX+dbx/05ig+hHb5RLw09bzFPa3Pu5zJF4oZEf7Sjih3YO65FXkmJ+GTLUQfOYu6
jzvWsPKDybHQEn1Z9IWju6t65cp8SGC8JwKwL7Qv1eSp9bKYNWw8ZgIj24BvPoJcKrGsCDMP8Y9X
DZp/uJwCQ5kZewOQ5nUWWBYqeQneKWajwqz0uhikehsRtQbDf6IKnCTLEd9W3SbvVzgwOnaFF23F
phdSgESrnnNTzVCPxJ7spRxltuQ2ItnDiPaI0bLvosZg+n5VMCgfziZXQqc7sOf+HyljbIW+/LOO
Z758D3P4vcCLyf2OYzqFZj8PHfRIEILnYMZ7Fo6ChCj5JzOB/cnZe30kxYiTnIzA+CjTrN5IJjZ8
zuoszH3tzHMua6nCf0P36H0/PabiACp7jxid+CH2iM73zPojN0DwkkO+tbovKFOMpRFpmlhSwxmS
abqpQMOUXUWCP7gB521O6m89sriyo5vKNW3eMcHTV40kxERSgQphV2R9i4TJX+sFPorP3csSZB5o
tyb/IJiETtjlERthBeKvK6Xn9DK1DYVFofjsCFGvBtq4lj7hV+Q7Lot3Vw/4QbUg9IaWjdJxGjYI
LLi7CuFepflWyIsPUHgfUqt3LPv203FJ7gjo8f2MK8Iw1V45phuSnIvsPENPJKkJ4jasM/U5x3Ao
TV0HRoeVoKcHiJg+hSr9bJYa6Af4K4RxiKoxYU5o6vO1GDWbROzPMyMm1xSXYKt+zY2AJGuWMJ1+
SV1NBeiPX4vI/g+1wBZD20LPk5JmSSdhnN4VNeQ2zKWVc3zGhwfMy7zNB9epwulZ53HfiMR5UAVj
ZmTUTmkwj4t/1igG4brhlx+Ka33a4kTaacCC646vtkUJ73ZjmcGufbcLeXDJjg0LWyxHOTDSaGI8
7ZXHZ4vbRtjWJ54wVZYhlDY7/vGYRSaybttd8qmfIFprGMiErrhCVsy0qU6zU1zWoPjWA/KSFPtf
/rADvFhmQTAs0o4zx8Ck69yRl+L0sy2EJAKPSrlFSPOsO1n5ONFEMNQ5DxkmbzVfNAHsmkRJKR6W
4eaePcmma9ZeGmFX5T2H3PSDC5v3259AINW9Gt10AsGy4nmoh+D/05vqYaalFDb/7Asg6IobLbn2
iDMGO5HfbdbutVFOxJ0PmBIgMm98wTUrPkstWa7fUJfpWtPSTNteiNC7l4ECTFRQsGi/4X9hGsBG
O/7QEnUuYKsZjUkwXF3QaZTrthPPit83s/rhuyYQfOgfmm7O4By+d2RI7ukrZYI/2wzoW6jWjETd
mp5JUaE+hCSBe0jBNWJl1D1DdWxzA2lj6QyyvYWmL28bdgd9OFAgMgbP8lOpBvUFIslQ0NJXREkQ
DqyDQfK7YqLEbvDoMdeflaYSiskkRp2POovNXaYu9+OnMcfDAfNWG25hdOTnqHcQbFiODI2vAZdk
Y/BvqmIwS/5FHwTbr/0D0yV3kOZix0C7mQgWZljmMUaj9PYZp3XSAcPTtTrSbQrL8fXJHyz4NKPO
AuooNdsnIZM+CWF2JMtUgmacZ9VFIXz3qklo7XSnmALdKkx+ZkI0JEsB71g966OjBuagwDWGAqt8
r8zjC7yPeXvmSn+dzQdHhGtAoF6iBgcFs5JYn5BA1KlYclUuFmNgIjWWa2+RWCwREA7CG9W/yW04
0WIfrJCHMIAJLK/kBFzb8rBADQi7LAOObgNGH4Ubl1WAS7lAdeRNPpw3a5UDkWmUoB/2T6nG4aQB
VSTP3UgafNhUnWCrZ+TjQpTHsE+DxSKJ2xi4IXXn7quD5cMo59BY8CmmmwnI03usVqlkFmaaWn9y
a4d/38nYnBcQdoeNY+cbbrvah8zu1BKYHq8Tfztkq5SjGi6PceatCo9GpxwOdWV1XdjDumxa4RRW
1FoFzAOw8BOtQjTYbzEaeDU397z9BDoIcXMW34Arbjya1SaUmELb08KGJmbs6KChf+3xGuwZANWx
xECpc/bdQzP5EI9gcBxxRxSa6Fz7oSHvdsBi8VZHa+H+TXXSd4fy6TLLP/yrL6Gs5b1ZL7hRe9Aj
bnobL3ZsjHspOyOs49LiNssPYLO0oDM75zY0IItCoDfjiZGqu4Wb62Pt1pdZNzBdb/p+h7uVF5uD
LFRR6KaWoFC5dXDZQrAPMs2Uz+/1WuXWE3xdAAz8ORfRuBDodV3g8hwDFCUhywBDRTPT7VxNR/BZ
LCzuWhYt7h/KpzPrLmWk+bCunzwDKBYDVPqWcA4sxE6Y1if/dMojK1GLGZ9cv0z1+BxqBL8oydxZ
g+XZWBTdGdE8iBEu2JjRX2J5PMf5+jbiJSrU57Go9E/EnvUOyq8k/asboz1rO5NiSL1t/458+3Ma
FuZVWmUJUTGlFNIIS4U/7J5GyW04EmMY/4grZX8wb3VbgxKPSywMLxZDXQ32Qe8ZdG/9kvsUeHnT
TJM3padV5WG54B+OYIXXVFFYjW3T826dpcuQuNstSyVBokvabDR6/hzsNwZQ9+JSIRFA/OCz0xYX
1IwLi5niGeW3jCq9E9M7sNFuSe/zu8/+EURaSX9J0PM9ypmTwOSv5chPrdmX4oJYv74J4T/OPpYd
rsWnaRPLLUrlASHpiz/EYBi9yHABDW0QZRm82WMPaBVZMxLhu2+rqazI/+9CnDqtlmEM9+DdietI
VGVeudiTDK/64DktO8vFxHWCM4o/w3W2ZZp+RW5bHscLPqyvL5RQbVPCUD4cMvqh2xk1lCjeoCS9
ZxKIRm4qsTIEKzhDAYn1ryIP3mdeKwKsa8Ojq/XEv5UmwX/gKgR1IKCmlIl1ynILoPQNYPoqXDl8
Vjkw7+8CPoXtubBMUn3Pb/RwCYt/RTqFWnPh5fN0IKc6s1tqWyY1tKlPgMwzYqh4QTijGGkOv01D
Xw2MTqmA6UbaSkTveniGe3qkgvBx9L8sjVFKm1bdwvpLUyU3L8/ckIczAYhMBIG+NywuehOr6yBv
CITXof3FzIOx7YLh3AWhgXZQydOEnUw+ZD9MIXpyxmbXFUi+Rv7QdIaodcnBwtrIBKZRiKrmGHfL
Eh+pMmAVlTy1BMiw3Abcnw+EZDPIGS5tTPbiRe2mXUSMz9SGMWrymZyZo6MEHu0ZfTBn3UBKDBmx
Gvb6wG8Kbj4hwc0/9TVZUaPXcMLp3rx5yEPNXAweBcrTDgXl/Y3YYFMWqj/KhglDoL3qTIOjHHN0
YV79For69NLxcCHivQGq7/CsCCAYSnRw0Vsdd0K2Nbt0k7FkRDGz4RVBkLQhLtrevchZdmmP7Ttx
wsl9q5EtriNY/QUdC9F4PtBDFIlgT2DrjDqfVFr3seYpe3Bpi3RTC/kGEipOsMhw9uYwDImNg82C
lUbz2oXUGyU3vvy5qHjSoYjAaIA9QKMJxWUAhBH8JIRdVueeE93uoCTAypff1YmiZgvoz9ZUswqc
/uwpqaF2ssDi+L7QALoEE7l0dygBm849fOHGXF7umhHoAKhtrZcJx12ka46NwGOO8TMQJzr33vUo
dFiEi0Du1YaBvKynMUKxITGS0cNXzMONyKONautMw2udhuZWfXIaOIOOL8lqPWEKIkdfwgqcqUTs
5yG1c0ECsQxrY3EnWeHA/j0kHD2nAA2k/4WKKgb+6Yfzz2t62kdE3O3cA6/6WUBcB2YT5czvof6j
2XryQXzLrWNvou9me0hXUG6Pb0bFBsvFuhyYuUpblU4rEmglp5cSIMbJBAMh2sS1KXht5vd/CF7z
NhKL148OWGg7ORtGpauVvwjg5UhIowdNw89YgaS/KLrRrXOOSTombgHninsRfRm+6TTlxqBhofLw
Dmb1yDZ0iStbKcCtgL0NunHjQdMzwQGi0QhvmwOCcwRkk5F5lQBe+U4IV/45Qwre/Kem+fdiZWyq
sc2BzZXAbdAQgysNRQwfCcpkcRbIDjBbC+HB+hnYDn7ki2xijndobVrbWduMqwzkeAr74oPBtMxg
azGkDlqSKM2fRZ1OMYVZYlhh02J772bMB7bU80ZzEZVIFmypnRtI2WF+QL4pA4nVgimpeO3LCSuw
F4CiJtKQMxMV1w0pkEv+woFtF6frAO5p5aXcw6czMrYQ0v2V0kDZwTevHhjkFLXdlYI9lnSrPmD6
uYK1h8qmfJff2wsLPHlJjk/rmIQQ7M8WLphPFJ8QyrgvKA2s0c7QxUZA9XiHF4CxCAyac1fctH9s
ySa6h1NeJr9O0rypFCaONrHOetorpYlkBAkcOMheiK2uhOwdPOQpkOfXPn/BU5IxfnEe6+Wmjj/1
tsOS4Q4HnevbE67MYB0KlZ/SkMG2E7nC38BiwfKQSMj4x2eLAoLdzGpUBq4atW0DVP++cC36EYbX
FmHZQ9CeAQ1qEaXn1PnjZW4LnPDE5kSBPw9HqTl5nbVGeyQTeab1KULLj0SjdRTJfFyOFJaRw7uV
ovxRkAIDVH9abXWJc3hj9x41HAzenz3g8TAa8n3KyJ4WxJTXV14bUqVqOlad/GlPDaZatg9CMDMA
B53GT+zYUUwx658535qM3vRDGELDmi9cV13B9az2Dhpyz9F2WucKCKgOBVFczAII8r3fMNpCavHZ
Nc8bnv0ksXl58h0HWBUEtMYK47BMWVR+x+kAdFqP0L5Vn2kMyrviJ3rzDyoDvWyJ7Zq0GN+ViK8v
1mYjyTJhPa83fUsj41GS46xy+nsnnXu/H9tFbHs7Z8AMfA1HU3C9xkt0Aafz4Y+ER1vQs7O+ViQv
wzJ2I4/FerX+e/gAedNmouFccju3k5CMfBuoW/PjmltfSustJABAXOWxzenXFwG+m963r3FhaTJ2
3VmMnvwT0BUN7fzcHaOnKS4QbWtYRg8AZIjj9m/Uz5FX0LWah30m/R1n0VtYebjJHCVFDiP0WTLm
/nPe/fpXrdhTXqCvKsVK3KEW3qxfWC3HW9/vYlChLresBb+9LaDAaIDT79n56+Okmp2WyrPoMTDQ
UsvrwS/ekBizVlM6SRsk/IU0+Vr5LXGaL0LduxyDBFFqjeQBc9Fq0pjrNLonNWstxzEtLyJg3j5I
pYr8SAOmYYYrfJxPIhyoTcUw8yRnjgNjZP8MTCZhknGGIEu65+KA+2jGAsSNvth6M5xpkhKe5A/5
jvlHgqDg2TTziDuSw9Px/bet81NIoqfLGz3oHKZ8xTbcPYGe6foscbzNyF9qBikCTDlgGd5LObAg
s8+m4iams+zrW725Lte2yh75QaeUa3xM4cdIeB9s/urIS4y7+oHbE61iqYkkoqGjkufWqcgbPyr4
eBWfUHhMyKHMfaWXf70QKUID+2MPQBK7Vf883Zv/CBKzCZlPiJP9Xx2k9EXm8Hgf7kCBjhU5xlhS
MabyQCJPnjqTP4zk/tio/Tf9ptc5tnoyUgaYGrv4eQ0ipa6/FfwyUL808zEuEhQ8xbHWa/m3xk/u
IMCxI446k/r7ZMw02sBRFTQ4wPLgCOQtIAqHvhxOcJgpDeQ7yI3YGEXa+ZarOpugQpcu9na4l0T+
2/fOTdfVbwE+w5y+Lkfs9cBmObhFDArWkgWmNkAT6zi9qyoXUCKefllcEwIeKIKK8P+1qxlfy2cZ
LvIfaZmo/IxTg9Z3Zq2XlnXPm9K3UWAeV14mk6k1ShJYmzPWDHjXJkcyYNDVCW1CD+bGq6H0Nw==
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
