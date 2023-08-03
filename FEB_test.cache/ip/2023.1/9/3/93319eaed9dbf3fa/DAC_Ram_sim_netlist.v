// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2023.1 (win64) Build 3865809 Sun May  7 15:05:29 MDT 2023
// Date        : Thu Aug  3 18:37:11 2023
// Host        : CD-135239 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ DAC_Ram_sim_netlist.v
// Design      : DAC_Ram
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7s50fgga484-2
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "DAC_Ram,blk_mem_gen_v8_4_6,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "blk_mem_gen_v8_4_6,Vivado 2023.1" *) 
(* NotValidForBitStream *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix
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
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_blk_mem_gen_v8_4_6 U0
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
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 20272)
`pragma protect data_block
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
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
