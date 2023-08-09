// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2023.1 (win64) Build 3865809 Sun May  7 15:05:29 MDT 2023
// Date        : Wed Aug  9 11:10:22 2023
// Host        : CD-135239 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ DPRAM_1Kx16_sim_netlist.v
// Design      : DPRAM_1Kx16
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7s50fgga484-2
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "DPRAM_1Kx16,blk_mem_gen_v8_4_6,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "blk_mem_gen_v8_4_6,Vivado 2023.1" *) 
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
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_blk_mem_gen_v8_4_6 U0
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
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 19328)
`pragma protect data_block
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
5/evqq8=
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
