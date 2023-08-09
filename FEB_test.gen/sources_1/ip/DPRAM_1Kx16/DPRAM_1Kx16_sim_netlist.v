// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2023.1 (win64) Build 3865809 Sun May  7 15:05:29 MDT 2023
// Date        : Wed Aug  9 11:10:23 2023
// Host        : CD-135239 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               c:/v23.1/FEB_test/FEB_test.gen/sources_1/ip/DPRAM_1Kx16/DPRAM_1Kx16_sim_netlist.v
// Design      : DPRAM_1Kx16
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7s50fgga484-2
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "DPRAM_1Kx16,blk_mem_gen_v8_4_6,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "blk_mem_gen_v8_4_6,Vivado 2023.1" *) 
(* NotValidForBitStream *)
module DPRAM_1Kx16
   (clka,
    wea,
    addra,
    dina,
    clkb,
    addrb,
    doutb);
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME BRAM_PORTA, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE OTHER, READ_LATENCY 1" *) input clka;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA WE" *) input [0:0]wea;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA ADDR" *) input [9:0]addra;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA DIN" *) input [15:0]dina;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME BRAM_PORTB, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE OTHER, READ_LATENCY 1" *) input clkb;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB ADDR" *) input [9:0]addrb;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB DOUT" *) output [15:0]doutb;

  wire [9:0]addra;
  wire [9:0]addrb;
  wire clka;
  wire clkb;
  wire [15:0]dina;
  wire [15:0]doutb;
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
  wire [15:0]NLW_U0_douta_UNCONNECTED;
  wire [9:0]NLW_U0_rdaddrecc_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_bid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_bresp_UNCONNECTED;
  wire [9:0]NLW_U0_s_axi_rdaddrecc_UNCONNECTED;
  wire [15:0]NLW_U0_s_axi_rdata_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_rid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_rresp_UNCONNECTED;

  (* C_ADDRA_WIDTH = "10" *) 
  (* C_ADDRB_WIDTH = "10" *) 
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
  (* C_INIT_FILE = "DPRAM_1Kx16.mem" *) 
  (* C_INIT_FILE_NAME = "no_coe_file_loaded" *) 
  (* C_INTERFACE_TYPE = "0" *) 
  (* C_LOAD_INIT_FILE = "0" *) 
  (* C_MEM_TYPE = "1" *) 
  (* C_MUX_PIPELINE_STAGES = "0" *) 
  (* C_PRIM_TYPE = "1" *) 
  (* C_READ_DEPTH_A = "1024" *) 
  (* C_READ_DEPTH_B = "1024" *) 
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
  (* C_WRITE_DEPTH_A = "1024" *) 
  (* C_WRITE_DEPTH_B = "1024" *) 
  (* C_WRITE_MODE_A = "WRITE_FIRST" *) 
  (* C_WRITE_MODE_B = "WRITE_FIRST" *) 
  (* C_WRITE_WIDTH_A = "16" *) 
  (* C_WRITE_WIDTH_B = "16" *) 
  (* C_XDEVICEFAMILY = "spartan7" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  (* is_du_within_envelope = "true" *) 
  DPRAM_1Kx16_blk_mem_gen_v8_4_6 U0
       (.addra(addra),
        .addrb(addrb),
        .clka(clka),
        .clkb(clkb),
        .dbiterr(NLW_U0_dbiterr_UNCONNECTED),
        .deepsleep(1'b0),
        .dina(dina),
        .dinb({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .douta(NLW_U0_douta_UNCONNECTED[15:0]),
        .doutb(doutb),
        .eccpipece(1'b0),
        .ena(1'b0),
        .enb(1'b0),
        .injectdbiterr(1'b0),
        .injectsbiterr(1'b0),
        .rdaddrecc(NLW_U0_rdaddrecc_UNCONNECTED[9:0]),
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
        .s_axi_rdaddrecc(NLW_U0_s_axi_rdaddrecc_UNCONNECTED[9:0]),
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
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 19280)
`pragma protect data_block
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
ci+z73Ge3rHnTm6couA=
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
