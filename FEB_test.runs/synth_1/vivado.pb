
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2$
create_project: 2default:default2
00:00:072default:default2
00:00:072default:default2
1503.2192default:default2
198.0162default:defaultZ17-268h px� 
�
Command: %s
1870*	planAhead2�
nread_checkpoint -auto_incremental -incremental C:/v23.1/FEB_test/FEB_test.srcs/utils_1/imports/synth_1/FEB.dcp2default:defaultZ12-2866h px� 
�
;Read reference checkpoint from %s for incremental synthesis3154*	planAhead2S
?C:/v23.1/FEB_test/FEB_test.srcs/utils_1/imports/synth_1/FEB.dcp2default:defaultZ12-5825h px� 
T
-Please ensure there are no constraint changes3725*	planAheadZ12-7989h px� 
p
Command: %s
53*	vivadotcl2?
+synth_design -top FEB -part xc7s50fgga484-22default:defaultZ4-113h px� 
:
Starting synth_design
149*	vivadotclZ4-321h px� 
�
@Attempting to get a license for feature '%s' and/or device '%s'
308*common2
	Synthesis2default:default2
xc7s502default:defaultZ17-347h px� 
�
0Got license for feature '%s' and/or device '%s'
310*common2
	Synthesis2default:default2
xc7s502default:defaultZ17-349h px� 
V
Loading part %s157*device2#
xc7s50fgga484-22default:defaultZ21-403h px� 

VNo compile time benefit to using incremental synthesis; A full resynthesis will be run2353*designutilsZ20-5440h px� 
�
�Flow is switching to default flow due to incremental criteria not met. If you would like to alter this behaviour and have the flow terminate instead, please set the following parameter config_implementation {autoIncr.Synth.RejectBehavior Terminate}2229*designutilsZ20-4379h px� 
�
HMultithreading enabled for synth_design using a maximum of %s processes.4828*oasys2
22default:defaultZ8-7079h px� 
a
?Launching helper process for spawning children vivado processes4827*oasysZ8-7078h px� 
`
#Helper process launched with PID %s4824*oasys2
240162default:defaultZ8-7075h px� 
�
%s*synth2�
yStarting RTL Elaboration : Time (s): cpu = 00:00:04 ; elapsed = 00:00:05 . Memory (MB): peak = 2449.277 ; gain = 412.617
2default:defaulth px� 
�
synthesizing module '%s'638*oasys2
FEB2default:default2K
5C:/v23.1/FEB_test/FEB_test.srcs/sources_1/new/FEB.vhd2default:default2
972default:default8@Z8-638h px� 
[
%s
*synth2C
/	Parameter DIFF_TERM bound to: 1 - type: bool 
2default:defaulth p
x
� 
^
%s
*synth2F
2	Parameter IBUF_LOW_PWR bound to: 0 - type: bool 
2default:defaulth p
x
� 
d
%s
*synth2L
8	Parameter IOSTANDARD bound to: DEFAULT - type: string 
2default:defaulth p
x
� 
�
,binding component instance '%s' to cell '%s'113*oasys2

GPI0DiffIn2default:default2
IBUFDS2default:default2K
5C:/v23.1/FEB_test/FEB_test.srcs/sources_1/new/FEB.vhd2default:default2
2352default:default8@Z8-113h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
PLL_02default:default2p
\C:/v23.1/FEB_test/FEB_test.runs/synth_1/.Xil/Vivado-23304-CD-135239/realtime/PLL_0_stub.vhdl2default:default2
62default:default2
PLL2default:default2
PLL_02default:default2K
5C:/v23.1/FEB_test/FEB_test.srcs/sources_1/new/FEB.vhd2default:default2
2462default:default8@Z8-3491h px� 
�
synthesizing module '%s'638*oasys2
PLL_02default:default2r
\C:/v23.1/FEB_test/FEB_test.runs/synth_1/.Xil/Vivado-23304-CD-135239/realtime/PLL_0_stub.vhdl2default:default2
192default:default8@Z8-638h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
PLL_AFE2default:default2r
^C:/v23.1/FEB_test/FEB_test.runs/synth_1/.Xil/Vivado-23304-CD-135239/realtime/PLL_AFE_stub.vhdl2default:default2
62default:default2
HF_PLL2default:default2
PLL_AFE2default:default2K
5C:/v23.1/FEB_test/FEB_test.srcs/sources_1/new/FEB.vhd2default:default2
2582default:default8@Z8-3491h px� 
�
synthesizing module '%s'638*oasys2
PLL_AFE2default:default2t
^C:/v23.1/FEB_test/FEB_test.runs/synth_1/.Xil/Vivado-23304-CD-135239/realtime/PLL_AFE_stub.vhdl2default:default2
172default:default8@Z8-638h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
Mux2default:default2M
9C:/v23.1/FEB_test/FEB_test.srcs/sources_1/new/ADC_mux.vhd2default:default2
312default:default2
ADC_Mux2default:default2
Mux2default:default2K
5C:/v23.1/FEB_test/FEB_test.srcs/sources_1/new/FEB.vhd2default:default2
2702default:default8@Z8-3491h px� 
�
synthesizing module '%s'638*oasys2
Mux2default:default2O
9C:/v23.1/FEB_test/FEB_test.srcs/sources_1/new/ADC_mux.vhd2default:default2
522default:default8@Z8-638h px� 
�
default block is never used226*oasys2O
9C:/v23.1/FEB_test/FEB_test.srcs/sources_1/new/ADC_mux.vhd2default:default2
762default:default8@Z8-226h px� 
�
%done synthesizing module '%s' (%s#%s)256*oasys2
Mux2default:default2
02default:default2
12default:default2O
9C:/v23.1/FEB_test/FEB_test.srcs/sources_1/new/ADC_mux.vhd2default:default2
522default:default8@Z8-256h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
DAC2default:default2I
5C:/v23.1/FEB_test/FEB_test.srcs/sources_1/new/DAC.vhd2default:default2
312default:default2

DACControl2default:default2
DAC2default:default2K
5C:/v23.1/FEB_test/FEB_test.srcs/sources_1/new/FEB.vhd2default:default2
2902default:default8@Z8-3491h px� 
�
synthesizing module '%s'638*oasys2
DAC2default:default2K
5C:/v23.1/FEB_test/FEB_test.srcs/sources_1/new/DAC.vhd2default:default2
572default:default8@Z8-638h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
CMD_Fifo2default:default2s
_C:/v23.1/FEB_test/FEB_test.runs/synth_1/.Xil/Vivado-23304-CD-135239/realtime/CMD_Fifo_stub.vhdl2default:default2
62default:default2
CmdFifo2default:default2
Cmd_FIFO2default:default2K
5C:/v23.1/FEB_test/FEB_test.srcs/sources_1/new/DAC.vhd2default:default2
1042default:default8@Z8-3491h px� 
�
synthesizing module '%s'638*oasys2
CMD_Fifo2default:default2u
_C:/v23.1/FEB_test/FEB_test.runs/synth_1/.Xil/Vivado-23304-CD-135239/realtime/CMD_Fifo_stub.vhdl2default:default2
222default:default8@Z8-638h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
DAC_Ram2default:default2r
^C:/v23.1/FEB_test/FEB_test.runs/synth_1/.Xil/Vivado-23304-CD-135239/realtime/DAC_Ram_stub.vhdl2default:default2
62default:default2
	ShadowRam2default:default2
DAC_Ram2default:default2K
5C:/v23.1/FEB_test/FEB_test.srcs/sources_1/new/DAC.vhd2default:default2
1162default:default8@Z8-3491h px� 
�
synthesizing module '%s'638*oasys2
DAC_Ram2default:default2t
^C:/v23.1/FEB_test/FEB_test.runs/synth_1/.Xil/Vivado-23304-CD-135239/realtime/DAC_Ram_stub.vhdl2default:default2
172default:default8@Z8-638h px� 
�
default block is never used226*oasys2K
5C:/v23.1/FEB_test/FEB_test.srcs/sources_1/new/DAC.vhd2default:default2
4382default:default8@Z8-226h px� 
�
%done synthesizing module '%s' (%s#%s)256*oasys2
DAC2default:default2
02default:default2
12default:default2K
5C:/v23.1/FEB_test/FEB_test.srcs/sources_1/new/DAC.vhd2default:default2
572default:default8@Z8-256h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2!
AFE_Interface2default:default2S
?C:/v23.1/FEB_test/FEB_test.srcs/sources_1/new/AFE_Interface.vhd2default:default2
312default:default2
AFE2default:default2!
AFE_Interface2default:default2K
5C:/v23.1/FEB_test/FEB_test.srcs/sources_1/new/FEB.vhd2default:default2
3162default:default8@Z8-3491h px� 
�
synthesizing module '%s'638*oasys2!
AFE_Interface2default:default2U
?C:/v23.1/FEB_test/FEB_test.srcs/sources_1/new/AFE_Interface.vhd2default:default2
752default:default8@Z8-638h px� 
a
%s
*synth2I
5	Parameter IOSTANDARD bound to: LVDS - type: string 
2default:defaulth p
x
� 
�
,binding component instance '%s' to cell '%s'113*oasys2 
OBUFDS_inst02default:default2
OBUFDS2default:default2U
?C:/v23.1/FEB_test/FEB_test.srcs/sources_1/new/AFE_Interface.vhd2default:default2
1642default:default8@Z8-113h px� 
a
%s
*synth2I
5	Parameter IOSTANDARD bound to: LVDS - type: string 
2default:defaulth p
x
� 
�
,binding component instance '%s' to cell '%s'113*oasys2 
OBUFDS_inst12default:default2
OBUFDS2default:default2U
?C:/v23.1/FEB_test/FEB_test.srcs/sources_1/new/AFE_Interface.vhd2default:default2
1682default:default8@Z8-113h px� 
�
,binding component instance '%s' to cell '%s'113*oasys2#
IDELAYCTRL_inst2default:default2

IDELAYCTRL2default:default2U
?C:/v23.1/FEB_test/FEB_test.srcs/sources_1/new/AFE_Interface.vhd2default:default2
1972default:default8@Z8-113h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
Auto_AFE2default:default2N
:C:/v23.1/FEB_test/FEB_test.srcs/sources_1/new/Auto_AFE.vhd2default:default2
202default:default2
	afe0_inst2default:default2
auto_afe2default:default2U
?C:/v23.1/FEB_test/FEB_test.srcs/sources_1/new/AFE_Interface.vhd2default:default2
2102default:default8@Z8-3491h px� 
�
synthesizing module '%s'638*oasys2
Auto_AFE2default:default2P
:C:/v23.1/FEB_test/FEB_test.srcs/sources_1/new/Auto_AFE.vhd2default:default2
352default:default8@Z8-638h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
febit2default:default2K
7C:/v23.1/FEB_test/FEB_test.srcs/sources_1/new/febit.vhd2default:default2
162default:default2
ffebit_inst2default:default2
febit2default:default2P
:C:/v23.1/FEB_test/FEB_test.srcs/sources_1/new/Auto_AFE.vhd2default:default2
702default:default8@Z8-3491h px� 
�
synthesizing module '%s'638*oasys2
febit2default:default2M
7C:/v23.1/FEB_test/FEB_test.srcs/sources_1/new/febit.vhd2default:default2
292default:default8@Z8-638h px� 
[
%s
*synth2C
/	Parameter DIFF_TERM bound to: 1 - type: bool 
2default:defaulth p
x
� 
^
%s
*synth2F
2	Parameter IBUF_LOW_PWR bound to: 0 - type: bool 
2default:defaulth p
x
� 
a
%s
*synth2I
5	Parameter IOSTANDARD bound to: LVDS - type: string 
2default:defaulth p
x
� 
�
,binding component instance '%s' to cell '%s'113*oasys2
IBUFDS_inst2default:default2
IBUFDS2default:default2M
7C:/v23.1/FEB_test/FEB_test.srcs/sources_1/new/febit.vhd2default:default2
392default:default8@Z8-113h px� 
d
%s
*synth2L
8	Parameter CINVCTRL_SEL bound to: FALSE - type: string 
2default:defaulth p
x
� 
c
%s
*synth2K
7	Parameter DELAY_SRC bound to: IDATAIN - type: string 
2default:defaulth p
x
� 
l
%s
*synth2T
@	Parameter HIGH_PERFORMANCE_MODE bound to: TRUE - type: string 
2default:defaulth p
x
� 
f
%s
*synth2N
:	Parameter IDELAY_TYPE bound to: VAR_LOAD - type: string 
2default:defaulth p
x
� 
a
%s
*synth2I
5	Parameter IDELAY_VALUE bound to: 0 - type: integer 
2default:defaulth p
x
� 
`
%s
*synth2H
4	Parameter PIPE_SEL bound to: FALSE - type: string 
2default:defaulth p
x
� 
m
%s
*synth2U
A	Parameter REFCLK_FREQUENCY bound to: 200.000000 - type: double 
2default:defaulth p
x
� 
e
%s
*synth2M
9	Parameter SIGNAL_PATTERN bound to: DATA - type: string 
2default:defaulth p
x
� 
�
,binding component instance '%s' to cell '%s'113*oasys2!
IDELAYE2_inst2default:default2
IDELAYE22default:default2M
7C:/v23.1/FEB_test/FEB_test.srcs/sources_1/new/febit.vhd2default:default2
532default:default8@Z8-113h px� 
_
%s
*synth2G
3	Parameter DATA_RATE bound to: DDR - type: string 
2default:defaulth p
x
� 
`
%s
*synth2H
4	Parameter DATA_WIDTH bound to: 14 - type: integer 
2default:defaulth p
x
� 
i
%s
*synth2Q
=	Parameter DYN_CLKDIV_INV_EN bound to: FALSE - type: string 
2default:defaulth p
x
� 
f
%s
*synth2N
:	Parameter DYN_CLK_INV_EN bound to: FALSE - type: string 
2default:defaulth p
x
� 
k
%s
*synth2S
?	Parameter INTERFACE_TYPE bound to: NETWORKING - type: string 
2default:defaulth p
x
� 
^
%s
*synth2F
2	Parameter IOBDELAY bound to: IFD - type: string 
2default:defaulth p
x
� 
[
%s
*synth2C
/	Parameter NUM_CE bound to: 2 - type: integer 
2default:defaulth p
x
� 
`
%s
*synth2H
4	Parameter OFB_USED bound to: FALSE - type: string 
2default:defaulth p
x
� 
d
%s
*synth2L
8	Parameter SERDES_MODE bound to: MASTER - type: string 
2default:defaulth p
x
� 
�
,binding component instance '%s' to cell '%s'113*oasys2)
iserdese2_master_inst2default:default2
	ISERDESE22default:default2M
7C:/v23.1/FEB_test/FEB_test.srcs/sources_1/new/febit.vhd2default:default2
832default:default8@Z8-113h px� 
_
%s
*synth2G
3	Parameter DATA_RATE bound to: DDR - type: string 
2default:defaulth p
x
� 
`
%s
*synth2H
4	Parameter DATA_WIDTH bound to: 14 - type: integer 
2default:defaulth p
x
� 
i
%s
*synth2Q
=	Parameter DYN_CLKDIV_INV_EN bound to: FALSE - type: string 
2default:defaulth p
x
� 
f
%s
*synth2N
:	Parameter DYN_CLK_INV_EN bound to: FALSE - type: string 
2default:defaulth p
x
� 
k
%s
*synth2S
?	Parameter INTERFACE_TYPE bound to: NETWORKING - type: string 
2default:defaulth p
x
� 
^
%s
*synth2F
2	Parameter IOBDELAY bound to: IFD - type: string 
2default:defaulth p
x
� 
[
%s
*synth2C
/	Parameter NUM_CE bound to: 2 - type: integer 
2default:defaulth p
x
� 
`
%s
*synth2H
4	Parameter OFB_USED bound to: FALSE - type: string 
2default:defaulth p
x
� 
c
%s
*synth2K
7	Parameter SERDES_MODE bound to: SLAVE - type: string 
2default:defaulth p
x
� 
�
,binding component instance '%s' to cell '%s'113*oasys2(
iserdese2_slave_inst2default:default2
	ISERDESE22default:default2M
7C:/v23.1/FEB_test/FEB_test.srcs/sources_1/new/febit.vhd2default:default2
1262default:default8@Z8-113h px� 
�
%done synthesizing module '%s' (%s#%s)256*oasys2
febit2default:default2
02default:default2
12default:default2M
7C:/v23.1/FEB_test/FEB_test.srcs/sources_1/new/febit.vhd2default:default2
292default:default8@Z8-256h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
febit2default:default2K
7C:/v23.1/FEB_test/FEB_test.srcs/sources_1/new/febit.vhd2default:default2
162default:default2
dfebit_inst2default:default2
febit2default:default2P
:C:/v23.1/FEB_test/FEB_test.srcs/sources_1/new/Auto_AFE.vhd2default:default2
842default:default8@Z8-3491h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
febit2default:default2K
7C:/v23.1/FEB_test/FEB_test.srcs/sources_1/new/febit.vhd2default:default2
162default:default2
dfebit_inst2default:default2
febit2default:default2P
:C:/v23.1/FEB_test/FEB_test.srcs/sources_1/new/Auto_AFE.vhd2default:default2
842default:default8@Z8-3491h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
febit2default:default2K
7C:/v23.1/FEB_test/FEB_test.srcs/sources_1/new/febit.vhd2default:default2
162default:default2
dfebit_inst2default:default2
febit2default:default2P
:C:/v23.1/FEB_test/FEB_test.srcs/sources_1/new/Auto_AFE.vhd2default:default2
842default:default8@Z8-3491h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
febit2default:default2K
7C:/v23.1/FEB_test/FEB_test.srcs/sources_1/new/febit.vhd2default:default2
162default:default2
dfebit_inst2default:default2
febit2default:default2P
:C:/v23.1/FEB_test/FEB_test.srcs/sources_1/new/Auto_AFE.vhd2default:default2
842default:default8@Z8-3491h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
febit2default:default2K
7C:/v23.1/FEB_test/FEB_test.srcs/sources_1/new/febit.vhd2default:default2
162default:default2
dfebit_inst2default:default2
febit2default:default2P
:C:/v23.1/FEB_test/FEB_test.srcs/sources_1/new/Auto_AFE.vhd2default:default2
842default:default8@Z8-3491h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
febit2default:default2K
7C:/v23.1/FEB_test/FEB_test.srcs/sources_1/new/febit.vhd2default:default2
162default:default2
dfebit_inst2default:default2
febit2default:default2P
:C:/v23.1/FEB_test/FEB_test.srcs/sources_1/new/Auto_AFE.vhd2default:default2
842default:default8@Z8-3491h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
febit2default:default2K
7C:/v23.1/FEB_test/FEB_test.srcs/sources_1/new/febit.vhd2default:default2
162default:default2
dfebit_inst2default:default2
febit2default:default2P
:C:/v23.1/FEB_test/FEB_test.srcs/sources_1/new/Auto_AFE.vhd2default:default2
842default:default8@Z8-3491h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
febit2default:default2K
7C:/v23.1/FEB_test/FEB_test.srcs/sources_1/new/febit.vhd2default:default2
162default:default2
dfebit_inst2default:default2
febit2default:default2P
:C:/v23.1/FEB_test/FEB_test.srcs/sources_1/new/Auto_AFE.vhd2default:default2
842default:default8@Z8-3491h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
auto_FSM2default:default2N
:C:/v23.1/FEB_test/FEB_test.srcs/sources_1/new/auto_FSM.vhd2default:default2
282default:default2!
auto_fsm_inst2default:default2
auto_FSM2default:default2P
:C:/v23.1/FEB_test/FEB_test.srcs/sources_1/new/Auto_AFE.vhd2default:default2
982default:default8@Z8-3491h px� 
�
synthesizing module '%s'638*oasys2
auto_FSM2default:default2P
:C:/v23.1/FEB_test/FEB_test.srcs/sources_1/new/auto_FSM.vhd2default:default2
412default:default8@Z8-638h px� 
�
%done synthesizing module '%s' (%s#%s)256*oasys2
auto_FSM2default:default2
02default:default2
12default:default2P
:C:/v23.1/FEB_test/FEB_test.srcs/sources_1/new/auto_FSM.vhd2default:default2
412default:default8@Z8-256h px� 
�
%done synthesizing module '%s' (%s#%s)256*oasys2
Auto_AFE2default:default2
02default:default2
12default:default2P
:C:/v23.1/FEB_test/FEB_test.srcs/sources_1/new/Auto_AFE.vhd2default:default2
352default:default8@Z8-256h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
Auto_AFE2default:default2N
:C:/v23.1/FEB_test/FEB_test.srcs/sources_1/new/Auto_AFE.vhd2default:default2
202default:default2
	afe1_inst2default:default2
auto_afe2default:default2U
?C:/v23.1/FEB_test/FEB_test.srcs/sources_1/new/AFE_Interface.vhd2default:default2
2222default:default8@Z8-3491h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2

spi_master2default:default2P
<C:/v23.1/FEB_test/FEB_test.srcs/sources_1/new/spi_master.vhd2default:default2
322default:default2
AFEspi2default:default2

spi_master2default:default2U
?C:/v23.1/FEB_test/FEB_test.srcs/sources_1/new/AFE_Interface.vhd2default:default2
2422default:default8@Z8-3491h px� 
�
synthesizing module '%s'638*oasys2

spi_master2default:default2R
<C:/v23.1/FEB_test/FEB_test.srcs/sources_1/new/spi_master.vhd2default:default2
542default:default8@Z8-638h px� 
[
%s
*synth2C
/	Parameter slaves bound to: 2 - type: integer 
2default:defaulth p
x
� 
]
%s
*synth2E
1	Parameter d_width bound to: 24 - type: integer 
2default:defaulth p
x
� 
�
%done synthesizing module '%s' (%s#%s)256*oasys2

spi_master2default:default2
02default:default2
12default:default2R
<C:/v23.1/FEB_test/FEB_test.srcs/sources_1/new/spi_master.vhd2default:default2
542default:default8@Z8-256h px� 
�
default block is never used226*oasys2U
?C:/v23.1/FEB_test/FEB_test.srcs/sources_1/new/AFE_Interface.vhd2default:default2
2732default:default8@Z8-226h px� 
�
Esignal '%s' is read in the process but is not in the sensitivity list614*oasys2

startwrite2default:default2U
?C:/v23.1/FEB_test/FEB_test.srcs/sources_1/new/AFE_Interface.vhd2default:default2
2712default:default8@Z8-614h px� 
�
Esignal '%s' is read in the process but is not in the sensitivity list614*oasys2
resetFSM2default:default2U
?C:/v23.1/FEB_test/FEB_test.srcs/sources_1/new/AFE_Interface.vhd2default:default2
2712default:default8@Z8-614h px� 
�
Esignal '%s' is read in the process but is not in the sensitivity list614*oasys2
spi_busy2default:default2U
?C:/v23.1/FEB_test/FEB_test.srcs/sources_1/new/AFE_Interface.vhd2default:default2
2712default:default8@Z8-614h px� 
�
default block is never used226*oasys2U
?C:/v23.1/FEB_test/FEB_test.srcs/sources_1/new/AFE_Interface.vhd2default:default2
3862default:default8@Z8-226h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
	DAC_ila_12default:default2t
`C:/v23.1/FEB_test/FEB_test.runs/synth_1/.Xil/Vivado-23304-CD-135239/realtime/DAC_ila_1_stub.vhdl2default:default2
62default:default2
AFE_ILA12default:default2
	DAC_ila_12default:default2U
?C:/v23.1/FEB_test/FEB_test.srcs/sources_1/new/AFE_Interface.vhd2default:default2
5142default:default8@Z8-3491h px� 
�
synthesizing module '%s'638*oasys2
	DAC_ila_12default:default2v
`C:/v23.1/FEB_test/FEB_test.runs/synth_1/.Xil/Vivado-23304-CD-135239/realtime/DAC_ila_1_stub.vhdl2default:default2
182default:default8@Z8-638h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
vio_02default:default2p
\C:/v23.1/FEB_test/FEB_test.runs/synth_1/.Xil/Vivado-23304-CD-135239/realtime/vio_0_stub.vhdl2default:default2
62default:default2
buttons2default:default2
vio_02default:default2U
?C:/v23.1/FEB_test/FEB_test.srcs/sources_1/new/AFE_Interface.vhd2default:default2
5262default:default8@Z8-3491h px� 
�
synthesizing module '%s'638*oasys2
vio_02default:default2r
\C:/v23.1/FEB_test/FEB_test.runs/synth_1/.Xil/Vivado-23304-CD-135239/realtime/vio_0_stub.vhdl2default:default2
232default:default8@Z8-638h px� 
�
%done synthesizing module '%s' (%s#%s)256*oasys2!
AFE_Interface2default:default2
02default:default2
12default:default2U
?C:/v23.1/FEB_test/FEB_test.srcs/sources_1/new/AFE_Interface.vhd2default:default2
752default:default8@Z8-256h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2 
AFE_DataPath2default:default2R
>C:/v23.1/FEB_test/FEB_test.srcs/sources_1/new/AFE_DataPath.vhd2default:default2
372default:default2%
AFE_DataPath_inst2default:default2 
AFE_DataPath2default:default2K
5C:/v23.1/FEB_test/FEB_test.srcs/sources_1/new/FEB.vhd2default:default2
3642default:default8@Z8-3491h px� 
�
synthesizing module '%s'638*oasys2 
AFE_DataPath2default:default2T
>C:/v23.1/FEB_test/FEB_test.srcs/sources_1/new/AFE_DataPath.vhd2default:default2
852default:default8@Z8-638h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2 
AFE_Pipeline2default:default2R
>C:/v23.1/FEB_test/FEB_test.srcs/sources_1/new/AFE_Pipeline.vhd2default:default2
102default:default2%
AFE_Pipeline_inst2default:default2 
AFE_Pipeline2default:default2T
>C:/v23.1/FEB_test/FEB_test.srcs/sources_1/new/AFE_DataPath.vhd2default:default2
1642default:default8@Z8-3491h px� 
�
synthesizing module '%s'638*oasys2 
AFE_Pipeline2default:default2T
>C:/v23.1/FEB_test/FEB_test.srcs/sources_1/new/AFE_Pipeline.vhd2default:default2
262default:default8@Z8-638h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2#
AFE_DP_Pipeline2default:default2z
fC:/v23.1/FEB_test/FEB_test.runs/synth_1/.Xil/Vivado-23304-CD-135239/realtime/AFE_DP_Pipeline_stub.vhdl2default:default2
62default:default2
Pipeline2default:default2#
AFE_DP_Pipeline2default:default2T
>C:/v23.1/FEB_test/FEB_test.srcs/sources_1/new/AFE_Pipeline.vhd2default:default2
452default:default8@Z8-3491h px� 
�
synthesizing module '%s'638*oasys2#
AFE_DP_Pipeline2default:default2|
fC:/v23.1/FEB_test/FEB_test.runs/synth_1/.Xil/Vivado-23304-CD-135239/realtime/AFE_DP_Pipeline_stub.vhdl2default:default2
192default:default8@Z8-638h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2#
AFE_DP_Pipeline2default:default2z
fC:/v23.1/FEB_test/FEB_test.runs/synth_1/.Xil/Vivado-23304-CD-135239/realtime/AFE_DP_Pipeline_stub.vhdl2default:default2
62default:default2
Pipeline2default:default2#
AFE_DP_Pipeline2default:default2T
>C:/v23.1/FEB_test/FEB_test.srcs/sources_1/new/AFE_Pipeline.vhd2default:default2
452default:default8@Z8-3491h px� 
�
%done synthesizing module '%s' (%s#%s)256*oasys2 
AFE_Pipeline2default:default2
02default:default2
12default:default2T
>C:/v23.1/FEB_test/FEB_test.srcs/sources_1/new/AFE_Pipeline.vhd2default:default2
262default:default8@Z8-256h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
DPRAM_1Kx162default:default2v
bC:/v23.1/FEB_test/FEB_test.runs/synth_1/.Xil/Vivado-23304-CD-135239/realtime/DPRAM_1Kx16_stub.vhdl2default:default2
62default:default2
AFEBuff2default:default2
DPRAM_1Kx162default:default2T
>C:/v23.1/FEB_test/FEB_test.srcs/sources_1/new/AFE_DataPath.vhd2default:default2
3202default:default8@Z8-3491h px� 
�
synthesizing module '%s'638*oasys2
DPRAM_1Kx162default:default2x
bC:/v23.1/FEB_test/FEB_test.runs/synth_1/.Xil/Vivado-23304-CD-135239/realtime/DPRAM_1Kx16_stub.vhdl2default:default2
192default:default8@Z8-638h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
DPRAM_1Kx162default:default2v
bC:/v23.1/FEB_test/FEB_test.runs/synth_1/.Xil/Vivado-23304-CD-135239/realtime/DPRAM_1Kx16_stub.vhdl2default:default2
62default:default2
AFEBuff2default:default2
DPRAM_1Kx162default:default2T
>C:/v23.1/FEB_test/FEB_test.srcs/sources_1/new/AFE_DataPath.vhd2default:default2
3202default:default8@Z8-3491h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
DPRAM_1Kx162default:default2v
bC:/v23.1/FEB_test/FEB_test.runs/synth_1/.Xil/Vivado-23304-CD-135239/realtime/DPRAM_1Kx16_stub.vhdl2default:default2
62default:default2
AFEBuff2default:default2
DPRAM_1Kx162default:default2T
>C:/v23.1/FEB_test/FEB_test.srcs/sources_1/new/AFE_DataPath.vhd2default:default2
3202default:default8@Z8-3491h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
DPRAM_1Kx162default:default2v
bC:/v23.1/FEB_test/FEB_test.runs/synth_1/.Xil/Vivado-23304-CD-135239/realtime/DPRAM_1Kx16_stub.vhdl2default:default2
62default:default2
AFEBuff2default:default2
DPRAM_1Kx162default:default2T
>C:/v23.1/FEB_test/FEB_test.srcs/sources_1/new/AFE_DataPath.vhd2default:default2
3202default:default8@Z8-3491h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
DPRAM_1Kx162default:default2v
bC:/v23.1/FEB_test/FEB_test.runs/synth_1/.Xil/Vivado-23304-CD-135239/realtime/DPRAM_1Kx16_stub.vhdl2default:default2
62default:default2
AFEBuff2default:default2
DPRAM_1Kx162default:default2T
>C:/v23.1/FEB_test/FEB_test.srcs/sources_1/new/AFE_DataPath.vhd2default:default2
3202default:default8@Z8-3491h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
DPRAM_1Kx162default:default2v
bC:/v23.1/FEB_test/FEB_test.runs/synth_1/.Xil/Vivado-23304-CD-135239/realtime/DPRAM_1Kx16_stub.vhdl2default:default2
62default:default2
AFEBuff2default:default2
DPRAM_1Kx162default:default2T
>C:/v23.1/FEB_test/FEB_test.srcs/sources_1/new/AFE_DataPath.vhd2default:default2
3202default:default8@Z8-3491h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
DPRAM_1Kx162default:default2v
bC:/v23.1/FEB_test/FEB_test.runs/synth_1/.Xil/Vivado-23304-CD-135239/realtime/DPRAM_1Kx16_stub.vhdl2default:default2
62default:default2
AFEBuff2default:default2
DPRAM_1Kx162default:default2T
>C:/v23.1/FEB_test/FEB_test.srcs/sources_1/new/AFE_DataPath.vhd2default:default2
3202default:default8@Z8-3491h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
DPRAM_1Kx162default:default2v
bC:/v23.1/FEB_test/FEB_test.runs/synth_1/.Xil/Vivado-23304-CD-135239/realtime/DPRAM_1Kx16_stub.vhdl2default:default2
62default:default2
AFEBuff2default:default2
DPRAM_1Kx162default:default2T
>C:/v23.1/FEB_test/FEB_test.srcs/sources_1/new/AFE_DataPath.vhd2default:default2
3202default:default8@Z8-3491h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
DPRAM_1Kx162default:default2v
bC:/v23.1/FEB_test/FEB_test.runs/synth_1/.Xil/Vivado-23304-CD-135239/realtime/DPRAM_1Kx16_stub.vhdl2default:default2
62default:default2
AFEBuff2default:default2
DPRAM_1Kx162default:default2T
>C:/v23.1/FEB_test/FEB_test.srcs/sources_1/new/AFE_DataPath.vhd2default:default2
3202default:default8@Z8-3491h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
DPRAM_1Kx162default:default2v
bC:/v23.1/FEB_test/FEB_test.runs/synth_1/.Xil/Vivado-23304-CD-135239/realtime/DPRAM_1Kx16_stub.vhdl2default:default2
62default:default2
AFEBuff2default:default2
DPRAM_1Kx162default:default2T
>C:/v23.1/FEB_test/FEB_test.srcs/sources_1/new/AFE_DataPath.vhd2default:default2
3202default:default8@Z8-3491h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
DPRAM_1Kx162default:default2v
bC:/v23.1/FEB_test/FEB_test.runs/synth_1/.Xil/Vivado-23304-CD-135239/realtime/DPRAM_1Kx16_stub.vhdl2default:default2
62default:default2
AFEBuff2default:default2
DPRAM_1Kx162default:default2T
>C:/v23.1/FEB_test/FEB_test.srcs/sources_1/new/AFE_DataPath.vhd2default:default2
3202default:default8@Z8-3491h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
DPRAM_1Kx162default:default2v
bC:/v23.1/FEB_test/FEB_test.runs/synth_1/.Xil/Vivado-23304-CD-135239/realtime/DPRAM_1Kx16_stub.vhdl2default:default2
62default:default2
AFEBuff2default:default2
DPRAM_1Kx162default:default2T
>C:/v23.1/FEB_test/FEB_test.srcs/sources_1/new/AFE_DataPath.vhd2default:default2
3202default:default8@Z8-3491h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
DPRAM_1Kx162default:default2v
bC:/v23.1/FEB_test/FEB_test.runs/synth_1/.Xil/Vivado-23304-CD-135239/realtime/DPRAM_1Kx16_stub.vhdl2default:default2
62default:default2
AFEBuff2default:default2
DPRAM_1Kx162default:default2T
>C:/v23.1/FEB_test/FEB_test.srcs/sources_1/new/AFE_DataPath.vhd2default:default2
3202default:default8@Z8-3491h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
DPRAM_1Kx162default:default2v
bC:/v23.1/FEB_test/FEB_test.runs/synth_1/.Xil/Vivado-23304-CD-135239/realtime/DPRAM_1Kx16_stub.vhdl2default:default2
62default:default2
AFEBuff2default:default2
DPRAM_1Kx162default:default2T
>C:/v23.1/FEB_test/FEB_test.srcs/sources_1/new/AFE_DataPath.vhd2default:default2
3202default:default8@Z8-3491h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
DPRAM_1Kx162default:default2v
bC:/v23.1/FEB_test/FEB_test.runs/synth_1/.Xil/Vivado-23304-CD-135239/realtime/DPRAM_1Kx16_stub.vhdl2default:default2
62default:default2
AFEBuff2default:default2
DPRAM_1Kx162default:default2T
>C:/v23.1/FEB_test/FEB_test.srcs/sources_1/new/AFE_DataPath.vhd2default:default2
3202default:default8@Z8-3491h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
DPRAM_1Kx162default:default2v
bC:/v23.1/FEB_test/FEB_test.runs/synth_1/.Xil/Vivado-23304-CD-135239/realtime/DPRAM_1Kx16_stub.vhdl2default:default2
62default:default2
AFEBuff2default:default2
DPRAM_1Kx162default:default2T
>C:/v23.1/FEB_test/FEB_test.srcs/sources_1/new/AFE_DataPath.vhd2default:default2
3202default:default8@Z8-3491h px� 
�
%done synthesizing module '%s' (%s#%s)256*oasys2 
AFE_DataPath2default:default2
02default:default2
12default:default2T
>C:/v23.1/FEB_test/FEB_test.srcs/sources_1/new/AFE_DataPath.vhd2default:default2
852default:default8@Z8-256h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2"
Phase_Detector2default:default2T
@C:/v23.1/FEB_test/FEB_test.srcs/sources_1/new/Phase_Detector.vhd2default:default2
302default:default2'
Phase_Detector_inst2default:default2"
Phase_Detector2default:default2K
5C:/v23.1/FEB_test/FEB_test.srcs/sources_1/new/FEB.vhd2default:default2
4102default:default8@Z8-3491h px� 
�
synthesizing module '%s'638*oasys2"
Phase_Detector2default:default2V
@C:/v23.1/FEB_test/FEB_test.srcs/sources_1/new/Phase_Detector.vhd2default:default2
522default:default8@Z8-638h px� 
�
%done synthesizing module '%s' (%s#%s)256*oasys2"
Phase_Detector2default:default2
02default:default2
12default:default2V
@C:/v23.1/FEB_test/FEB_test.srcs/sources_1/new/Phase_Detector.vhd2default:default2
522default:default8@Z8-256h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
Trigger2default:default2M
9C:/v23.1/FEB_test/FEB_test.srcs/sources_1/new/Trigger.vhd2default:default2
112default:default2!
Trigger_logic2default:default2
Trigger2default:default2K
5C:/v23.1/FEB_test/FEB_test.srcs/sources_1/new/FEB.vhd2default:default2
4292default:default8@Z8-3491h px� 
�
synthesizing module '%s'638*oasys2
Trigger2default:default2O
9C:/v23.1/FEB_test/FEB_test.srcs/sources_1/new/Trigger.vhd2default:default2
502default:default8@Z8-638h px� 
\
%s
*synth2D
0	Parameter Pwidth bound to: 24 - type: integer 
2default:defaulth p
x
� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
FM_Rx2default:default2U
AC:/v23.1/FEB_test/FEB_test.srcs/sources_1/new/FM_Deserializer.vhd2default:default2
172default:default2
FMRx12default:default2
FM_Rx2default:default2O
9C:/v23.1/FEB_test/FEB_test.srcs/sources_1/new/Trigger.vhd2default:default2
862default:default8@Z8-3491h px� 
�
synthesizing module '%s'638*oasys2
FM_Rx2default:default2W
AC:/v23.1/FEB_test/FEB_test.srcs/sources_1/new/FM_Deserializer.vhd2default:default2
292default:default8@Z8-638h px� 
\
%s
*synth2D
0	Parameter Pwidth bound to: 24 - type: integer 
2default:defaulth p
x
� 
�
%done synthesizing module '%s' (%s#%s)256*oasys2
FM_Rx2default:default2
02default:default2
12default:default2W
AC:/v23.1/FEB_test/FEB_test.srcs/sources_1/new/FM_Deserializer.vhd2default:default2
292default:default8@Z8-256h px� 
�
%done synthesizing module '%s' (%s#%s)256*oasys2
Trigger2default:default2
02default:default2
12default:default2O
9C:/v23.1/FEB_test/FEB_test.srcs/sources_1/new/Trigger.vhd2default:default2
502default:default8@Z8-256h px� 
`
%s
*synth2H
4	Parameter DATA_WIDTH bound to: 16 - type: integer 
2default:defaulth p
x
� 
`
%s
*synth2H
4	Parameter DDR3L_ADDR bound to: 15 - type: integer 
2default:defaulth p
x
� 
^
%s
*synth2F
2	Parameter APP_ADDR bound to: 29 - type: integer 
2default:defaulth p
x
� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
DDR_test2default:default2N
:C:/v23.1/FEB_test/FEB_test.srcs/sources_1/new/DDR_test.vhd2default:default2
312default:default2
DDR2default:default2
DDR_test2default:default2K
5C:/v23.1/FEB_test/FEB_test.srcs/sources_1/new/FEB.vhd2default:default2
5472default:default8@Z8-3491h px� 
�
synthesizing module '%s'638*oasys2
DDR_test2default:default2P
:C:/v23.1/FEB_test/FEB_test.srcs/sources_1/new/DDR_test.vhd2default:default2
762default:default8@Z8-638h px� 
`
%s
*synth2H
4	Parameter DATA_WIDTH bound to: 16 - type: integer 
2default:defaulth p
x
� 
`
%s
*synth2H
4	Parameter DDR3L_ADDR bound to: 15 - type: integer 
2default:defaulth p
x
� 
^
%s
*synth2F
2	Parameter APP_ADDR bound to: 29 - type: integer 
2default:defaulth p
x
� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2#
DDR3LController2default:default2z
fC:/v23.1/FEB_test/FEB_test.runs/synth_1/.Xil/Vivado-23304-CD-135239/realtime/DDR3LController_stub.vhdl2default:default2
62default:default2"
DDR_Controller2default:default2#
DDR3LController2default:default2P
:C:/v23.1/FEB_test/FEB_test.srcs/sources_1/new/DDR_test.vhd2default:default2
1622default:default8@Z8-3491h px� 
�
synthesizing module '%s'638*oasys2#
DDR3LController2default:default2|
fC:/v23.1/FEB_test/FEB_test.runs/synth_1/.Xil/Vivado-23304-CD-135239/realtime/DDR3LController_stub.vhdl2default:default2
532default:default8@Z8-638h px� 
�
Esignal '%s' is read in the process but is not in the sensitivity list614*oasys2
CpldRst2default:default2P
:C:/v23.1/FEB_test/FEB_test.srcs/sources_1/new/DDR_test.vhd2default:default2
2382default:default8@Z8-614h px� 
�
Esignal '%s' is read in the process but is not in the sensitivity list614*oasys2

startwrite2default:default2P
:C:/v23.1/FEB_test/FEB_test.srcs/sources_1/new/DDR_test.vhd2default:default2
2472default:default8@Z8-614h px� 
�
Esignal '%s' is read in the process but is not in the sensitivity list614*oasys2
	startread2default:default2P
:C:/v23.1/FEB_test/FEB_test.srcs/sources_1/new/DDR_test.vhd2default:default2
2472default:default8@Z8-614h px� 
�
Esignal '%s' is read in the process but is not in the sensitivity list614*oasys2
resetFSM2default:default2P
:C:/v23.1/FEB_test/FEB_test.srcs/sources_1/new/DDR_test.vhd2default:default2
2472default:default8@Z8-614h px� 
�
Esignal '%s' is read in the process but is not in the sensitivity list614*oasys2
DDR3_rdy2default:default2P
:C:/v23.1/FEB_test/FEB_test.srcs/sources_1/new/DDR_test.vhd2default:default2
2472default:default8@Z8-614h px� 
�
Esignal '%s' is read in the process but is not in the sensitivity list614*oasys2
done2default:default2P
:C:/v23.1/FEB_test/FEB_test.srcs/sources_1/new/DDR_test.vhd2default:default2
2472default:default8@Z8-614h px� 
�
%done synthesizing module '%s' (%s#%s)256*oasys2
DDR_test2default:default2
02default:default2
12default:default2P
:C:/v23.1/FEB_test/FEB_test.srcs/sources_1/new/DDR_test.vhd2default:default2
762default:default8@Z8-256h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
One_Wire2default:default2N
:C:/v23.1/FEB_test/FEB_test.srcs/sources_1/new/One_Wire.vhd2default:default2
72default:default2
OneWire2default:default2
One_Wire2default:default2K
5C:/v23.1/FEB_test/FEB_test.srcs/sources_1/new/FEB.vhd2default:default2
5942default:default8@Z8-3491h px� 
�
synthesizing module '%s'638*oasys2
One_Wire2default:default2P
:C:/v23.1/FEB_test/FEB_test.srcs/sources_1/new/One_Wire.vhd2default:default2
252default:default8@Z8-638h px� 
�
Esignal '%s' is read in the process but is not in the sensitivity list614*oasys2

OneWrRdROM2default:default2P
:C:/v23.1/FEB_test/FEB_test.srcs/sources_1/new/One_Wire.vhd2default:default2
602default:default8@Z8-614h px� 
�
%done synthesizing module '%s' (%s#%s)256*oasys2
One_Wire2default:default2
02default:default2
12default:default2P
:C:/v23.1/FEB_test/FEB_test.srcs/sources_1/new/One_Wire.vhd2default:default2
252default:default8@Z8-256h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
LVDS_TX2default:default2M
9C:/v23.1/FEB_test/FEB_test.srcs/sources_1/new/LVDS_TX.vhd2default:default2
122default:default2 
uC_to_LVDSTX2default:default2
LVDS_TX2default:default2K
5C:/v23.1/FEB_test/FEB_test.srcs/sources_1/new/FEB.vhd2default:default2
6122default:default8@Z8-3491h px� 
�
synthesizing module '%s'638*oasys2
LVDS_TX2default:default2O
9C:/v23.1/FEB_test/FEB_test.srcs/sources_1/new/LVDS_TX.vhd2default:default2
322default:default8@Z8-638h px� 
\
%s
*synth2D
0	Parameter Pwidth bound to: 16 - type: integer 
2default:defaulth p
x
� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
FM_Tx2default:default2S
?C:/v23.1/FEB_test/FEB_test.srcs/sources_1/new/FM_Serializer.vhd2default:default2
182default:default2
FMTx2default:default2
FM_Tx2default:default2O
9C:/v23.1/FEB_test/FEB_test.srcs/sources_1/new/LVDS_TX.vhd2default:default2
422default:default8@Z8-3491h px� 
�
synthesizing module '%s'638*oasys2
FM_Tx2default:default2U
?C:/v23.1/FEB_test/FEB_test.srcs/sources_1/new/FM_Serializer.vhd2default:default2
292default:default8@Z8-638h px� 
\
%s
*synth2D
0	Parameter Pwidth bound to: 16 - type: integer 
2default:defaulth p
x
� 
�
%done synthesizing module '%s' (%s#%s)256*oasys2
FM_Tx2default:default2
02default:default2
12default:default2U
?C:/v23.1/FEB_test/FEB_test.srcs/sources_1/new/FM_Serializer.vhd2default:default2
292default:default8@Z8-256h px� 
�
-Port '%s' is missing in component declaration4102*oasys2
wr_rst_busy2default:default2P
:C:/v23.1/FEB_test/FEB_test.srcs/sources_1/new/Proj_Def.vhd2default:default2
8582default:default8@Z8-5640h px� 
�
-Port '%s' is missing in component declaration4102*oasys2
rd_rst_busy2default:default2P
:C:/v23.1/FEB_test/FEB_test.srcs/sources_1/new/Proj_Def.vhd2default:default2
8582default:default8@Z8-5640h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2

LVDSTxBuff2default:default2u
aC:/v23.1/FEB_test/FEB_test.runs/synth_1/.Xil/Vivado-23304-CD-135239/realtime/LVDSTxBuff_stub.vhdl2default:default2
62default:default2
	FMTx_Buff2default:default2

LVDSTxBuff2default:default2O
9C:/v23.1/FEB_test/FEB_test.srcs/sources_1/new/LVDS_TX.vhd2default:default2
582default:default8@Z8-3491h px� 
�
synthesizing module '%s'638*oasys2

LVDSTxBuff2default:default2w
aC:/v23.1/FEB_test/FEB_test.runs/synth_1/.Xil/Vivado-23304-CD-135239/realtime/LVDSTxBuff_stub.vhdl2default:default2
222default:default8@Z8-638h px� 
�
%done synthesizing module '%s' (%s#%s)256*oasys2
LVDS_TX2default:default2
02default:default2
12default:default2O
9C:/v23.1/FEB_test/FEB_test.srcs/sources_1/new/LVDS_TX.vhd2default:default2
322default:default8@Z8-256h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2)
uController_interface2default:default2Q
=C:/v23.1/FEB_test/FEB_test.srcs/sources_1/new/uController.vhd2default:default2
312default:default2'
uControllerRegister2default:default2)
uController_interface2default:default2K
5C:/v23.1/FEB_test/FEB_test.srcs/sources_1/new/FEB.vhd2default:default2
6312default:default8@Z8-3491h px� 
�
synthesizing module '%s'638*oasys2)
uController_interface2default:default2S
=C:/v23.1/FEB_test/FEB_test.srcs/sources_1/new/uController.vhd2default:default2
882default:default8@Z8-638h px� 
�
-Port '%s' is missing in component declaration4102*oasys2
wr_rst_busy2default:default2P
:C:/v23.1/FEB_test/FEB_test.srcs/sources_1/new/Proj_Def.vhd2default:default2
8482default:default8@Z8-5640h px� 
�
-Port '%s' is missing in component declaration4102*oasys2
rd_rst_busy2default:default2P
:C:/v23.1/FEB_test/FEB_test.srcs/sources_1/new/Proj_Def.vhd2default:default2
8482default:default8@Z8-5640h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2 
SCFIFO_1Kx162default:default2w
cC:/v23.1/FEB_test/FEB_test.runs/synth_1/.Xil/Vivado-23304-CD-135239/realtime/SCFIFO_1Kx16_stub.vhdl2default:default2
62default:default2
	AFE_DEBUG2default:default2 
SCFIFO_1kx162default:default2S
=C:/v23.1/FEB_test/FEB_test.srcs/sources_1/new/uController.vhd2default:default2
1652default:default8@Z8-3491h px� 
�
synthesizing module '%s'638*oasys2 
SCFIFO_1Kx162default:default2y
cC:/v23.1/FEB_test/FEB_test.runs/synth_1/.Xil/Vivado-23304-CD-135239/realtime/SCFIFO_1Kx16_stub.vhdl2default:default2
232default:default8@Z8-638h px� 
�
%done synthesizing module '%s' (%s#%s)256*oasys2)
uController_interface2default:default2
02default:default2
12default:default2S
=C:/v23.1/FEB_test/FEB_test.srcs/sources_1/new/uController.vhd2default:default2
882default:default8@Z8-256h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
	AFE_ila_02default:default2t
`C:/v23.1/FEB_test/FEB_test.runs/synth_1/.Xil/Vivado-23304-CD-135239/realtime/AFE_ila_0_stub.vhdl2default:default2
62default:default2
AFE_ila2default:default2
	AFE_ila_02default:default2K
5C:/v23.1/FEB_test/FEB_test.srcs/sources_1/new/FEB.vhd2default:default2
7542default:default8@Z8-3491h px� 
�
synthesizing module '%s'638*oasys2
	AFE_ila_02default:default2v
`C:/v23.1/FEB_test/FEB_test.runs/synth_1/.Xil/Vivado-23304-CD-135239/realtime/AFE_ila_0_stub.vhdl2default:default2
182default:default8@Z8-638h px� 
�
%done synthesizing module '%s' (%s#%s)256*oasys2
FEB2default:default2
02default:default2
12default:default2K
5C:/v23.1/FEB_test/FEB_test.srcs/sources_1/new/FEB.vhd2default:default2
972default:default8@Z8-256h px� 
�
+Unused sequential element %s was removed. 
4326*oasys2#
Counter10us_reg2default:default2K
5C:/v23.1/FEB_test/FEB_test.srcs/sources_1/new/DAC.vhd2default:default2
1302default:default8@Z8-6014h px� 
�
0Net %s in module/entity %s does not have driver.3422*oasys2
AFERdReg2default:default2
DAC2default:default2K
5C:/v23.1/FEB_test/FEB_test.srcs/sources_1/new/DAC.vhd2default:default2
532default:default8@Z8-3848h px� 
�
fMark debug on the nets applies keep_hierarchy on instance '%s'. This will prevent further optimization4399*oasys2
AFEspi2default:default2U
?C:/v23.1/FEB_test/FEB_test.srcs/sources_1/new/AFE_Interface.vhd2default:default2
2422default:default8@Z8-6071h px� 
�
+Unused sequential element %s was removed. 
4326*oasys2#
RxBtCnt_sig_reg2default:default2W
AC:/v23.1/FEB_test/FEB_test.srcs/sources_1/new/FM_Deserializer.vhd2default:default2
582default:default8@Z8-6014h px� 
�
+Unused sequential element %s was removed. 
4326*oasys2 
TrigType_reg2default:default2O
9C:/v23.1/FEB_test/FEB_test.srcs/sources_1/new/Trigger.vhd2default:default2
1182default:default8@Z8-6014h px� 
�
+Unused sequential element %s was removed. 
4326*oasys2!
Rx1DatReg_reg2default:default2O
9C:/v23.1/FEB_test/FEB_test.srcs/sources_1/new/Trigger.vhd2default:default2
1222default:default8@Z8-6014h px� 
�
+Unused sequential element %s was removed. 
4326*oasys2"
DDRSeqStat_reg2default:default2P
:C:/v23.1/FEB_test/FEB_test.srcs/sources_1/new/DDR_test.vhd2default:default2
3122default:default8@Z8-6014h px� 
�
+Unused sequential element %s was removed. 
4326*oasys2!
test_data_reg2default:default2P
:C:/v23.1/FEB_test/FEB_test.srcs/sources_1/new/DDR_test.vhd2default:default2
3172default:default8@Z8-6014h px� 
�
+Unused sequential element %s was removed. 
4326*oasys2
success_reg2default:default2P
:C:/v23.1/FEB_test/FEB_test.srcs/sources_1/new/DDR_test.vhd2default:default2
3222default:default8@Z8-6014h px� 
�
+Unused sequential element %s was removed. 
4326*oasys2
trig_reg2default:default2P
:C:/v23.1/FEB_test/FEB_test.srcs/sources_1/new/DDR_test.vhd2default:default2
3232default:default8@Z8-6014h px� 
�
0Net %s in module/entity %s does not have driver.3422*oasys2
B_out2default:default2
DDR_test2default:default2P
:C:/v23.1/FEB_test/FEB_test.srcs/sources_1/new/DDR_test.vhd2default:default2
1432default:default8@Z8-3848h px� 
�
+Unused sequential element %s was removed. 
4326*oasys2#
ResponseBit_reg2default:default2P
:C:/v23.1/FEB_test/FEB_test.srcs/sources_1/new/One_Wire.vhd2default:default2
732default:default8@Z8-6014h px� 
�
fMark debug on the nets applies keep_hierarchy on instance '%s'. This will prevent further optimization4399*oasys2%
AFE_DataPath_inst2default:default2K
5C:/v23.1/FEB_test/FEB_test.srcs/sources_1/new/FEB.vhd2default:default2
3642default:default8@Z8-6071h px� 
�
fMark debug on the nets applies keep_hierarchy on instance '%s'. This will prevent further optimization4399*oasys2
AFE2default:default2K
5C:/v23.1/FEB_test/FEB_test.srcs/sources_1/new/FEB.vhd2default:default2
3162default:default8@Z8-6071h px� 
�
fMark debug on the nets applies keep_hierarchy on instance '%s'. This will prevent further optimization4399*oasys2'
uControllerRegister2default:default2K
5C:/v23.1/FEB_test/FEB_test.srcs/sources_1/new/FEB.vhd2default:default2
6312default:default8@Z8-6071h px� 
�
0Net %s in module/entity %s does not have driver.3422*oasys2%
BufferRdAdd[0][0]2default:default2
FEB2default:default2K
5C:/v23.1/FEB_test/FEB_test.srcs/sources_1/new/FEB.vhd2default:default2
1542default:default8@Z8-3848h px� 
�
0Net %s in module/entity %s does not have driver.3422*oasys2%
BufferRdAdd[0][1]2default:default2
FEB2default:default2K
5C:/v23.1/FEB_test/FEB_test.srcs/sources_1/new/FEB.vhd2default:default2
1542default:default8@Z8-3848h px� 
�
0Net %s in module/entity %s does not have driver.3422*oasys2%
BufferRdAdd[0][2]2default:default2
FEB2default:default2K
5C:/v23.1/FEB_test/FEB_test.srcs/sources_1/new/FEB.vhd2default:default2
1542default:default8@Z8-3848h px� 
�
0Net %s in module/entity %s does not have driver.3422*oasys2%
BufferRdAdd[0][3]2default:default2
FEB2default:default2K
5C:/v23.1/FEB_test/FEB_test.srcs/sources_1/new/FEB.vhd2default:default2
1542default:default8@Z8-3848h px� 
�
0Net %s in module/entity %s does not have driver.3422*oasys2%
BufferRdAdd[0][4]2default:default2
FEB2default:default2K
5C:/v23.1/FEB_test/FEB_test.srcs/sources_1/new/FEB.vhd2default:default2
1542default:default8@Z8-3848h px� 
�
0Net %s in module/entity %s does not have driver.3422*oasys2%
BufferRdAdd[0][5]2default:default2
FEB2default:default2K
5C:/v23.1/FEB_test/FEB_test.srcs/sources_1/new/FEB.vhd2default:default2
1542default:default8@Z8-3848h px� 
�
0Net %s in module/entity %s does not have driver.3422*oasys2%
BufferRdAdd[0][6]2default:default2
FEB2default:default2K
5C:/v23.1/FEB_test/FEB_test.srcs/sources_1/new/FEB.vhd2default:default2
1542default:default8@Z8-3848h px� 
�
0Net %s in module/entity %s does not have driver.3422*oasys2%
BufferRdAdd[0][7]2default:default2
FEB2default:default2K
5C:/v23.1/FEB_test/FEB_test.srcs/sources_1/new/FEB.vhd2default:default2
1542default:default8@Z8-3848h px� 
�
0Net %s in module/entity %s does not have driver.3422*oasys2%
BufferRdAdd[1][0]2default:default2
FEB2default:default2K
5C:/v23.1/FEB_test/FEB_test.srcs/sources_1/new/FEB.vhd2default:default2
1542default:default8@Z8-3848h px� 
�
0Net %s in module/entity %s does not have driver.3422*oasys2%
BufferRdAdd[1][1]2default:default2
FEB2default:default2K
5C:/v23.1/FEB_test/FEB_test.srcs/sources_1/new/FEB.vhd2default:default2
1542default:default8@Z8-3848h px� 
�
0Net %s in module/entity %s does not have driver.3422*oasys2%
BufferRdAdd[1][2]2default:default2
FEB2default:default2K
5C:/v23.1/FEB_test/FEB_test.srcs/sources_1/new/FEB.vhd2default:default2
1542default:default8@Z8-3848h px� 
�
0Net %s in module/entity %s does not have driver.3422*oasys2%
BufferRdAdd[1][3]2default:default2
FEB2default:default2K
5C:/v23.1/FEB_test/FEB_test.srcs/sources_1/new/FEB.vhd2default:default2
1542default:default8@Z8-3848h px� 
�
0Net %s in module/entity %s does not have driver.3422*oasys2%
BufferRdAdd[1][4]2default:default2
FEB2default:default2K
5C:/v23.1/FEB_test/FEB_test.srcs/sources_1/new/FEB.vhd2default:default2
1542default:default8@Z8-3848h px� 
�
0Net %s in module/entity %s does not have driver.3422*oasys2%
BufferRdAdd[1][5]2default:default2
FEB2default:default2K
5C:/v23.1/FEB_test/FEB_test.srcs/sources_1/new/FEB.vhd2default:default2
1542default:default8@Z8-3848h px� 
�
0Net %s in module/entity %s does not have driver.3422*oasys2%
BufferRdAdd[1][6]2default:default2
FEB2default:default2K
5C:/v23.1/FEB_test/FEB_test.srcs/sources_1/new/FEB.vhd2default:default2
1542default:default8@Z8-3848h px� 
�
0Net %s in module/entity %s does not have driver.3422*oasys2%
BufferRdAdd[1][7]2default:default2
FEB2default:default2K
5C:/v23.1/FEB_test/FEB_test.srcs/sources_1/new/FEB.vhd2default:default2
1542default:default8@Z8-3848h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2$
dout_afe0[1][13]2default:default2)
uController_interface2default:defaultZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2$
dout_afe0[1][12]2default:default2)
uController_interface2default:defaultZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2$
dout_afe0[1][11]2default:default2)
uController_interface2default:defaultZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2$
dout_afe0[1][10]2default:default2)
uController_interface2default:defaultZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2#
dout_afe0[1][9]2default:default2)
uController_interface2default:defaultZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2#
dout_afe0[1][8]2default:default2)
uController_interface2default:defaultZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2#
dout_afe0[1][7]2default:default2)
uController_interface2default:defaultZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2#
dout_afe0[1][6]2default:default2)
uController_interface2default:defaultZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2#
dout_afe0[1][5]2default:default2)
uController_interface2default:defaultZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2#
dout_afe0[1][4]2default:default2)
uController_interface2default:defaultZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2#
dout_afe0[1][3]2default:default2)
uController_interface2default:defaultZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2#
dout_afe0[1][2]2default:default2)
uController_interface2default:defaultZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2#
dout_afe0[1][1]2default:default2)
uController_interface2default:defaultZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2#
dout_afe0[1][0]2default:default2)
uController_interface2default:defaultZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2$
dout_afe0[2][13]2default:default2)
uController_interface2default:defaultZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2$
dout_afe0[2][12]2default:default2)
uController_interface2default:defaultZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2$
dout_afe0[2][11]2default:default2)
uController_interface2default:defaultZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2$
dout_afe0[2][10]2default:default2)
uController_interface2default:defaultZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2#
dout_afe0[2][9]2default:default2)
uController_interface2default:defaultZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2#
dout_afe0[2][8]2default:default2)
uController_interface2default:defaultZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2#
dout_afe0[2][7]2default:default2)
uController_interface2default:defaultZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2#
dout_afe0[2][6]2default:default2)
uController_interface2default:defaultZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2#
dout_afe0[2][5]2default:default2)
uController_interface2default:defaultZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2#
dout_afe0[2][4]2default:default2)
uController_interface2default:defaultZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2#
dout_afe0[2][3]2default:default2)
uController_interface2default:defaultZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2#
dout_afe0[2][2]2default:default2)
uController_interface2default:defaultZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2#
dout_afe0[2][1]2default:default2)
uController_interface2default:defaultZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2#
dout_afe0[2][0]2default:default2)
uController_interface2default:defaultZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2$
dout_afe0[3][13]2default:default2)
uController_interface2default:defaultZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2$
dout_afe0[3][12]2default:default2)
uController_interface2default:defaultZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2$
dout_afe0[3][11]2default:default2)
uController_interface2default:defaultZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2$
dout_afe0[3][10]2default:default2)
uController_interface2default:defaultZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2#
dout_afe0[3][9]2default:default2)
uController_interface2default:defaultZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2#
dout_afe0[3][8]2default:default2)
uController_interface2default:defaultZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2#
dout_afe0[3][7]2default:default2)
uController_interface2default:defaultZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2#
dout_afe0[3][6]2default:default2)
uController_interface2default:defaultZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2#
dout_afe0[3][5]2default:default2)
uController_interface2default:defaultZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2#
dout_afe0[3][4]2default:default2)
uController_interface2default:defaultZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2#
dout_afe0[3][3]2default:default2)
uController_interface2default:defaultZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2#
dout_afe0[3][2]2default:default2)
uController_interface2default:defaultZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2#
dout_afe0[3][1]2default:default2)
uController_interface2default:defaultZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2#
dout_afe0[3][0]2default:default2)
uController_interface2default:defaultZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2$
dout_afe0[4][13]2default:default2)
uController_interface2default:defaultZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2$
dout_afe0[4][12]2default:default2)
uController_interface2default:defaultZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2$
dout_afe0[4][11]2default:default2)
uController_interface2default:defaultZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2$
dout_afe0[4][10]2default:default2)
uController_interface2default:defaultZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2#
dout_afe0[4][9]2default:default2)
uController_interface2default:defaultZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2#
dout_afe0[4][8]2default:default2)
uController_interface2default:defaultZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2#
dout_afe0[4][7]2default:default2)
uController_interface2default:defaultZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2#
dout_afe0[4][6]2default:default2)
uController_interface2default:defaultZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2#
dout_afe0[4][5]2default:default2)
uController_interface2default:defaultZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2#
dout_afe0[4][4]2default:default2)
uController_interface2default:defaultZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2#
dout_afe0[4][3]2default:default2)
uController_interface2default:defaultZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2#
dout_afe0[4][2]2default:default2)
uController_interface2default:defaultZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2#
dout_afe0[4][1]2default:default2)
uController_interface2default:defaultZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2#
dout_afe0[4][0]2default:default2)
uController_interface2default:defaultZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2$
dout_afe0[5][13]2default:default2)
uController_interface2default:defaultZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2$
dout_afe0[5][12]2default:default2)
uController_interface2default:defaultZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2$
dout_afe0[5][11]2default:default2)
uController_interface2default:defaultZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2$
dout_afe0[5][10]2default:default2)
uController_interface2default:defaultZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2#
dout_afe0[5][9]2default:default2)
uController_interface2default:defaultZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2#
dout_afe0[5][8]2default:default2)
uController_interface2default:defaultZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2#
dout_afe0[5][7]2default:default2)
uController_interface2default:defaultZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2#
dout_afe0[5][6]2default:default2)
uController_interface2default:defaultZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2#
dout_afe0[5][5]2default:default2)
uController_interface2default:defaultZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2#
dout_afe0[5][4]2default:default2)
uController_interface2default:defaultZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2#
dout_afe0[5][3]2default:default2)
uController_interface2default:defaultZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2#
dout_afe0[5][2]2default:default2)
uController_interface2default:defaultZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2#
dout_afe0[5][1]2default:default2)
uController_interface2default:defaultZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2#
dout_afe0[5][0]2default:default2)
uController_interface2default:defaultZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2$
dout_afe0[6][13]2default:default2)
uController_interface2default:defaultZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2$
dout_afe0[6][12]2default:default2)
uController_interface2default:defaultZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2$
dout_afe0[6][11]2default:default2)
uController_interface2default:defaultZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2$
dout_afe0[6][10]2default:default2)
uController_interface2default:defaultZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2#
dout_afe0[6][9]2default:default2)
uController_interface2default:defaultZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2#
dout_afe0[6][8]2default:default2)
uController_interface2default:defaultZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2#
dout_afe0[6][7]2default:default2)
uController_interface2default:defaultZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2#
dout_afe0[6][6]2default:default2)
uController_interface2default:defaultZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2#
dout_afe0[6][5]2default:default2)
uController_interface2default:defaultZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2#
dout_afe0[6][4]2default:default2)
uController_interface2default:defaultZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2#
dout_afe0[6][3]2default:default2)
uController_interface2default:defaultZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2#
dout_afe0[6][2]2default:default2)
uController_interface2default:defaultZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2#
dout_afe0[6][1]2default:default2)
uController_interface2default:defaultZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2#
dout_afe0[6][0]2default:default2)
uController_interface2default:defaultZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2$
dout_afe0[7][13]2default:default2)
uController_interface2default:defaultZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2$
dout_afe0[7][12]2default:default2)
uController_interface2default:defaultZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2$
dout_afe0[7][11]2default:default2)
uController_interface2default:defaultZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2$
dout_afe0[7][10]2default:default2)
uController_interface2default:defaultZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2#
dout_afe0[7][9]2default:default2)
uController_interface2default:defaultZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2#
dout_afe0[7][8]2default:default2)
uController_interface2default:defaultZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2#
dout_afe0[7][7]2default:default2)
uController_interface2default:defaultZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2#
dout_afe0[7][6]2default:default2)
uController_interface2default:defaultZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2#
dout_afe0[7][5]2default:default2)
uController_interface2default:defaultZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2#
dout_afe0[7][4]2default:default2)
uController_interface2default:defaultZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2#
dout_afe0[7][3]2default:default2)
uController_interface2default:defaultZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2#
dout_afe0[7][2]2default:default2)
uController_interface2default:defaultZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2#
dout_afe0[7][1]2default:default2)
uController_interface2default:defaultZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2#
dout_afe0[7][0]2default:default2)
uController_interface2default:defaultZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
done[1]2default:default2)
uController_interface2default:defaultZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2(
In_Seq_Stat[0][0][3]2default:default2)
uController_interface2default:defaultZ8-7129h px� 
�
�Message '%s' appears more than %s times and has been disabled. User can change this message limit to see more message instances.
14*common2 
Synth 8-71292default:default2
1002default:defaultZ17-14h px� 
�
%s*synth2�
yFinished RTL Elaboration : Time (s): cpu = 00:00:09 ; elapsed = 00:00:10 . Memory (MB): peak = 2612.793 ; gain = 576.133
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
M
%s
*synth25
!Start Handling Custom Attributes
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
�Finished Handling Custom Attributes : Time (s): cpu = 00:00:09 ; elapsed = 00:00:10 . Memory (MB): peak = 2630.719 ; gain = 594.059
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
�Finished RTL Optimization Phase 1 : Time (s): cpu = 00:00:09 ; elapsed = 00:00:10 . Memory (MB): peak = 2630.719 ; gain = 594.059
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2.
Netlist sorting complete. 2default:default2
00:00:002default:default2 
00:00:00.1222default:default2
2642.7382default:default2
0.0002default:defaultZ17-268h px� 
f
-Analyzing %s Unisim elements for replacement
17*netlist2
752default:defaultZ29-17h px� 
j
2Unisim Transformation completed in %s CPU seconds
28*netlist2
02default:defaultZ29-28h px� 
K
)Preparing netlist for logic optimization
349*projectZ1-570h px� 
>

Processing XDC Constraints
244*projectZ1-262h px� 
=
Initializing timing engine
348*projectZ1-569h px� 
�
$Parsing XDC File [%s] for cell '%s'
848*designutils2b
Lc:/v23.1/FEB_test/FEB_test.gen/sources_1/ip/PLL_0/PLL_0/PLL_0_in_context.xdc2default:default2
PLL	2default:default8Z20-848h px� 
�
-Finished Parsing XDC File [%s] for cell '%s'
847*designutils2b
Lc:/v23.1/FEB_test/FEB_test.gen/sources_1/ip/PLL_0/PLL_0/PLL_0_in_context.xdc2default:default2
PLL	2default:default8Z20-847h px� 
�
$Parsing XDC File [%s] for cell '%s'
848*designutils2b
Lc:/v23.1/FEB_test/FEB_test.gen/sources_1/ip/vio_0/vio_0/vio_0_in_context.xdc2default:default2!
AFE/buttons	2default:default8Z20-848h px� 
�
-Finished Parsing XDC File [%s] for cell '%s'
847*designutils2b
Lc:/v23.1/FEB_test/FEB_test.gen/sources_1/ip/vio_0/vio_0/vio_0_in_context.xdc2default:default2!
AFE/buttons	2default:default8Z20-847h px� 
�
$Parsing XDC File [%s] for cell '%s'
848*designutils2k
Uc:/v23.1/FEB_test/FEB_test.gen/sources_1/ip/CMD_Fifo/CMD_Fifo/CMD_Fifo_in_context.xdc2default:default2(
DACControl/CmdFifo	2default:default8Z20-848h px� 
�
-Finished Parsing XDC File [%s] for cell '%s'
847*designutils2k
Uc:/v23.1/FEB_test/FEB_test.gen/sources_1/ip/CMD_Fifo/CMD_Fifo/CMD_Fifo_in_context.xdc2default:default2(
DACControl/CmdFifo	2default:default8Z20-847h px� 
�
$Parsing XDC File [%s] for cell '%s'
848*designutils2h
Rc:/v23.1/FEB_test/FEB_test.gen/sources_1/ip/DAC_Ram/DAC_Ram/DAC_Ram_in_context.xdc2default:default2*
DACControl/ShadowRam	2default:default8Z20-848h px� 
�
-Finished Parsing XDC File [%s] for cell '%s'
847*designutils2h
Rc:/v23.1/FEB_test/FEB_test.gen/sources_1/ip/DAC_Ram/DAC_Ram/DAC_Ram_in_context.xdc2default:default2*
DACControl/ShadowRam	2default:default8Z20-847h px� 
�
$Parsing XDC File [%s] for cell '%s'
848*designutils2q
[c:/v23.1/FEB_test/FEB_test.gen/sources_1/ip/LVDSTxBuff/LVDSTxBuff/LVDSTxBuff_in_context.xdc2default:default2,
uC_to_LVDSTX/FMTx_Buff	2default:default8Z20-848h px� 
�
-Finished Parsing XDC File [%s] for cell '%s'
847*designutils2q
[c:/v23.1/FEB_test/FEB_test.gen/sources_1/ip/LVDSTxBuff/LVDSTxBuff/LVDSTxBuff_in_context.xdc2default:default2,
uC_to_LVDSTX/FMTx_Buff	2default:default8Z20-847h px� 
�
$Parsing XDC File [%s] for cell '%s'
848*designutils2h
Rc:/v23.1/FEB_test/FEB_test.gen/sources_1/ip/PLL_AFE/PLL_AFE/PLL_AFE_in_context.xdc2default:default2
HF_PLL	2default:default8Z20-848h px� 
�
-Finished Parsing XDC File [%s] for cell '%s'
847*designutils2h
Rc:/v23.1/FEB_test/FEB_test.gen/sources_1/ip/PLL_AFE/PLL_AFE/PLL_AFE_in_context.xdc2default:default2
HF_PLL	2default:default8Z20-847h px� 
�
$Parsing XDC File [%s] for cell '%s'
848*designutils2w
ac:/v23.1/FEB_test/FEB_test.gen/sources_1/ip/SCFIFO_1Kx16/SCFIFO_1Kx16/SCFIFO_1Kx16_in_context.xdc2default:default23
uControllerRegister/AFE_DEBUG	2default:default8Z20-848h px� 
�
-Finished Parsing XDC File [%s] for cell '%s'
847*designutils2w
ac:/v23.1/FEB_test/FEB_test.gen/sources_1/ip/SCFIFO_1Kx16/SCFIFO_1Kx16/SCFIFO_1Kx16_in_context.xdc2default:default23
uControllerRegister/AFE_DEBUG	2default:default8Z20-847h px� 
�
$Parsing XDC File [%s] for cell '%s'
848*designutils2t
^c:/v23.1/FEB_test/FEB_test.gen/sources_1/ip/DPRAM_1Kx16/DPRAM_1Kx16/DPRAM_1Kx16_in_context.xdc2default:default2R
<AFE_DataPath_inst/Gen_Two_AFEs[0].Gen_Eight_Chans[0].AFEBuff	2default:default8Z20-848h px� 
�
-Finished Parsing XDC File [%s] for cell '%s'
847*designutils2t
^c:/v23.1/FEB_test/FEB_test.gen/sources_1/ip/DPRAM_1Kx16/DPRAM_1Kx16/DPRAM_1Kx16_in_context.xdc2default:default2R
<AFE_DataPath_inst/Gen_Two_AFEs[0].Gen_Eight_Chans[0].AFEBuff	2default:default8Z20-847h px� 
�
$Parsing XDC File [%s] for cell '%s'
848*designutils2t
^c:/v23.1/FEB_test/FEB_test.gen/sources_1/ip/DPRAM_1Kx16/DPRAM_1Kx16/DPRAM_1Kx16_in_context.xdc2default:default2R
<AFE_DataPath_inst/Gen_Two_AFEs[0].Gen_Eight_Chans[1].AFEBuff	2default:default8Z20-848h px� 
�
-Finished Parsing XDC File [%s] for cell '%s'
847*designutils2t
^c:/v23.1/FEB_test/FEB_test.gen/sources_1/ip/DPRAM_1Kx16/DPRAM_1Kx16/DPRAM_1Kx16_in_context.xdc2default:default2R
<AFE_DataPath_inst/Gen_Two_AFEs[0].Gen_Eight_Chans[1].AFEBuff	2default:default8Z20-847h px� 
�
$Parsing XDC File [%s] for cell '%s'
848*designutils2t
^c:/v23.1/FEB_test/FEB_test.gen/sources_1/ip/DPRAM_1Kx16/DPRAM_1Kx16/DPRAM_1Kx16_in_context.xdc2default:default2R
<AFE_DataPath_inst/Gen_Two_AFEs[0].Gen_Eight_Chans[2].AFEBuff	2default:default8Z20-848h px� 
�
-Finished Parsing XDC File [%s] for cell '%s'
847*designutils2t
^c:/v23.1/FEB_test/FEB_test.gen/sources_1/ip/DPRAM_1Kx16/DPRAM_1Kx16/DPRAM_1Kx16_in_context.xdc2default:default2R
<AFE_DataPath_inst/Gen_Two_AFEs[0].Gen_Eight_Chans[2].AFEBuff	2default:default8Z20-847h px� 
�
$Parsing XDC File [%s] for cell '%s'
848*designutils2t
^c:/v23.1/FEB_test/FEB_test.gen/sources_1/ip/DPRAM_1Kx16/DPRAM_1Kx16/DPRAM_1Kx16_in_context.xdc2default:default2R
<AFE_DataPath_inst/Gen_Two_AFEs[0].Gen_Eight_Chans[3].AFEBuff	2default:default8Z20-848h px� 
�
-Finished Parsing XDC File [%s] for cell '%s'
847*designutils2t
^c:/v23.1/FEB_test/FEB_test.gen/sources_1/ip/DPRAM_1Kx16/DPRAM_1Kx16/DPRAM_1Kx16_in_context.xdc2default:default2R
<AFE_DataPath_inst/Gen_Two_AFEs[0].Gen_Eight_Chans[3].AFEBuff	2default:default8Z20-847h px� 
�
$Parsing XDC File [%s] for cell '%s'
848*designutils2t
^c:/v23.1/FEB_test/FEB_test.gen/sources_1/ip/DPRAM_1Kx16/DPRAM_1Kx16/DPRAM_1Kx16_in_context.xdc2default:default2R
<AFE_DataPath_inst/Gen_Two_AFEs[0].Gen_Eight_Chans[4].AFEBuff	2default:default8Z20-848h px� 
�
-Finished Parsing XDC File [%s] for cell '%s'
847*designutils2t
^c:/v23.1/FEB_test/FEB_test.gen/sources_1/ip/DPRAM_1Kx16/DPRAM_1Kx16/DPRAM_1Kx16_in_context.xdc2default:default2R
<AFE_DataPath_inst/Gen_Two_AFEs[0].Gen_Eight_Chans[4].AFEBuff	2default:default8Z20-847h px� 
�
$Parsing XDC File [%s] for cell '%s'
848*designutils2t
^c:/v23.1/FEB_test/FEB_test.gen/sources_1/ip/DPRAM_1Kx16/DPRAM_1Kx16/DPRAM_1Kx16_in_context.xdc2default:default2R
<AFE_DataPath_inst/Gen_Two_AFEs[0].Gen_Eight_Chans[5].AFEBuff	2default:default8Z20-848h px� 
�
-Finished Parsing XDC File [%s] for cell '%s'
847*designutils2t
^c:/v23.1/FEB_test/FEB_test.gen/sources_1/ip/DPRAM_1Kx16/DPRAM_1Kx16/DPRAM_1Kx16_in_context.xdc2default:default2R
<AFE_DataPath_inst/Gen_Two_AFEs[0].Gen_Eight_Chans[5].AFEBuff	2default:default8Z20-847h px� 
�
$Parsing XDC File [%s] for cell '%s'
848*designutils2t
^c:/v23.1/FEB_test/FEB_test.gen/sources_1/ip/DPRAM_1Kx16/DPRAM_1Kx16/DPRAM_1Kx16_in_context.xdc2default:default2R
<AFE_DataPath_inst/Gen_Two_AFEs[0].Gen_Eight_Chans[6].AFEBuff	2default:default8Z20-848h px� 
�
-Finished Parsing XDC File [%s] for cell '%s'
847*designutils2t
^c:/v23.1/FEB_test/FEB_test.gen/sources_1/ip/DPRAM_1Kx16/DPRAM_1Kx16/DPRAM_1Kx16_in_context.xdc2default:default2R
<AFE_DataPath_inst/Gen_Two_AFEs[0].Gen_Eight_Chans[6].AFEBuff	2default:default8Z20-847h px� 
�
$Parsing XDC File [%s] for cell '%s'
848*designutils2t
^c:/v23.1/FEB_test/FEB_test.gen/sources_1/ip/DPRAM_1Kx16/DPRAM_1Kx16/DPRAM_1Kx16_in_context.xdc2default:default2R
<AFE_DataPath_inst/Gen_Two_AFEs[0].Gen_Eight_Chans[7].AFEBuff	2default:default8Z20-848h px� 
�
-Finished Parsing XDC File [%s] for cell '%s'
847*designutils2t
^c:/v23.1/FEB_test/FEB_test.gen/sources_1/ip/DPRAM_1Kx16/DPRAM_1Kx16/DPRAM_1Kx16_in_context.xdc2default:default2R
<AFE_DataPath_inst/Gen_Two_AFEs[0].Gen_Eight_Chans[7].AFEBuff	2default:default8Z20-847h px� 
�
$Parsing XDC File [%s] for cell '%s'
848*designutils2t
^c:/v23.1/FEB_test/FEB_test.gen/sources_1/ip/DPRAM_1Kx16/DPRAM_1Kx16/DPRAM_1Kx16_in_context.xdc2default:default2R
<AFE_DataPath_inst/Gen_Two_AFEs[1].Gen_Eight_Chans[0].AFEBuff	2default:default8Z20-848h px� 
�
-Finished Parsing XDC File [%s] for cell '%s'
847*designutils2t
^c:/v23.1/FEB_test/FEB_test.gen/sources_1/ip/DPRAM_1Kx16/DPRAM_1Kx16/DPRAM_1Kx16_in_context.xdc2default:default2R
<AFE_DataPath_inst/Gen_Two_AFEs[1].Gen_Eight_Chans[0].AFEBuff	2default:default8Z20-847h px� 
�
$Parsing XDC File [%s] for cell '%s'
848*designutils2t
^c:/v23.1/FEB_test/FEB_test.gen/sources_1/ip/DPRAM_1Kx16/DPRAM_1Kx16/DPRAM_1Kx16_in_context.xdc2default:default2R
<AFE_DataPath_inst/Gen_Two_AFEs[1].Gen_Eight_Chans[1].AFEBuff	2default:default8Z20-848h px� 
�
-Finished Parsing XDC File [%s] for cell '%s'
847*designutils2t
^c:/v23.1/FEB_test/FEB_test.gen/sources_1/ip/DPRAM_1Kx16/DPRAM_1Kx16/DPRAM_1Kx16_in_context.xdc2default:default2R
<AFE_DataPath_inst/Gen_Two_AFEs[1].Gen_Eight_Chans[1].AFEBuff	2default:default8Z20-847h px� 
�
$Parsing XDC File [%s] for cell '%s'
848*designutils2t
^c:/v23.1/FEB_test/FEB_test.gen/sources_1/ip/DPRAM_1Kx16/DPRAM_1Kx16/DPRAM_1Kx16_in_context.xdc2default:default2R
<AFE_DataPath_inst/Gen_Two_AFEs[1].Gen_Eight_Chans[2].AFEBuff	2default:default8Z20-848h px� 
�
-Finished Parsing XDC File [%s] for cell '%s'
847*designutils2t
^c:/v23.1/FEB_test/FEB_test.gen/sources_1/ip/DPRAM_1Kx16/DPRAM_1Kx16/DPRAM_1Kx16_in_context.xdc2default:default2R
<AFE_DataPath_inst/Gen_Two_AFEs[1].Gen_Eight_Chans[2].AFEBuff	2default:default8Z20-847h px� 
�
$Parsing XDC File [%s] for cell '%s'
848*designutils2t
^c:/v23.1/FEB_test/FEB_test.gen/sources_1/ip/DPRAM_1Kx16/DPRAM_1Kx16/DPRAM_1Kx16_in_context.xdc2default:default2R
<AFE_DataPath_inst/Gen_Two_AFEs[1].Gen_Eight_Chans[3].AFEBuff	2default:default8Z20-848h px� 
�
-Finished Parsing XDC File [%s] for cell '%s'
847*designutils2t
^c:/v23.1/FEB_test/FEB_test.gen/sources_1/ip/DPRAM_1Kx16/DPRAM_1Kx16/DPRAM_1Kx16_in_context.xdc2default:default2R
<AFE_DataPath_inst/Gen_Two_AFEs[1].Gen_Eight_Chans[3].AFEBuff	2default:default8Z20-847h px� 
�
$Parsing XDC File [%s] for cell '%s'
848*designutils2t
^c:/v23.1/FEB_test/FEB_test.gen/sources_1/ip/DPRAM_1Kx16/DPRAM_1Kx16/DPRAM_1Kx16_in_context.xdc2default:default2R
<AFE_DataPath_inst/Gen_Two_AFEs[1].Gen_Eight_Chans[4].AFEBuff	2default:default8Z20-848h px� 
�
-Finished Parsing XDC File [%s] for cell '%s'
847*designutils2t
^c:/v23.1/FEB_test/FEB_test.gen/sources_1/ip/DPRAM_1Kx16/DPRAM_1Kx16/DPRAM_1Kx16_in_context.xdc2default:default2R
<AFE_DataPath_inst/Gen_Two_AFEs[1].Gen_Eight_Chans[4].AFEBuff	2default:default8Z20-847h px� 
�
$Parsing XDC File [%s] for cell '%s'
848*designutils2t
^c:/v23.1/FEB_test/FEB_test.gen/sources_1/ip/DPRAM_1Kx16/DPRAM_1Kx16/DPRAM_1Kx16_in_context.xdc2default:default2R
<AFE_DataPath_inst/Gen_Two_AFEs[1].Gen_Eight_Chans[5].AFEBuff	2default:default8Z20-848h px� 
�
-Finished Parsing XDC File [%s] for cell '%s'
847*designutils2t
^c:/v23.1/FEB_test/FEB_test.gen/sources_1/ip/DPRAM_1Kx16/DPRAM_1Kx16/DPRAM_1Kx16_in_context.xdc2default:default2R
<AFE_DataPath_inst/Gen_Two_AFEs[1].Gen_Eight_Chans[5].AFEBuff	2default:default8Z20-847h px� 
�
$Parsing XDC File [%s] for cell '%s'
848*designutils2t
^c:/v23.1/FEB_test/FEB_test.gen/sources_1/ip/DPRAM_1Kx16/DPRAM_1Kx16/DPRAM_1Kx16_in_context.xdc2default:default2R
<AFE_DataPath_inst/Gen_Two_AFEs[1].Gen_Eight_Chans[6].AFEBuff	2default:default8Z20-848h px� 
�
-Finished Parsing XDC File [%s] for cell '%s'
847*designutils2t
^c:/v23.1/FEB_test/FEB_test.gen/sources_1/ip/DPRAM_1Kx16/DPRAM_1Kx16/DPRAM_1Kx16_in_context.xdc2default:default2R
<AFE_DataPath_inst/Gen_Two_AFEs[1].Gen_Eight_Chans[6].AFEBuff	2default:default8Z20-847h px� 
�
$Parsing XDC File [%s] for cell '%s'
848*designutils2t
^c:/v23.1/FEB_test/FEB_test.gen/sources_1/ip/DPRAM_1Kx16/DPRAM_1Kx16/DPRAM_1Kx16_in_context.xdc2default:default2R
<AFE_DataPath_inst/Gen_Two_AFEs[1].Gen_Eight_Chans[7].AFEBuff	2default:default8Z20-848h px� 
�
-Finished Parsing XDC File [%s] for cell '%s'
847*designutils2t
^c:/v23.1/FEB_test/FEB_test.gen/sources_1/ip/DPRAM_1Kx16/DPRAM_1Kx16/DPRAM_1Kx16_in_context.xdc2default:default2R
<AFE_DataPath_inst/Gen_Two_AFEs[1].Gen_Eight_Chans[7].AFEBuff	2default:default8Z20-847h px� 
�
$Parsing XDC File [%s] for cell '%s'
848*designutils2�
jc:/v23.1/FEB_test/FEB_test.gen/sources_1/ip/AFE_DP_Pipeline/AFE_DP_Pipeline/AFE_DP_Pipeline_in_context.xdc2default:default2R
<AFE_DataPath_inst/AFE_Pipeline_inst/Gen_Two_AFEs[0].Pipeline	2default:default8Z20-848h px� 
�
-Finished Parsing XDC File [%s] for cell '%s'
847*designutils2�
jc:/v23.1/FEB_test/FEB_test.gen/sources_1/ip/AFE_DP_Pipeline/AFE_DP_Pipeline/AFE_DP_Pipeline_in_context.xdc2default:default2R
<AFE_DataPath_inst/AFE_Pipeline_inst/Gen_Two_AFEs[0].Pipeline	2default:default8Z20-847h px� 
�
$Parsing XDC File [%s] for cell '%s'
848*designutils2�
jc:/v23.1/FEB_test/FEB_test.gen/sources_1/ip/AFE_DP_Pipeline/AFE_DP_Pipeline/AFE_DP_Pipeline_in_context.xdc2default:default2R
<AFE_DataPath_inst/AFE_Pipeline_inst/Gen_Two_AFEs[1].Pipeline	2default:default8Z20-848h px� 
�
-Finished Parsing XDC File [%s] for cell '%s'
847*designutils2�
jc:/v23.1/FEB_test/FEB_test.gen/sources_1/ip/AFE_DP_Pipeline/AFE_DP_Pipeline/AFE_DP_Pipeline_in_context.xdc2default:default2R
<AFE_DataPath_inst/AFE_Pipeline_inst/Gen_Two_AFEs[1].Pipeline	2default:default8Z20-847h px� 
�
$Parsing XDC File [%s] for cell '%s'
848*designutils2n
Xc:/v23.1/FEB_test/FEB_test.gen/sources_1/ip/DAC_ila_1/DAC_ila_1/DAC_ila_1_in_context.xdc2default:default2/
AFE/generateILA1.AFE_ILA1	2default:default8Z20-848h px� 
�
-Finished Parsing XDC File [%s] for cell '%s'
847*designutils2n
Xc:/v23.1/FEB_test/FEB_test.gen/sources_1/ip/DAC_ila_1/DAC_ila_1/DAC_ila_1_in_context.xdc2default:default2/
AFE/generateILA1.AFE_ILA1	2default:default8Z20-847h px� 
�
$Parsing XDC File [%s] for cell '%s'
848*designutils2n
Xc:/v23.1/FEB_test/FEB_test.gen/sources_1/ip/AFE_ila_0/AFE_ila_0/AFE_ila_0_in_context.xdc2default:default2*
generateILA1.AFE_ila	2default:default8Z20-848h px� 
�
-Finished Parsing XDC File [%s] for cell '%s'
847*designutils2n
Xc:/v23.1/FEB_test/FEB_test.gen/sources_1/ip/AFE_ila_0/AFE_ila_0/AFE_ila_0_in_context.xdc2default:default2*
generateILA1.AFE_ila	2default:default8Z20-847h px� 
�
$Parsing XDC File [%s] for cell '%s'
848*designutils2�
jc:/v23.1/FEB_test/FEB_test.gen/sources_1/ip/DDR3LController/DDR3LController/DDR3LController_in_context.xdc2default:default2(
DDR/DDR_Controller	2default:default8Z20-848h px� 
�
-Finished Parsing XDC File [%s] for cell '%s'
847*designutils2�
jc:/v23.1/FEB_test/FEB_test.gen/sources_1/ip/DDR3LController/DDR3LController/DDR3LController_in_context.xdc2default:default2(
DDR/DDR_Controller	2default:default8Z20-847h px� 
�
Parsing XDC File [%s]
179*designutils2R
<C:/v23.1/FEB_test/FEB_test.srcs/constrs_1/new/FEB_pinout.xdc2default:default8Z20-179h px� 
�
No nets matched '%s'.
507*	planAhead2 
CpldRst_IBUF2default:default2R
<C:/v23.1/FEB_test/FEB_test.srcs/constrs_1/new/FEB_pinout.xdc2default:default2
4342default:default8@Z12-507h px�
�
Finished Parsing XDC File [%s]
178*designutils2R
<C:/v23.1/FEB_test/FEB_test.srcs/constrs_1/new/FEB_pinout.xdc2default:default8Z20-178h px� 
�
�One or more constraints failed evaluation while reading constraint file [%s] and the design contains unresolved black boxes. These constraints will be read post-synthesis (as long as their source constraint file is marked as used_in_implementation) and should be applied correctly then. You should review the constraints listed in the file [%s] and check the run log file to verify that these constraints were correctly applied.301*project2P
<C:/v23.1/FEB_test/FEB_test.srcs/constrs_1/new/FEB_pinout.xdc2default:default2)
.Xil/FEB_propImpl.xdc2default:defaultZ1-498h px� 
�
�Implementation specific constraints were found while reading constraint file [%s]. These constraints will be ignored for synthesis but will be used in implementation. Impacted constraints are listed in the file [%s].
233*project2P
<C:/v23.1/FEB_test/FEB_test.srcs/constrs_1/new/FEB_pinout.xdc2default:default2)
.Xil/FEB_propImpl.xdc2default:defaultZ1-236h px� 
�
Parsing XDC File [%s]
179*designutils2V
@C:/v23.1/FEB_test/FEB_test.srcs/constrs_1/new/BD_constraints.xdc2default:default8Z20-179h px� 
�
No ports matched '%s'.
584*	planAhead2
BD_VXO_P2default:default2V
@C:/v23.1/FEB_test/FEB_test.srcs/constrs_1/new/BD_constraints.xdc2default:default2
12default:default8@Z12-584h px�
�
No ports matched '%s'.
584*	planAhead2
BD_VXO_P2default:default2V
@C:/v23.1/FEB_test/FEB_test.srcs/constrs_1/new/BD_constraints.xdc2default:default2
22default:default8@Z12-584h px�
�
No ports matched '%s'.
584*	planAhead2
BD_VXO_N2default:default2V
@C:/v23.1/FEB_test/FEB_test.srcs/constrs_1/new/BD_constraints.xdc2default:default2
32default:default8@Z12-584h px�
�
No ports matched '%s'.
584*	planAhead2

BD_CpldRst2default:default2V
@C:/v23.1/FEB_test/FEB_test.srcs/constrs_1/new/BD_constraints.xdc2default:default2
52default:default8@Z12-584h px�
�
No ports matched '%s'.
584*	planAhead2

BD_CpldRst2default:default2V
@C:/v23.1/FEB_test/FEB_test.srcs/constrs_1/new/BD_constraints.xdc2default:default2
62default:default8@Z12-584h px�
�
No ports matched '%s'.
584*	planAhead2"
uart_rtl_0_rxd2default:default2V
@C:/v23.1/FEB_test/FEB_test.srcs/constrs_1/new/BD_constraints.xdc2default:default2
332default:default8@Z12-584h px�
�
No ports matched '%s'.
584*	planAhead2"
uart_rtl_0_txd2default:default2V
@C:/v23.1/FEB_test/FEB_test.srcs/constrs_1/new/BD_constraints.xdc2default:default2
342default:default8@Z12-584h px�
�
No ports matched '%s'.
584*	planAhead2"
uart_rtl_0_rxd2default:default2V
@C:/v23.1/FEB_test/FEB_test.srcs/constrs_1/new/BD_constraints.xdc2default:default2
352default:default8@Z12-584h px�
�
No ports matched '%s'.
584*	planAhead2"
uart_rtl_0_txd2default:default2V
@C:/v23.1/FEB_test/FEB_test.srcs/constrs_1/new/BD_constraints.xdc2default:default2
362default:default8@Z12-584h px�
�
Finished Parsing XDC File [%s]
178*designutils2V
@C:/v23.1/FEB_test/FEB_test.srcs/constrs_1/new/BD_constraints.xdc2default:default8Z20-178h px� 
�
�One or more constraints failed evaluation while reading constraint file [%s] and the design contains unresolved black boxes. These constraints will be read post-synthesis (as long as their source constraint file is marked as used_in_implementation) and should be applied correctly then. You should review the constraints listed in the file [%s] and check the run log file to verify that these constraints were correctly applied.301*project2T
@C:/v23.1/FEB_test/FEB_test.srcs/constrs_1/new/BD_constraints.xdc2default:default2)
.Xil/FEB_propImpl.xdc2default:defaultZ1-498h px� 
�
�Implementation specific constraints were found while reading constraint file [%s]. These constraints will be ignored for synthesis but will be used in implementation. Impacted constraints are listed in the file [%s].
233*project2T
@C:/v23.1/FEB_test/FEB_test.srcs/constrs_1/new/BD_constraints.xdc2default:default2)
.Xil/FEB_propImpl.xdc2default:defaultZ1-236h px� 
�
Parsing XDC File [%s]
179*designutils2L
6C:/v23.1/FEB_test/FEB_test.runs/synth_1/dont_touch.xdc2default:default8Z20-179h px� 
�
Finished Parsing XDC File [%s]
178*designutils2L
6C:/v23.1/FEB_test/FEB_test.runs/synth_1/dont_touch.xdc2default:default8Z20-178h px� 
H
&Completed Processing XDC Constraints

245*projectZ1-263h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2.
Netlist sorting complete. 2default:default2
00:00:002default:default2 
00:00:00.0022default:default2
2743.4022default:default2
0.0002default:defaultZ17-268h px� 
~
!Unisim Transformation Summary:
%s111*project29
%No Unisim elements were transformed.
2default:defaultZ1-111h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common24
 Constraint Validation Runtime : 2default:default2
00:00:002default:default2 
00:00:00.0402default:default2
2743.4022default:default2
0.0002default:defaultZ17-268h px� 
�
�Clock period '%s' specified during out-of-context synthesis of instance '%s' at clock pin '%s' is different from the actual clock period '%s', this can lead to different synthesis results.
203*timing2
20.0002default:default2P
<AFE_DataPath_inst/Gen_Two_AFEs[0].Gen_Eight_Chans[0].AFEBuff2default:default2
clka2default:default2
12.5002default:defaultZ38-316h px� 
�
�Clock period '%s' specified during out-of-context synthesis of instance '%s' at clock pin '%s' is different from the actual clock period '%s', this can lead to different synthesis results.
203*timing2
20.0002default:default2P
<AFE_DataPath_inst/Gen_Two_AFEs[0].Gen_Eight_Chans[1].AFEBuff2default:default2
clka2default:default2
12.5002default:defaultZ38-316h px� 
�
�Clock period '%s' specified during out-of-context synthesis of instance '%s' at clock pin '%s' is different from the actual clock period '%s', this can lead to different synthesis results.
203*timing2
20.0002default:default2P
<AFE_DataPath_inst/Gen_Two_AFEs[0].Gen_Eight_Chans[2].AFEBuff2default:default2
clka2default:default2
12.5002default:defaultZ38-316h px� 
�
�Clock period '%s' specified during out-of-context synthesis of instance '%s' at clock pin '%s' is different from the actual clock period '%s', this can lead to different synthesis results.
203*timing2
20.0002default:default2P
<AFE_DataPath_inst/Gen_Two_AFEs[0].Gen_Eight_Chans[3].AFEBuff2default:default2
clka2default:default2
12.5002default:defaultZ38-316h px� 
�
�Clock period '%s' specified during out-of-context synthesis of instance '%s' at clock pin '%s' is different from the actual clock period '%s', this can lead to different synthesis results.
203*timing2
20.0002default:default2P
<AFE_DataPath_inst/Gen_Two_AFEs[0].Gen_Eight_Chans[4].AFEBuff2default:default2
clka2default:default2
12.5002default:defaultZ38-316h px� 
�
�Clock period '%s' specified during out-of-context synthesis of instance '%s' at clock pin '%s' is different from the actual clock period '%s', this can lead to different synthesis results.
203*timing2
20.0002default:default2P
<AFE_DataPath_inst/Gen_Two_AFEs[0].Gen_Eight_Chans[5].AFEBuff2default:default2
clka2default:default2
12.5002default:defaultZ38-316h px� 
�
�Clock period '%s' specified during out-of-context synthesis of instance '%s' at clock pin '%s' is different from the actual clock period '%s', this can lead to different synthesis results.
203*timing2
20.0002default:default2P
<AFE_DataPath_inst/Gen_Two_AFEs[0].Gen_Eight_Chans[6].AFEBuff2default:default2
clka2default:default2
12.5002default:defaultZ38-316h px� 
�
�Clock period '%s' specified during out-of-context synthesis of instance '%s' at clock pin '%s' is different from the actual clock period '%s', this can lead to different synthesis results.
203*timing2
20.0002default:default2P
<AFE_DataPath_inst/Gen_Two_AFEs[0].Gen_Eight_Chans[7].AFEBuff2default:default2
clka2default:default2
12.5002default:defaultZ38-316h px� 
�
�Clock period '%s' specified during out-of-context synthesis of instance '%s' at clock pin '%s' is different from the actual clock period '%s', this can lead to different synthesis results.
203*timing2
20.0002default:default2P
<AFE_DataPath_inst/Gen_Two_AFEs[1].Gen_Eight_Chans[0].AFEBuff2default:default2
clka2default:default2
12.5002default:defaultZ38-316h px� 
�
�Clock period '%s' specified during out-of-context synthesis of instance '%s' at clock pin '%s' is different from the actual clock period '%s', this can lead to different synthesis results.
203*timing2
20.0002default:default2P
<AFE_DataPath_inst/Gen_Two_AFEs[1].Gen_Eight_Chans[1].AFEBuff2default:default2
clka2default:default2
12.5002default:defaultZ38-316h px� 
�
�Clock period '%s' specified during out-of-context synthesis of instance '%s' at clock pin '%s' is different from the actual clock period '%s', this can lead to different synthesis results.
203*timing2
20.0002default:default2P
<AFE_DataPath_inst/Gen_Two_AFEs[1].Gen_Eight_Chans[2].AFEBuff2default:default2
clka2default:default2
12.5002default:defaultZ38-316h px� 
�
�Clock period '%s' specified during out-of-context synthesis of instance '%s' at clock pin '%s' is different from the actual clock period '%s', this can lead to different synthesis results.
203*timing2
20.0002default:default2P
<AFE_DataPath_inst/Gen_Two_AFEs[1].Gen_Eight_Chans[3].AFEBuff2default:default2
clka2default:default2
12.5002default:defaultZ38-316h px� 
�
�Clock period '%s' specified during out-of-context synthesis of instance '%s' at clock pin '%s' is different from the actual clock period '%s', this can lead to different synthesis results.
203*timing2
20.0002default:default2P
<AFE_DataPath_inst/Gen_Two_AFEs[1].Gen_Eight_Chans[4].AFEBuff2default:default2
clka2default:default2
12.5002default:defaultZ38-316h px� 
�
�Clock period '%s' specified during out-of-context synthesis of instance '%s' at clock pin '%s' is different from the actual clock period '%s', this can lead to different synthesis results.
203*timing2
20.0002default:default2P
<AFE_DataPath_inst/Gen_Two_AFEs[1].Gen_Eight_Chans[5].AFEBuff2default:default2
clka2default:default2
12.5002default:defaultZ38-316h px� 
�
�Clock period '%s' specified during out-of-context synthesis of instance '%s' at clock pin '%s' is different from the actual clock period '%s', this can lead to different synthesis results.
203*timing2
20.0002default:default2P
<AFE_DataPath_inst/Gen_Two_AFEs[1].Gen_Eight_Chans[6].AFEBuff2default:default2
clka2default:default2
12.5002default:defaultZ38-316h px� 
�
�Clock period '%s' specified during out-of-context synthesis of instance '%s' at clock pin '%s' is different from the actual clock period '%s', this can lead to different synthesis results.
203*timing2
20.0002default:default2P
<AFE_DataPath_inst/Gen_Two_AFEs[1].Gen_Eight_Chans[7].AFEBuff2default:default2
clka2default:default2
12.5002default:defaultZ38-316h px� 
�
�Clock period '%s' specified during out-of-context synthesis of instance '%s' at clock pin '%s' is different from the actual clock period '%s', this can lead to different synthesis results.
203*timing2
20.0002default:default2P
<AFE_DataPath_inst/AFE_Pipeline_inst/Gen_Two_AFEs[0].Pipeline2default:default2
clka2default:default2
12.5002default:defaultZ38-316h px� 
�
�Clock period '%s' specified during out-of-context synthesis of instance '%s' at clock pin '%s' is different from the actual clock period '%s', this can lead to different synthesis results.
203*timing2
20.0002default:default2P
<AFE_DataPath_inst/AFE_Pipeline_inst/Gen_Two_AFEs[1].Pipeline2default:default2
clka2default:default2
12.5002default:defaultZ38-316h px� 
�
�Clock period '%s' specified during out-of-context synthesis of instance '%s' at clock pin '%s' is different from the actual clock period '%s', this can lead to different synthesis results.
203*timing2
20.0002default:default2(
DACControl/ShadowRam2default:default2
clka2default:default2
10.0002default:defaultZ38-316h px� 

VNo compile time benefit to using incremental synthesis; A full resynthesis will be run2353*designutilsZ20-5440h px� 
�
�Flow is switching to default flow due to incremental criteria not met. If you would like to alter this behaviour and have the flow terminate instead, please set the following parameter config_implementation {autoIncr.Synth.RejectBehavior Terminate}2229*designutilsZ20-4379h px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
Finished Constraint Validation : Time (s): cpu = 00:00:17 ; elapsed = 00:00:19 . Memory (MB): peak = 2743.402 ; gain = 706.742
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
V
%s
*synth2>
*Start Loading Part and Timing Information
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
J
%s
*synth22
Loading part: xc7s50fgga484-2
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
�Finished Loading Part and Timing Information : Time (s): cpu = 00:00:17 ; elapsed = 00:00:19 . Memory (MB): peak = 2743.402 ; gain = 706.742
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
Z
%s
*synth2B
.Start Applying 'set_property' XDC Constraints
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
�Finished applying 'set_property' XDC Constraints : Time (s): cpu = 00:00:18 ; elapsed = 00:00:19 . Memory (MB): peak = 2743.402 ; gain = 706.742
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
3inferred FSM for state register '%s' in module '%s'802*oasys2 
AlignSeq_reg2default:default2
DAC2default:defaultZ8-802h px� 
�
3inferred FSM for state register '%s' in module '%s'802*oasys2 
OD_Write_reg2default:default2
DAC2default:defaultZ8-802h px� 
�
3inferred FSM for state register '%s' in module '%s'802*oasys2#
Octal_Shift_reg2default:default2
DAC2default:defaultZ8-802h px� 
�
3inferred FSM for state register '%s' in module '%s'802*oasys2
	state_reg2default:default2
auto_FSM2default:defaultZ8-802h px� 
�
3inferred FSM for state register '%s' in module '%s'802*oasys2"
prev_state_reg2default:default2!
AFE_Interface2default:defaultZ8-802h px� 
�
3inferred FSM for state register '%s' in module '%s'802*oasys2K
7Gen_Two_AFEs[0].Gen_Eight_Chans[0].Input_Seqs_reg[0][0]2default:default2 
AFE_DataPath2default:defaultZ8-802h px� 
�
3inferred FSM for state register '%s' in module '%s'802*oasys2K
7Gen_Two_AFEs[0].Gen_Eight_Chans[1].Input_Seqs_reg[0][1]2default:default2 
AFE_DataPath2default:defaultZ8-802h px� 
�
3inferred FSM for state register '%s' in module '%s'802*oasys2K
7Gen_Two_AFEs[0].Gen_Eight_Chans[2].Input_Seqs_reg[0][2]2default:default2 
AFE_DataPath2default:defaultZ8-802h px� 
�
3inferred FSM for state register '%s' in module '%s'802*oasys2K
7Gen_Two_AFEs[0].Gen_Eight_Chans[3].Input_Seqs_reg[0][3]2default:default2 
AFE_DataPath2default:defaultZ8-802h px� 
�
3inferred FSM for state register '%s' in module '%s'802*oasys2K
7Gen_Two_AFEs[0].Gen_Eight_Chans[4].Input_Seqs_reg[0][4]2default:default2 
AFE_DataPath2default:defaultZ8-802h px� 
�
3inferred FSM for state register '%s' in module '%s'802*oasys2K
7Gen_Two_AFEs[0].Gen_Eight_Chans[5].Input_Seqs_reg[0][5]2default:default2 
AFE_DataPath2default:defaultZ8-802h px� 
�
3inferred FSM for state register '%s' in module '%s'802*oasys2K
7Gen_Two_AFEs[0].Gen_Eight_Chans[6].Input_Seqs_reg[0][6]2default:default2 
AFE_DataPath2default:defaultZ8-802h px� 
�
3inferred FSM for state register '%s' in module '%s'802*oasys2K
7Gen_Two_AFEs[0].Gen_Eight_Chans[7].Input_Seqs_reg[0][7]2default:default2 
AFE_DataPath2default:defaultZ8-802h px� 
�
3inferred FSM for state register '%s' in module '%s'802*oasys2K
7Gen_Two_AFEs[1].Gen_Eight_Chans[0].Input_Seqs_reg[1][0]2default:default2 
AFE_DataPath2default:defaultZ8-802h px� 
�
3inferred FSM for state register '%s' in module '%s'802*oasys2K
7Gen_Two_AFEs[1].Gen_Eight_Chans[1].Input_Seqs_reg[1][1]2default:default2 
AFE_DataPath2default:defaultZ8-802h px� 
�
3inferred FSM for state register '%s' in module '%s'802*oasys2K
7Gen_Two_AFEs[1].Gen_Eight_Chans[2].Input_Seqs_reg[1][2]2default:default2 
AFE_DataPath2default:defaultZ8-802h px� 
�
3inferred FSM for state register '%s' in module '%s'802*oasys2K
7Gen_Two_AFEs[1].Gen_Eight_Chans[3].Input_Seqs_reg[1][3]2default:default2 
AFE_DataPath2default:defaultZ8-802h px� 
�
3inferred FSM for state register '%s' in module '%s'802*oasys2K
7Gen_Two_AFEs[1].Gen_Eight_Chans[4].Input_Seqs_reg[1][4]2default:default2 
AFE_DataPath2default:defaultZ8-802h px� 
�
3inferred FSM for state register '%s' in module '%s'802*oasys2K
7Gen_Two_AFEs[1].Gen_Eight_Chans[5].Input_Seqs_reg[1][5]2default:default2 
AFE_DataPath2default:defaultZ8-802h px� 
�
3inferred FSM for state register '%s' in module '%s'802*oasys2K
7Gen_Two_AFEs[1].Gen_Eight_Chans[6].Input_Seqs_reg[1][6]2default:default2 
AFE_DataPath2default:defaultZ8-802h px� 
�
3inferred FSM for state register '%s' in module '%s'802*oasys2K
7Gen_Two_AFEs[1].Gen_Eight_Chans[7].Input_Seqs_reg[1][7]2default:default2 
AFE_DataPath2default:defaultZ8-802h px� 
�
3inferred FSM for state register '%s' in module '%s'802*oasys2 
Rx_State_reg2default:default2
FM_Rx2default:defaultZ8-802h px� 
�
3inferred FSM for state register '%s' in module '%s'802*oasys2%
DDR_FSM_state_reg2default:default2
DDR_test2default:defaultZ8-802h px� 
�
3inferred FSM for state register '%s' in module '%s'802*oasys2"
OneWireSeq_reg2default:default2
One_Wire2default:defaultZ8-802h px� 
�
3inferred FSM for state register '%s' in module '%s'802*oasys2!
TxBitWdth_reg2default:default2
FM_Tx2default:defaultZ8-802h px� 
�
3inferred FSM for state register '%s' in module '%s'802*oasys2 
Tx_State_reg2default:default2
FM_Tx2default:defaultZ8-802h px� 
�
%s
*synth2x
d---------------------------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s
*synth2t
`                   State |                     New Encoding |                Previous Encoding 
2default:defaulth p
x
� 
�
%s
*synth2x
d---------------------------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s
*synth2s
_                    idle |                               01 |                               00
2default:defaulth p
x
� 
�
%s
*synth2s
_                   shift |                               11 |                               01
2default:defaulth p
x
� 
�
%s
*synth2s
_               clearsync |                               10 |                               10
2default:defaulth p
x
� 
�
%s
*synth2s
_                 setload |                               00 |                               11
2default:defaulth p
x
� 
�
%s
*synth2x
d---------------------------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
Gencoded FSM with state register '%s' using encoding '%s' in module '%s'3353*oasys2#
Octal_Shift_reg2default:default2

sequential2default:default2
DAC2default:defaultZ8-3354h px� 
�
%s
*synth2x
d---------------------------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s
*synth2t
`                   State |                     New Encoding |                Previous Encoding 
2default:defaulth p
x
� 
�
%s
*synth2x
d---------------------------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s
*synth2s
_                    idle |                               00 |                              000
2default:defaulth p
x
� 
�
%s
*synth2s
_                 sendpdn |                               11 |                              001
2default:defaulth p
x
� 
�
%s
*synth2s
_                 sendpen |                               10 |                              010
2default:defaulth p
x
� 
�
%s
*synth2s
_                 sendrst |                               01 |                              011
2default:defaulth p
x
� 
�
%s
*synth2x
d---------------------------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
Gencoded FSM with state register '%s' using encoding '%s' in module '%s'3353*oasys2 
AlignSeq_reg2default:default2

sequential2default:default2
DAC2default:defaultZ8-3354h px� 
�
%s
*synth2x
d---------------------------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s
*synth2t
`                   State |                     New Encoding |                Previous Encoding 
2default:defaulth p
x
� 
�
%s
*synth2x
d---------------------------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s
*synth2s
_                    idle |                            00010 |                              000
2default:defaulth p
x
� 
�
%s
*synth2s
_              setafesel0 |                            10000 |                              001
2default:defaulth p
x
� 
�
%s
*synth2s
_                 wrtafe0 |                            01000 |                              010
2default:defaulth p
x
� 
�
%s
*synth2s
_              setafesel1 |                            00100 |                              011
2default:defaulth p
x
� 
�
%s
*synth2s
_                 wrtafe1 |                            00001 |                              100
2default:defaulth p
x
� 
�
%s
*synth2x
d---------------------------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
Gencoded FSM with state register '%s' using encoding '%s' in module '%s'3353*oasys2 
OD_Write_reg2default:default2
one-hot2default:default2
DAC2default:defaultZ8-3354h px� 
�
%s
*synth2x
d---------------------------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s
*synth2t
`                   State |                     New Encoding |                Previous Encoding 
2default:defaulth p
x
� 
�
%s
*synth2x
d---------------------------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s
*synth2s
_                     rst |                    0000000000001 |                             0000
2default:defaulth p
x
� 
�
%s
*synth2s
_      load_cntvalue_init |                    0000000000010 |                             0001
2default:defaulth p
x
� 
�
%s
*synth2s
_      wait_cntvalue_init |                    0000000000100 |                             0010
2default:defaulth p
x
� 
�
%s
*synth2s
_             sample_init |                    0000000001000 |                             0011
2default:defaulth p
x
� 
�
%s
*synth2s
_           load_cntvalue |                    0000000010000 |                             0100
2default:defaulth p
x
� 
�
%s
*synth2s
_           wait_cntvalue |                    0000000100000 |                             0101
2default:defaulth p
x
� 
�
%s
*synth2s
_              edge_check |                    0000001000000 |                             0110
2default:defaulth p
x
� 
�
%s
*synth2s
_     load_cntvalue_final |                    0000010000000 |                             0111
2default:defaulth p
x
� 
�
%s
*synth2s
_     wait_cntvalue_final |                    0000100000000 |                             1000
2default:defaulth p
x
� 
�
%s
*synth2s
_               chk_frame |                    0001000000000 |                             1001
2default:defaulth p
x
� 
�
%s
*synth2s
_                 aligned |                    0010000000000 |                             1100
2default:defaulth p
x
� 
�
%s
*synth2s
_                  slipit |                    0100000000000 |                             1010
2default:defaulth p
x
� 
�
%s
*synth2s
_               wait_slip |                    1000000000000 |                             1011
2default:defaulth p
x
� 
�
%s
*synth2x
d---------------------------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
Gencoded FSM with state register '%s' using encoding '%s' in module '%s'3353*oasys2
	state_reg2default:default2
one-hot2default:default2
auto_FSM2default:defaultZ8-3354h px� 
�
%s
*synth2x
d---------------------------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s
*synth2t
`                   State |                     New Encoding |                Previous Encoding 
2default:defaulth p
x
� 
�
%s
*synth2x
d---------------------------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s
*synth2s
_              resetstate |                 0000000000000001 |                             0000
2default:defaulth p
x
� 
�
%s
*synth2s
_                    idle |                 0000000000000010 |                             0001
2default:defaulth p
x
� 
�
%s
*synth2s
_                    init |                 0000000000000100 |                             0010
2default:defaulth p
x
� 
�
%s
*synth2s
_               softreset |                 0000000000001000 |                             0011
2default:defaulth p
x
� 
�
%s
*synth2s
_                waitspi1 |                 0000000000010000 |                             1000
2default:defaulth p
x
� 
�
%s
*synth2s
_                waitspi2 |                 0000000000100000 |                             1001
2default:defaulth p
x
� 
�
%s
*synth2s
_                enoutput |                 0000000001000000 |                             0100
2default:defaulth p
x
� 
�
%s
*synth2s
_                waitspi3 |                 0000000010000000 |                             1010
2default:defaulth p
x
� 
�
%s
*synth2s
_                waitspi4 |                 0000000100000000 |                             1011
2default:defaulth p
x
� 
�
%s
*synth2s
_             testpattern |                 0000001000000000 |                             0101
2default:defaulth p
x
� 
�
%s
*synth2s
_                waitspi5 |                 0000010000000000 |                             1100
2default:defaulth p
x
� 
�
%s
*synth2s
_                waitspi6 |                 0000100000000000 |                             1101
2default:defaulth p
x
� 
�
%s
*synth2s
_             serdatarate |                 0001000000000000 |                             0110
2default:defaulth p
x
� 
�
%s
*synth2s
_                waitspi7 |                 0010000000000000 |                             1110
2default:defaulth p
x
� 
�
%s
*synth2s
_                waitspi8 |                 0100000000000000 |                             1111
2default:defaulth p
x
� 
�
%s
*synth2s
_           adcresolution |                 1000000000000000 |                             0111
2default:defaulth p
x
� 
�
%s
*synth2x
d---------------------------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
Gencoded FSM with state register '%s' using encoding '%s' in module '%s'3353*oasys2"
prev_state_reg2default:default2
one-hot2default:default2!
AFE_Interface2default:defaultZ8-3354h px� 
�
%s
*synth2x
d---------------------------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s
*synth2t
`                   State |                     New Encoding |                Previous Encoding 
2default:defaulth p
x
� 
�
%s
*synth2x
d---------------------------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s
*synth2s
_                    idle |                              001 |                              000
2default:defaulth p
x
� 
�
%s
*synth2s
_               increment |                              110 |                              001
2default:defaulth p
x
� 
�
%s
*synth2s
_               wrtchanno |                              100 |                              010
2default:defaulth p
x
� 
�
%s
*synth2s
_            wrttimestamp |                              101 |                              011
2default:defaulth p
x
� 
�
%s
*synth2s
_                 wrthits |                              011 |                              100
2default:defaulth p
x
� 
�
%s
*synth2s
_             wrthitwdcnt |                              010 |                              101
2default:defaulth p
x
� 
�
%s
*synth2s
_              ldnxtwrtad |                              000 |                              110
2default:defaulth p
x
� 
�
%s
*synth2x
d---------------------------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
Gencoded FSM with state register '%s' using encoding '%s' in module '%s'3353*oasys2K
7Gen_Two_AFEs[0].Gen_Eight_Chans[0].Input_Seqs_reg[0][0]2default:default2

sequential2default:default2 
AFE_DataPath2default:defaultZ8-3354h px� 
�
%s
*synth2x
d---------------------------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s
*synth2t
`                   State |                     New Encoding |                Previous Encoding 
2default:defaulth p
x
� 
�
%s
*synth2x
d---------------------------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s
*synth2s
_                    idle |                              001 |                              000
2default:defaulth p
x
� 
�
%s
*synth2s
_               increment |                              110 |                              001
2default:defaulth p
x
� 
�
%s
*synth2s
_               wrtchanno |                              100 |                              010
2default:defaulth p
x
� 
�
%s
*synth2s
_            wrttimestamp |                              101 |                              011
2default:defaulth p
x
� 
�
%s
*synth2s
_                 wrthits |                              011 |                              100
2default:defaulth p
x
� 
�
%s
*synth2s
_             wrthitwdcnt |                              010 |                              101
2default:defaulth p
x
� 
�
%s
*synth2s
_              ldnxtwrtad |                              000 |                              110
2default:defaulth p
x
� 
�
%s
*synth2x
d---------------------------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
Gencoded FSM with state register '%s' using encoding '%s' in module '%s'3353*oasys2K
7Gen_Two_AFEs[0].Gen_Eight_Chans[1].Input_Seqs_reg[0][1]2default:default2

sequential2default:default2 
AFE_DataPath2default:defaultZ8-3354h px� 
�
%s
*synth2x
d---------------------------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s
*synth2t
`                   State |                     New Encoding |                Previous Encoding 
2default:defaulth p
x
� 
�
%s
*synth2x
d---------------------------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s
*synth2s
_                    idle |                              001 |                              000
2default:defaulth p
x
� 
�
%s
*synth2s
_               increment |                              110 |                              001
2default:defaulth p
x
� 
�
%s
*synth2s
_               wrtchanno |                              100 |                              010
2default:defaulth p
x
� 
�
%s
*synth2s
_            wrttimestamp |                              101 |                              011
2default:defaulth p
x
� 
�
%s
*synth2s
_                 wrthits |                              011 |                              100
2default:defaulth p
x
� 
�
%s
*synth2s
_             wrthitwdcnt |                              010 |                              101
2default:defaulth p
x
� 
�
%s
*synth2s
_              ldnxtwrtad |                              000 |                              110
2default:defaulth p
x
� 
�
%s
*synth2x
d---------------------------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
Gencoded FSM with state register '%s' using encoding '%s' in module '%s'3353*oasys2K
7Gen_Two_AFEs[0].Gen_Eight_Chans[2].Input_Seqs_reg[0][2]2default:default2

sequential2default:default2 
AFE_DataPath2default:defaultZ8-3354h px� 
�
%s
*synth2x
d---------------------------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s
*synth2t
`                   State |                     New Encoding |                Previous Encoding 
2default:defaulth p
x
� 
�
%s
*synth2x
d---------------------------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s
*synth2s
_                    idle |                              001 |                              000
2default:defaulth p
x
� 
�
%s
*synth2s
_               increment |                              110 |                              001
2default:defaulth p
x
� 
�
%s
*synth2s
_               wrtchanno |                              100 |                              010
2default:defaulth p
x
� 
�
%s
*synth2s
_            wrttimestamp |                              101 |                              011
2default:defaulth p
x
� 
�
%s
*synth2s
_                 wrthits |                              011 |                              100
2default:defaulth p
x
� 
�
%s
*synth2s
_             wrthitwdcnt |                              010 |                              101
2default:defaulth p
x
� 
�
%s
*synth2s
_              ldnxtwrtad |                              000 |                              110
2default:defaulth p
x
� 
�
%s
*synth2x
d---------------------------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
Gencoded FSM with state register '%s' using encoding '%s' in module '%s'3353*oasys2K
7Gen_Two_AFEs[0].Gen_Eight_Chans[3].Input_Seqs_reg[0][3]2default:default2

sequential2default:default2 
AFE_DataPath2default:defaultZ8-3354h px� 
�
%s
*synth2x
d---------------------------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s
*synth2t
`                   State |                     New Encoding |                Previous Encoding 
2default:defaulth p
x
� 
�
%s
*synth2x
d---------------------------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s
*synth2s
_                    idle |                              001 |                              000
2default:defaulth p
x
� 
�
%s
*synth2s
_               increment |                              110 |                              001
2default:defaulth p
x
� 
�
%s
*synth2s
_               wrtchanno |                              100 |                              010
2default:defaulth p
x
� 
�
%s
*synth2s
_            wrttimestamp |                              101 |                              011
2default:defaulth p
x
� 
�
%s
*synth2s
_                 wrthits |                              011 |                              100
2default:defaulth p
x
� 
�
%s
*synth2s
_             wrthitwdcnt |                              010 |                              101
2default:defaulth p
x
� 
�
%s
*synth2s
_              ldnxtwrtad |                              000 |                              110
2default:defaulth p
x
� 
�
%s
*synth2x
d---------------------------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
Gencoded FSM with state register '%s' using encoding '%s' in module '%s'3353*oasys2K
7Gen_Two_AFEs[0].Gen_Eight_Chans[4].Input_Seqs_reg[0][4]2default:default2

sequential2default:default2 
AFE_DataPath2default:defaultZ8-3354h px� 
�
%s
*synth2x
d---------------------------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s
*synth2t
`                   State |                     New Encoding |                Previous Encoding 
2default:defaulth p
x
� 
�
%s
*synth2x
d---------------------------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s
*synth2s
_                    idle |                              001 |                              000
2default:defaulth p
x
� 
�
%s
*synth2s
_               increment |                              110 |                              001
2default:defaulth p
x
� 
�
%s
*synth2s
_               wrtchanno |                              100 |                              010
2default:defaulth p
x
� 
�
%s
*synth2s
_            wrttimestamp |                              101 |                              011
2default:defaulth p
x
� 
�
%s
*synth2s
_                 wrthits |                              011 |                              100
2default:defaulth p
x
� 
�
%s
*synth2s
_             wrthitwdcnt |                              010 |                              101
2default:defaulth p
x
� 
�
%s
*synth2s
_              ldnxtwrtad |                              000 |                              110
2default:defaulth p
x
� 
�
%s
*synth2x
d---------------------------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
Gencoded FSM with state register '%s' using encoding '%s' in module '%s'3353*oasys2K
7Gen_Two_AFEs[0].Gen_Eight_Chans[5].Input_Seqs_reg[0][5]2default:default2

sequential2default:default2 
AFE_DataPath2default:defaultZ8-3354h px� 
�
%s
*synth2x
d---------------------------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s
*synth2t
`                   State |                     New Encoding |                Previous Encoding 
2default:defaulth p
x
� 
�
%s
*synth2x
d---------------------------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s
*synth2s
_                    idle |                              001 |                              000
2default:defaulth p
x
� 
�
%s
*synth2s
_               increment |                              110 |                              001
2default:defaulth p
x
� 
�
%s
*synth2s
_               wrtchanno |                              100 |                              010
2default:defaulth p
x
� 
�
%s
*synth2s
_            wrttimestamp |                              101 |                              011
2default:defaulth p
x
� 
�
%s
*synth2s
_                 wrthits |                              011 |                              100
2default:defaulth p
x
� 
�
%s
*synth2s
_             wrthitwdcnt |                              010 |                              101
2default:defaulth p
x
� 
�
%s
*synth2s
_              ldnxtwrtad |                              000 |                              110
2default:defaulth p
x
� 
�
%s
*synth2x
d---------------------------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
Gencoded FSM with state register '%s' using encoding '%s' in module '%s'3353*oasys2K
7Gen_Two_AFEs[0].Gen_Eight_Chans[6].Input_Seqs_reg[0][6]2default:default2

sequential2default:default2 
AFE_DataPath2default:defaultZ8-3354h px� 
�
%s
*synth2x
d---------------------------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s
*synth2t
`                   State |                     New Encoding |                Previous Encoding 
2default:defaulth p
x
� 
�
%s
*synth2x
d---------------------------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s
*synth2s
_                    idle |                              001 |                              000
2default:defaulth p
x
� 
�
%s
*synth2s
_               increment |                              110 |                              001
2default:defaulth p
x
� 
�
%s
*synth2s
_               wrtchanno |                              100 |                              010
2default:defaulth p
x
� 
�
%s
*synth2s
_            wrttimestamp |                              101 |                              011
2default:defaulth p
x
� 
�
%s
*synth2s
_                 wrthits |                              011 |                              100
2default:defaulth p
x
� 
�
%s
*synth2s
_             wrthitwdcnt |                              010 |                              101
2default:defaulth p
x
� 
�
%s
*synth2s
_              ldnxtwrtad |                              000 |                              110
2default:defaulth p
x
� 
�
%s
*synth2x
d---------------------------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
Gencoded FSM with state register '%s' using encoding '%s' in module '%s'3353*oasys2K
7Gen_Two_AFEs[0].Gen_Eight_Chans[7].Input_Seqs_reg[0][7]2default:default2

sequential2default:default2 
AFE_DataPath2default:defaultZ8-3354h px� 
�
%s
*synth2x
d---------------------------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s
*synth2t
`                   State |                     New Encoding |                Previous Encoding 
2default:defaulth p
x
� 
�
%s
*synth2x
d---------------------------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s
*synth2s
_                    idle |                              001 |                              000
2default:defaulth p
x
� 
�
%s
*synth2s
_               increment |                              110 |                              001
2default:defaulth p
x
� 
�
%s
*synth2s
_               wrtchanno |                              100 |                              010
2default:defaulth p
x
� 
�
%s
*synth2s
_            wrttimestamp |                              101 |                              011
2default:defaulth p
x
� 
�
%s
*synth2s
_                 wrthits |                              011 |                              100
2default:defaulth p
x
� 
�
%s
*synth2s
_             wrthitwdcnt |                              010 |                              101
2default:defaulth p
x
� 
�
%s
*synth2s
_              ldnxtwrtad |                              000 |                              110
2default:defaulth p
x
� 
�
%s
*synth2x
d---------------------------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
Gencoded FSM with state register '%s' using encoding '%s' in module '%s'3353*oasys2K
7Gen_Two_AFEs[1].Gen_Eight_Chans[0].Input_Seqs_reg[1][0]2default:default2

sequential2default:default2 
AFE_DataPath2default:defaultZ8-3354h px� 
�
%s
*synth2x
d---------------------------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s
*synth2t
`                   State |                     New Encoding |                Previous Encoding 
2default:defaulth p
x
� 
�
%s
*synth2x
d---------------------------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s
*synth2s
_                    idle |                              001 |                              000
2default:defaulth p
x
� 
�
%s
*synth2s
_               increment |                              110 |                              001
2default:defaulth p
x
� 
�
%s
*synth2s
_               wrtchanno |                              100 |                              010
2default:defaulth p
x
� 
�
%s
*synth2s
_            wrttimestamp |                              101 |                              011
2default:defaulth p
x
� 
�
%s
*synth2s
_                 wrthits |                              011 |                              100
2default:defaulth p
x
� 
�
%s
*synth2s
_             wrthitwdcnt |                              010 |                              101
2default:defaulth p
x
� 
�
%s
*synth2s
_              ldnxtwrtad |                              000 |                              110
2default:defaulth p
x
� 
�
%s
*synth2x
d---------------------------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
Gencoded FSM with state register '%s' using encoding '%s' in module '%s'3353*oasys2K
7Gen_Two_AFEs[1].Gen_Eight_Chans[1].Input_Seqs_reg[1][1]2default:default2

sequential2default:default2 
AFE_DataPath2default:defaultZ8-3354h px� 
�
%s
*synth2x
d---------------------------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s
*synth2t
`                   State |                     New Encoding |                Previous Encoding 
2default:defaulth p
x
� 
�
%s
*synth2x
d---------------------------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s
*synth2s
_                    idle |                              001 |                              000
2default:defaulth p
x
� 
�
%s
*synth2s
_               increment |                              110 |                              001
2default:defaulth p
x
� 
�
%s
*synth2s
_               wrtchanno |                              100 |                              010
2default:defaulth p
x
� 
�
%s
*synth2s
_            wrttimestamp |                              101 |                              011
2default:defaulth p
x
� 
�
%s
*synth2s
_                 wrthits |                              011 |                              100
2default:defaulth p
x
� 
�
%s
*synth2s
_             wrthitwdcnt |                              010 |                              101
2default:defaulth p
x
� 
�
%s
*synth2s
_              ldnxtwrtad |                              000 |                              110
2default:defaulth p
x
� 
�
%s
*synth2x
d---------------------------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
Gencoded FSM with state register '%s' using encoding '%s' in module '%s'3353*oasys2K
7Gen_Two_AFEs[1].Gen_Eight_Chans[2].Input_Seqs_reg[1][2]2default:default2

sequential2default:default2 
AFE_DataPath2default:defaultZ8-3354h px� 
�
%s
*synth2x
d---------------------------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s
*synth2t
`                   State |                     New Encoding |                Previous Encoding 
2default:defaulth p
x
� 
�
%s
*synth2x
d---------------------------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s
*synth2s
_                    idle |                              001 |                              000
2default:defaulth p
x
� 
�
%s
*synth2s
_               increment |                              110 |                              001
2default:defaulth p
x
� 
�
%s
*synth2s
_               wrtchanno |                              100 |                              010
2default:defaulth p
x
� 
�
%s
*synth2s
_            wrttimestamp |                              101 |                              011
2default:defaulth p
x
� 
�
%s
*synth2s
_                 wrthits |                              011 |                              100
2default:defaulth p
x
� 
�
%s
*synth2s
_             wrthitwdcnt |                              010 |                              101
2default:defaulth p
x
� 
�
%s
*synth2s
_              ldnxtwrtad |                              000 |                              110
2default:defaulth p
x
� 
�
%s
*synth2x
d---------------------------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
Gencoded FSM with state register '%s' using encoding '%s' in module '%s'3353*oasys2K
7Gen_Two_AFEs[1].Gen_Eight_Chans[3].Input_Seqs_reg[1][3]2default:default2

sequential2default:default2 
AFE_DataPath2default:defaultZ8-3354h px� 
�
%s
*synth2x
d---------------------------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s
*synth2t
`                   State |                     New Encoding |                Previous Encoding 
2default:defaulth p
x
� 
�
%s
*synth2x
d---------------------------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s
*synth2s
_                    idle |                              001 |                              000
2default:defaulth p
x
� 
�
%s
*synth2s
_               increment |                              110 |                              001
2default:defaulth p
x
� 
�
%s
*synth2s
_               wrtchanno |                              100 |                              010
2default:defaulth p
x
� 
�
%s
*synth2s
_            wrttimestamp |                              101 |                              011
2default:defaulth p
x
� 
�
%s
*synth2s
_                 wrthits |                              011 |                              100
2default:defaulth p
x
� 
�
%s
*synth2s
_             wrthitwdcnt |                              010 |                              101
2default:defaulth p
x
� 
�
%s
*synth2s
_              ldnxtwrtad |                              000 |                              110
2default:defaulth p
x
� 
�
%s
*synth2x
d---------------------------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
Gencoded FSM with state register '%s' using encoding '%s' in module '%s'3353*oasys2K
7Gen_Two_AFEs[1].Gen_Eight_Chans[4].Input_Seqs_reg[1][4]2default:default2

sequential2default:default2 
AFE_DataPath2default:defaultZ8-3354h px� 
�
%s
*synth2x
d---------------------------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s
*synth2t
`                   State |                     New Encoding |                Previous Encoding 
2default:defaulth p
x
� 
�
%s
*synth2x
d---------------------------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s
*synth2s
_                    idle |                              001 |                              000
2default:defaulth p
x
� 
�
%s
*synth2s
_               increment |                              110 |                              001
2default:defaulth p
x
� 
�
%s
*synth2s
_               wrtchanno |                              100 |                              010
2default:defaulth p
x
� 
�
%s
*synth2s
_            wrttimestamp |                              101 |                              011
2default:defaulth p
x
� 
�
%s
*synth2s
_                 wrthits |                              011 |                              100
2default:defaulth p
x
� 
�
%s
*synth2s
_             wrthitwdcnt |                              010 |                              101
2default:defaulth p
x
� 
�
%s
*synth2s
_              ldnxtwrtad |                              000 |                              110
2default:defaulth p
x
� 
�
%s
*synth2x
d---------------------------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
Gencoded FSM with state register '%s' using encoding '%s' in module '%s'3353*oasys2K
7Gen_Two_AFEs[1].Gen_Eight_Chans[5].Input_Seqs_reg[1][5]2default:default2

sequential2default:default2 
AFE_DataPath2default:defaultZ8-3354h px� 
�
%s
*synth2x
d---------------------------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s
*synth2t
`                   State |                     New Encoding |                Previous Encoding 
2default:defaulth p
x
� 
�
%s
*synth2x
d---------------------------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s
*synth2s
_                    idle |                              001 |                              000
2default:defaulth p
x
� 
�
%s
*synth2s
_               increment |                              110 |                              001
2default:defaulth p
x
� 
�
%s
*synth2s
_               wrtchanno |                              100 |                              010
2default:defaulth p
x
� 
�
%s
*synth2s
_            wrttimestamp |                              101 |                              011
2default:defaulth p
x
� 
�
%s
*synth2s
_                 wrthits |                              011 |                              100
2default:defaulth p
x
� 
�
%s
*synth2s
_             wrthitwdcnt |                              010 |                              101
2default:defaulth p
x
� 
�
%s
*synth2s
_              ldnxtwrtad |                              000 |                              110
2default:defaulth p
x
� 
�
%s
*synth2x
d---------------------------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
Gencoded FSM with state register '%s' using encoding '%s' in module '%s'3353*oasys2K
7Gen_Two_AFEs[1].Gen_Eight_Chans[6].Input_Seqs_reg[1][6]2default:default2

sequential2default:default2 
AFE_DataPath2default:defaultZ8-3354h px� 
�
%s
*synth2x
d---------------------------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s
*synth2t
`                   State |                     New Encoding |                Previous Encoding 
2default:defaulth p
x
� 
�
%s
*synth2x
d---------------------------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s
*synth2s
_                    idle |                              001 |                              000
2default:defaulth p
x
� 
�
%s
*synth2s
_               increment |                              110 |                              001
2default:defaulth p
x
� 
�
%s
*synth2s
_               wrtchanno |                              100 |                              010
2default:defaulth p
x
� 
�
%s
*synth2s
_            wrttimestamp |                              101 |                              011
2default:defaulth p
x
� 
�
%s
*synth2s
_                 wrthits |                              011 |                              100
2default:defaulth p
x
� 
�
%s
*synth2s
_             wrthitwdcnt |                              010 |                              101
2default:defaulth p
x
� 
�
%s
*synth2s
_              ldnxtwrtad |                              000 |                              110
2default:defaulth p
x
� 
�
%s
*synth2x
d---------------------------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
Gencoded FSM with state register '%s' using encoding '%s' in module '%s'3353*oasys2K
7Gen_Two_AFEs[1].Gen_Eight_Chans[7].Input_Seqs_reg[1][7]2default:default2

sequential2default:default2 
AFE_DataPath2default:defaultZ8-3354h px� 
�
%s
*synth2x
d---------------------------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s
*synth2t
`                   State |                     New Encoding |                Previous Encoding 
2default:defaulth p
x
� 
�
%s
*synth2x
d---------------------------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s
*synth2s
_                 iSTATE2 |                               00 |                               00
2default:defaulth p
x
� 
�
%s
*synth2s
_                  iSTATE |                               01 |                               01
2default:defaulth p
x
� 
�
%s
*synth2s
_                 iSTATE0 |                               10 |                               10
2default:defaulth p
x
� 
�
%s
*synth2s
_                 iSTATE1 |                               11 |                               11
2default:defaulth p
x
� 
�
%s
*synth2x
d---------------------------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
Gencoded FSM with state register '%s' using encoding '%s' in module '%s'3353*oasys2 
Rx_State_reg2default:default2

sequential2default:default2
FM_Rx2default:defaultZ8-3354h px� 
�
%s
*synth2x
d---------------------------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s
*synth2t
`                   State |                     New Encoding |                Previous Encoding 
2default:defaulth p
x
� 
�
%s
*synth2x
d---------------------------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s
*synth2s
_                   reset |                          0000001 |                              000
2default:defaulth p
x
� 
�
%s
*synth2s
_                    idle |                          0000010 |                              001
2default:defaulth p
x
� 
�
%s
*synth2s
_             waitreadyrd |                          0000100 |                              011
2default:defaulth p
x
� 
�
%s
*synth2s
_                  rddata |                          0001000 |                              110
2default:defaulth p
x
� 
�
%s
*synth2s
_               waitready |                          0010000 |                              010
2default:defaulth p
x
� 
�
%s
*synth2s
_             preparedata |                          0100000 |                              100
2default:defaulth p
x
� 
�
%s
*synth2s
_                 wrtdata |                          1000000 |                              101
2default:defaulth p
x
� 
�
%s
*synth2x
d---------------------------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
Gencoded FSM with state register '%s' using encoding '%s' in module '%s'3353*oasys2%
DDR_FSM_state_reg2default:default2
one-hot2default:default2
DDR_test2default:defaultZ8-3354h px� 
�
%s
*synth2x
d---------------------------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s
*synth2t
`                   State |                     New Encoding |                Previous Encoding 
2default:defaulth p
x
� 
�
%s
*synth2x
d---------------------------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s
*synth2s
_                    idle |                         00000001 |                             0000
2default:defaulth p
x
� 
�
%s
*synth2s
_               sendreset |                         10000000 |                             0001
2default:defaulth p
x
� 
�
%s
*synth2s
_                resetgap |                         01000000 |                             0010
2default:defaulth p
x
� 
�
%s
*synth2s
_            waitpresence |                         00100000 |                             0011
2default:defaulth p
x
� 
�
%s
*synth2s
_               sendwrite |                         00010000 |                             0100
2default:defaulth p
x
� 
�
%s
*synth2s
_                writegap |                         00001000 |                             0101
2default:defaulth p
x
� 
�
%s
*synth2s
_                sendread |                         00000100 |                             0110
2default:defaulth p
x
� 
�
%s
*synth2s
_                 readgap |                         00000010 |                             1000
2default:defaulth p
x
� 
�
%s
*synth2x
d---------------------------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
Gencoded FSM with state register '%s' using encoding '%s' in module '%s'3353*oasys2"
OneWireSeq_reg2default:default2
one-hot2default:default2
One_Wire2default:defaultZ8-3354h px� 
�
%s
*synth2x
d---------------------------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s
*synth2t
`                   State |                     New Encoding |                Previous Encoding 
2default:defaulth p
x
� 
�
%s
*synth2x
d---------------------------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s
*synth2s
_                 iSTATE3 |                              000 |                              000
2default:defaulth p
x
� 
�
%s
*synth2s
_                  iSTATE |                              001 |                              001
2default:defaulth p
x
� 
�
%s
*synth2s
_                 iSTATE1 |                              010 |                              010
2default:defaulth p
x
� 
�
%s
*synth2s
_                 iSTATE0 |                              011 |                              011
2default:defaulth p
x
� 
�
%s
*synth2s
_                 iSTATE2 |                              100 |                              100
2default:defaulth p
x
� 
�
%s
*synth2s
_                 iSTATE4 |                              101 |                              101
2default:defaulth p
x
� 
.
%s
*synth2
*
2default:defaulth p
x
� 
�
%s
*synth2x
d---------------------------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
Gencoded FSM with state register '%s' using encoding '%s' in module '%s'3353*oasys2!
TxBitWdth_reg2default:default2

sequential2default:default2
FM_Tx2default:defaultZ8-3354h px� 
�
%s
*synth2x
d---------------------------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s
*synth2t
`                   State |                     New Encoding |                Previous Encoding 
2default:defaulth p
x
� 
�
%s
*synth2x
d---------------------------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s
*synth2s
_                  txidle |                            00010 |                              000
2default:defaulth p
x
� 
�
%s
*synth2s
_                 txstrta |                            10000 |                              001
2default:defaulth p
x
� 
�
%s
*synth2s
_                 txstrtb |                            01000 |                              010
2default:defaulth p
x
� 
�
%s
*synth2s
_                  shfttx |                            00100 |                              011
2default:defaulth p
x
� 
�
%s
*synth2s
_                paritytx |                            00001 |                              100
2default:defaulth p
x
� 
�
%s
*synth2x
d---------------------------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
Gencoded FSM with state register '%s' using encoding '%s' in module '%s'3353*oasys2 
Tx_State_reg2default:default2
one-hot2default:default2
FM_Tx2default:defaultZ8-3354h px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
�Finished RTL Optimization Phase 2 : Time (s): cpu = 00:00:22 ; elapsed = 00:00:23 . Memory (MB): peak = 2743.402 ; gain = 706.742
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
L
%s
*synth24
 Start RTL Component Statistics 
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
K
%s
*synth23
Detailed RTL Component Info : 
2default:defaulth p
x
� 
:
%s
*synth2"
+---Adders : 
2default:defaulth p
x
� 
X
%s
*synth2@
,	   2 Input   64 Bit       Adders := 1     
2default:defaulth p
x
� 
X
%s
*synth2@
,	   2 Input   32 Bit       Adders := 2     
2default:defaulth p
x
� 
X
%s
*synth2@
,	   2 Input   29 Bit       Adders := 1     
2default:defaulth p
x
� 
X
%s
*synth2@
,	   3 Input   14 Bit       Adders := 16    
2default:defaulth p
x
� 
X
%s
*synth2@
,	   2 Input   12 Bit       Adders := 3     
2default:defaulth p
x
� 
X
%s
*synth2@
,	   2 Input   10 Bit       Adders := 32    
2default:defaulth p
x
� 
X
%s
*synth2@
,	   2 Input    9 Bit       Adders := 4     
2default:defaulth p
x
� 
X
%s
*synth2@
,	   2 Input    8 Bit       Adders := 9     
2default:defaulth p
x
� 
X
%s
*synth2@
,	   3 Input    7 Bit       Adders := 1     
2default:defaulth p
x
� 
X
%s
*synth2@
,	   2 Input    6 Bit       Adders := 4     
2default:defaulth p
x
� 
X
%s
*synth2@
,	   2 Input    5 Bit       Adders := 10    
2default:defaulth p
x
� 
X
%s
*synth2@
,	   2 Input    4 Bit       Adders := 19    
2default:defaulth p
x
� 
X
%s
*synth2@
,	   2 Input    3 Bit       Adders := 3     
2default:defaulth p
x
� 
8
%s
*synth2 
+---XORs : 
2default:defaulth p
x
� 
Z
%s
*synth2B
.	   2 Input      1 Bit         XORs := 3     
2default:defaulth p
x
� 
=
%s
*synth2%
+---Registers : 
2default:defaulth p
x
� 
Z
%s
*synth2B
.	               72 Bit    Registers := 1     
2default:defaulth p
x
� 
Z
%s
*synth2B
.	               64 Bit    Registers := 1     
2default:defaulth p
x
� 
Z
%s
*synth2B
.	               32 Bit    Registers := 7     
2default:defaulth p
x
� 
Z
%s
*synth2B
.	               29 Bit    Registers := 1     
2default:defaulth p
x
� 
Z
%s
*synth2B
.	               28 Bit    Registers := 1     
2default:defaulth p
x
� 
Z
%s
*synth2B
.	               24 Bit    Registers := 6     
2default:defaulth p
x
� 
Z
%s
*synth2B
.	               16 Bit    Registers := 18    
2default:defaulth p
x
� 
Z
%s
*synth2B
.	               14 Bit    Registers := 52    
2default:defaulth p
x
� 
Z
%s
*synth2B
.	               12 Bit    Registers := 8     
2default:defaulth p
x
� 
Z
%s
*synth2B
.	               10 Bit    Registers := 64    
2default:defaulth p
x
� 
Z
%s
*synth2B
.	                9 Bit    Registers := 6     
2default:defaulth p
x
� 
Z
%s
*synth2B
.	                8 Bit    Registers := 11    
2default:defaulth p
x
� 
Z
%s
*synth2B
.	                6 Bit    Registers := 2     
2default:defaulth p
x
� 
Z
%s
*synth2B
.	                5 Bit    Registers := 9     
2default:defaulth p
x
� 
Z
%s
*synth2B
.	                4 Bit    Registers := 39    
2default:defaulth p
x
� 
Z
%s
*synth2B
.	                3 Bit    Registers := 6     
2default:defaulth p
x
� 
Z
%s
*synth2B
.	                2 Bit    Registers := 31    
2default:defaulth p
x
� 
Z
%s
*synth2B
.	                1 Bit    Registers := 96    
2default:defaulth p
x
� 
9
%s
*synth2!
+---Muxes : 
2default:defaulth p
x
� 
X
%s
*synth2@
,	   7 Input   64 Bit        Muxes := 1     
2default:defaulth p
x
� 
X
%s
*synth2@
,	   2 Input   32 Bit        Muxes := 11    
2default:defaulth p
x
� 
X
%s
*synth2@
,	   7 Input   29 Bit        Muxes := 1     
2default:defaulth p
x
� 
X
%s
*synth2@
,	   4 Input   24 Bit        Muxes := 1     
2default:defaulth p
x
� 
X
%s
*synth2@
,	   2 Input   24 Bit        Muxes := 3     
2default:defaulth p
x
� 
X
%s
*synth2@
,	  16 Input   24 Bit        Muxes := 1     
2default:defaulth p
x
� 
X
%s
*synth2@
,	  16 Input   16 Bit        Muxes := 1     
2default:defaulth p
x
� 
X
%s
*synth2@
,	   2 Input   16 Bit        Muxes := 15    
2default:defaulth p
x
� 
X
%s
*synth2@
,	   6 Input   16 Bit        Muxes := 16    
2default:defaulth p
x
� 
X
%s
*synth2@
,	   2 Input   14 Bit        Muxes := 16    
2default:defaulth p
x
� 
X
%s
*synth2@
,	  13 Input   13 Bit        Muxes := 2     
2default:defaulth p
x
� 
X
%s
*synth2@
,	   2 Input   13 Bit        Muxes := 12    
2default:defaulth p
x
� 
X
%s
*synth2@
,	   2 Input   12 Bit        Muxes := 6     
2default:defaulth p
x
� 
X
%s
*synth2@
,	   5 Input   10 Bit        Muxes := 16    
2default:defaulth p
x
� 
X
%s
*synth2@
,	   2 Input   10 Bit        Muxes := 16    
2default:defaulth p
x
� 
X
%s
*synth2@
,	   2 Input    9 Bit        Muxes := 2     
2default:defaulth p
x
� 
X
%s
*synth2@
,	   8 Input    9 Bit        Muxes := 1     
2default:defaulth p
x
� 
X
%s
*synth2@
,	   2 Input    8 Bit        Muxes := 71    
2default:defaulth p
x
� 
X
%s
*synth2@
,	  13 Input    8 Bit        Muxes := 2     
2default:defaulth p
x
� 
X
%s
*synth2@
,	   8 Input    8 Bit        Muxes := 1     
2default:defaulth p
x
� 
X
%s
*synth2@
,	   3 Input    8 Bit        Muxes := 1     
2default:defaulth p
x
� 
X
%s
*synth2@
,	   7 Input    7 Bit        Muxes := 1     
2default:defaulth p
x
� 
X
%s
*synth2@
,	   2 Input    7 Bit        Muxes := 13    
2default:defaulth p
x
� 
X
%s
*synth2@
,	   2 Input    6 Bit        Muxes := 2     
2default:defaulth p
x
� 
X
%s
*synth2@
,	   2 Input    5 Bit        Muxes := 22    
2default:defaulth p
x
� 
X
%s
*synth2@
,	   5 Input    5 Bit        Muxes := 2     
2default:defaulth p
x
� 
X
%s
*synth2@
,	  13 Input    5 Bit        Muxes := 2     
2default:defaulth p
x
� 
X
%s
*synth2@
,	   2 Input    4 Bit        Muxes := 26    
2default:defaulth p
x
� 
X
%s
*synth2@
,	   4 Input    4 Bit        Muxes := 1     
2default:defaulth p
x
� 
X
%s
*synth2@
,	  16 Input    4 Bit        Muxes := 1     
2default:defaulth p
x
� 
X
%s
*synth2@
,	   8 Input    3 Bit        Muxes := 1     
2default:defaulth p
x
� 
X
%s
*synth2@
,	   4 Input    3 Bit        Muxes := 2     
2default:defaulth p
x
� 
X
%s
*synth2@
,	   7 Input    3 Bit        Muxes := 32    
2default:defaulth p
x
� 
X
%s
*synth2@
,	   2 Input    3 Bit        Muxes := 87    
2default:defaulth p
x
� 
X
%s
*synth2@
,	   6 Input    3 Bit        Muxes := 1     
2default:defaulth p
x
� 
X
%s
*synth2@
,	   4 Input    2 Bit        Muxes := 5     
2default:defaulth p
x
� 
X
%s
*synth2@
,	   2 Input    2 Bit        Muxes := 25    
2default:defaulth p
x
� 
X
%s
*synth2@
,	   3 Input    2 Bit        Muxes := 1     
2default:defaulth p
x
� 
X
%s
*synth2@
,	   2 Input    1 Bit        Muxes := 159   
2default:defaulth p
x
� 
X
%s
*synth2@
,	   5 Input    1 Bit        Muxes := 35    
2default:defaulth p
x
� 
X
%s
*synth2@
,	  13 Input    1 Bit        Muxes := 8     
2default:defaulth p
x
� 
X
%s
*synth2@
,	   4 Input    1 Bit        Muxes := 2     
2default:defaulth p
x
� 
X
%s
*synth2@
,	  16 Input    1 Bit        Muxes := 1     
2default:defaulth p
x
� 
X
%s
*synth2@
,	   7 Input    1 Bit        Muxes := 56    
2default:defaulth p
x
� 
X
%s
*synth2@
,	   3 Input    1 Bit        Muxes := 49    
2default:defaulth p
x
� 
X
%s
*synth2@
,	   6 Input    1 Bit        Muxes := 16    
2default:defaulth p
x
� 
X
%s
*synth2@
,	   8 Input    1 Bit        Muxes := 1     
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
O
%s
*synth27
#Finished RTL Component Statistics 
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
H
%s
*synth20
Start Part Resource Summary
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s
*synth2k
WPart Resources:
DSPs: 120 (col length:60)
BRAMs: 150 (col length: RAMB18 60 RAMB36 30)
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
K
%s
*synth23
Finished Part Resource Summary
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
W
%s
*synth2?
+Start Cross Boundary and Area Optimization
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
H
&Parallel synthesis criteria is not met4829*oasysZ8-7080h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys27
#DDR/FSM_onehot_DDR_FSM_state_reg[3]2default:default2
FEB2default:defaultZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys27
#DDR/FSM_onehot_DDR_FSM_state_reg[2]2default:default2
FEB2default:defaultZ8-3332h px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
�Finished Cross Boundary and Area Optimization : Time (s): cpu = 00:00:39 ; elapsed = 00:00:41 . Memory (MB): peak = 2743.402 ; gain = 706.742
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
R
%s
*synth2:
&Start Applying XDC Timing Constraints
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
�Finished Applying XDC Timing Constraints : Time (s): cpu = 00:00:44 ; elapsed = 00:00:46 . Memory (MB): peak = 2743.402 ; gain = 706.742
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
F
%s
*synth2.
Start Timing Optimization
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
}Finished Timing Optimization : Time (s): cpu = 00:00:50 ; elapsed = 00:00:52 . Memory (MB): peak = 2743.402 ; gain = 706.742
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
E
%s
*synth2-
Start Technology Mapping
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
aRemoving register instance (%s) from module (%s) as it is equivalent to (%s) and driving same net3897*oasys2_
K\AFE_Pipeline_inst/Gen_Two_AFEs[1].Gen_Eight_Chans[0].PipelineWrtEn_reg[1] 2default:default2 
AFE_DataPath2default:default2_
K\AFE_Pipeline_inst/Gen_Two_AFEs[1].Gen_Eight_Chans[7].PipelineWrtEn_reg[1] 2default:default2T
>C:/v23.1/FEB_test/FEB_test.srcs/sources_1/new/AFE_Pipeline.vhd2default:default2
482default:default8@Z8-4765h px� 
�
aRemoving register instance (%s) from module (%s) as it is equivalent to (%s) and driving same net3897*oasys2_
K\AFE_Pipeline_inst/Gen_Two_AFEs[1].Gen_Eight_Chans[1].PipelineWrtEn_reg[1] 2default:default2 
AFE_DataPath2default:default2_
K\AFE_Pipeline_inst/Gen_Two_AFEs[1].Gen_Eight_Chans[7].PipelineWrtEn_reg[1] 2default:default2T
>C:/v23.1/FEB_test/FEB_test.srcs/sources_1/new/AFE_Pipeline.vhd2default:default2
772default:default8@Z8-4765h px� 
�
aRemoving register instance (%s) from module (%s) as it is equivalent to (%s) and driving same net3897*oasys2_
K\AFE_Pipeline_inst/Gen_Two_AFEs[1].Gen_Eight_Chans[2].PipelineWrtEn_reg[1] 2default:default2 
AFE_DataPath2default:default2_
K\AFE_Pipeline_inst/Gen_Two_AFEs[1].Gen_Eight_Chans[7].PipelineWrtEn_reg[1] 2default:default2T
>C:/v23.1/FEB_test/FEB_test.srcs/sources_1/new/AFE_Pipeline.vhd2default:default2
772default:default8@Z8-4765h px� 
�
aRemoving register instance (%s) from module (%s) as it is equivalent to (%s) and driving same net3897*oasys2_
K\AFE_Pipeline_inst/Gen_Two_AFEs[1].Gen_Eight_Chans[3].PipelineWrtEn_reg[1] 2default:default2 
AFE_DataPath2default:default2_
K\AFE_Pipeline_inst/Gen_Two_AFEs[1].Gen_Eight_Chans[7].PipelineWrtEn_reg[1] 2default:default2T
>C:/v23.1/FEB_test/FEB_test.srcs/sources_1/new/AFE_Pipeline.vhd2default:default2
772default:default8@Z8-4765h px� 
�
aRemoving register instance (%s) from module (%s) as it is equivalent to (%s) and driving same net3897*oasys2_
K\AFE_Pipeline_inst/Gen_Two_AFEs[1].Gen_Eight_Chans[4].PipelineWrtEn_reg[1] 2default:default2 
AFE_DataPath2default:default2_
K\AFE_Pipeline_inst/Gen_Two_AFEs[1].Gen_Eight_Chans[7].PipelineWrtEn_reg[1] 2default:default2T
>C:/v23.1/FEB_test/FEB_test.srcs/sources_1/new/AFE_Pipeline.vhd2default:default2
772default:default8@Z8-4765h px� 
�
aRemoving register instance (%s) from module (%s) as it is equivalent to (%s) and driving same net3897*oasys2_
K\AFE_Pipeline_inst/Gen_Two_AFEs[1].Gen_Eight_Chans[5].PipelineWrtEn_reg[1] 2default:default2 
AFE_DataPath2default:default2_
K\AFE_Pipeline_inst/Gen_Two_AFEs[1].Gen_Eight_Chans[7].PipelineWrtEn_reg[1] 2default:default2T
>C:/v23.1/FEB_test/FEB_test.srcs/sources_1/new/AFE_Pipeline.vhd2default:default2
772default:default8@Z8-4765h px� 
�
aRemoving register instance (%s) from module (%s) as it is equivalent to (%s) and driving same net3897*oasys2_
K\AFE_Pipeline_inst/Gen_Two_AFEs[1].Gen_Eight_Chans[6].PipelineWrtEn_reg[1] 2default:default2 
AFE_DataPath2default:default2_
K\AFE_Pipeline_inst/Gen_Two_AFEs[1].Gen_Eight_Chans[7].PipelineWrtEn_reg[1] 2default:default2T
>C:/v23.1/FEB_test/FEB_test.srcs/sources_1/new/AFE_Pipeline.vhd2default:default2
772default:default8@Z8-4765h px� 
�
aRemoving register instance (%s) from module (%s) as it is equivalent to (%s) and driving same net3897*oasys2_
K\AFE_Pipeline_inst/Gen_Two_AFEs[0].Gen_Eight_Chans[0].PipelineWrtEn_reg[0] 2default:default2 
AFE_DataPath2default:default2_
K\AFE_Pipeline_inst/Gen_Two_AFEs[0].Gen_Eight_Chans[7].PipelineWrtEn_reg[0] 2default:default2T
>C:/v23.1/FEB_test/FEB_test.srcs/sources_1/new/AFE_Pipeline.vhd2default:default2
482default:default8@Z8-4765h px� 
�
aRemoving register instance (%s) from module (%s) as it is equivalent to (%s) and driving same net3897*oasys2_
K\AFE_Pipeline_inst/Gen_Two_AFEs[0].Gen_Eight_Chans[1].PipelineWrtEn_reg[0] 2default:default2 
AFE_DataPath2default:default2_
K\AFE_Pipeline_inst/Gen_Two_AFEs[0].Gen_Eight_Chans[7].PipelineWrtEn_reg[0] 2default:default2T
>C:/v23.1/FEB_test/FEB_test.srcs/sources_1/new/AFE_Pipeline.vhd2default:default2
772default:default8@Z8-4765h px� 
�
aRemoving register instance (%s) from module (%s) as it is equivalent to (%s) and driving same net3897*oasys2_
K\AFE_Pipeline_inst/Gen_Two_AFEs[0].Gen_Eight_Chans[2].PipelineWrtEn_reg[0] 2default:default2 
AFE_DataPath2default:default2_
K\AFE_Pipeline_inst/Gen_Two_AFEs[0].Gen_Eight_Chans[7].PipelineWrtEn_reg[0] 2default:default2T
>C:/v23.1/FEB_test/FEB_test.srcs/sources_1/new/AFE_Pipeline.vhd2default:default2
772default:default8@Z8-4765h px� 
�
aRemoving register instance (%s) from module (%s) as it is equivalent to (%s) and driving same net3897*oasys2_
K\AFE_Pipeline_inst/Gen_Two_AFEs[0].Gen_Eight_Chans[3].PipelineWrtEn_reg[0] 2default:default2 
AFE_DataPath2default:default2_
K\AFE_Pipeline_inst/Gen_Two_AFEs[0].Gen_Eight_Chans[7].PipelineWrtEn_reg[0] 2default:default2T
>C:/v23.1/FEB_test/FEB_test.srcs/sources_1/new/AFE_Pipeline.vhd2default:default2
772default:default8@Z8-4765h px� 
�
aRemoving register instance (%s) from module (%s) as it is equivalent to (%s) and driving same net3897*oasys2_
K\AFE_Pipeline_inst/Gen_Two_AFEs[0].Gen_Eight_Chans[4].PipelineWrtEn_reg[0] 2default:default2 
AFE_DataPath2default:default2_
K\AFE_Pipeline_inst/Gen_Two_AFEs[0].Gen_Eight_Chans[7].PipelineWrtEn_reg[0] 2default:default2T
>C:/v23.1/FEB_test/FEB_test.srcs/sources_1/new/AFE_Pipeline.vhd2default:default2
772default:default8@Z8-4765h px� 
�
aRemoving register instance (%s) from module (%s) as it is equivalent to (%s) and driving same net3897*oasys2_
K\AFE_Pipeline_inst/Gen_Two_AFEs[0].Gen_Eight_Chans[5].PipelineWrtEn_reg[0] 2default:default2 
AFE_DataPath2default:default2_
K\AFE_Pipeline_inst/Gen_Two_AFEs[0].Gen_Eight_Chans[7].PipelineWrtEn_reg[0] 2default:default2T
>C:/v23.1/FEB_test/FEB_test.srcs/sources_1/new/AFE_Pipeline.vhd2default:default2
772default:default8@Z8-4765h px� 
�
aRemoving register instance (%s) from module (%s) as it is equivalent to (%s) and driving same net3897*oasys2_
K\AFE_Pipeline_inst/Gen_Two_AFEs[0].Gen_Eight_Chans[6].PipelineWrtEn_reg[0] 2default:default2 
AFE_DataPath2default:default2_
K\AFE_Pipeline_inst/Gen_Two_AFEs[0].Gen_Eight_Chans[7].PipelineWrtEn_reg[0] 2default:default2T
>C:/v23.1/FEB_test/FEB_test.srcs/sources_1/new/AFE_Pipeline.vhd2default:default2
772default:default8@Z8-4765h px� 
�
aRemoving register instance (%s) from module (%s) as it is equivalent to (%s) and driving same net3897*oasys2c
O\AFE_Pipeline_inst/Gen_Two_AFEs[0].Gen_Eight_Chans[0].PipelineWrtAdd_reg[0][7] 2default:default2 
AFE_DataPath2default:default2c
O\AFE_Pipeline_inst/Gen_Two_AFEs[0].Gen_Eight_Chans[7].PipelineWrtAdd_reg[0][7] 2default:default2T
>C:/v23.1/FEB_test/FEB_test.srcs/sources_1/new/AFE_Pipeline.vhd2default:default2
492default:default8@Z8-4765h px� 
�
aRemoving register instance (%s) from module (%s) as it is equivalent to (%s) and driving same net3897*oasys2c
O\AFE_Pipeline_inst/Gen_Two_AFEs[0].Gen_Eight_Chans[1].PipelineWrtAdd_reg[0][7] 2default:default2 
AFE_DataPath2default:default2c
O\AFE_Pipeline_inst/Gen_Two_AFEs[0].Gen_Eight_Chans[7].PipelineWrtAdd_reg[0][7] 2default:default2T
>C:/v23.1/FEB_test/FEB_test.srcs/sources_1/new/AFE_Pipeline.vhd2default:default2
782default:default8@Z8-4765h px� 
�
aRemoving register instance (%s) from module (%s) as it is equivalent to (%s) and driving same net3897*oasys2c
O\AFE_Pipeline_inst/Gen_Two_AFEs[0].Gen_Eight_Chans[2].PipelineWrtAdd_reg[0][7] 2default:default2 
AFE_DataPath2default:default2c
O\AFE_Pipeline_inst/Gen_Two_AFEs[0].Gen_Eight_Chans[7].PipelineWrtAdd_reg[0][7] 2default:default2T
>C:/v23.1/FEB_test/FEB_test.srcs/sources_1/new/AFE_Pipeline.vhd2default:default2
782default:default8@Z8-4765h px� 
�
aRemoving register instance (%s) from module (%s) as it is equivalent to (%s) and driving same net3897*oasys2c
O\AFE_Pipeline_inst/Gen_Two_AFEs[0].Gen_Eight_Chans[3].PipelineWrtAdd_reg[0][7] 2default:default2 
AFE_DataPath2default:default2c
O\AFE_Pipeline_inst/Gen_Two_AFEs[0].Gen_Eight_Chans[7].PipelineWrtAdd_reg[0][7] 2default:default2T
>C:/v23.1/FEB_test/FEB_test.srcs/sources_1/new/AFE_Pipeline.vhd2default:default2
782default:default8@Z8-4765h px� 
�
aRemoving register instance (%s) from module (%s) as it is equivalent to (%s) and driving same net3897*oasys2c
O\AFE_Pipeline_inst/Gen_Two_AFEs[0].Gen_Eight_Chans[4].PipelineWrtAdd_reg[0][7] 2default:default2 
AFE_DataPath2default:default2c
O\AFE_Pipeline_inst/Gen_Two_AFEs[0].Gen_Eight_Chans[7].PipelineWrtAdd_reg[0][7] 2default:default2T
>C:/v23.1/FEB_test/FEB_test.srcs/sources_1/new/AFE_Pipeline.vhd2default:default2
782default:default8@Z8-4765h px� 
�
aRemoving register instance (%s) from module (%s) as it is equivalent to (%s) and driving same net3897*oasys2c
O\AFE_Pipeline_inst/Gen_Two_AFEs[0].Gen_Eight_Chans[5].PipelineWrtAdd_reg[0][7] 2default:default2 
AFE_DataPath2default:default2c
O\AFE_Pipeline_inst/Gen_Two_AFEs[0].Gen_Eight_Chans[7].PipelineWrtAdd_reg[0][7] 2default:default2T
>C:/v23.1/FEB_test/FEB_test.srcs/sources_1/new/AFE_Pipeline.vhd2default:default2
782default:default8@Z8-4765h px� 
�
aRemoving register instance (%s) from module (%s) as it is equivalent to (%s) and driving same net3897*oasys2c
O\AFE_Pipeline_inst/Gen_Two_AFEs[0].Gen_Eight_Chans[6].PipelineWrtAdd_reg[0][7] 2default:default2 
AFE_DataPath2default:default2c
O\AFE_Pipeline_inst/Gen_Two_AFEs[0].Gen_Eight_Chans[7].PipelineWrtAdd_reg[0][7] 2default:default2T
>C:/v23.1/FEB_test/FEB_test.srcs/sources_1/new/AFE_Pipeline.vhd2default:default2
782default:default8@Z8-4765h px� 
�
aRemoving register instance (%s) from module (%s) as it is equivalent to (%s) and driving same net3897*oasys2c
O\AFE_Pipeline_inst/Gen_Two_AFEs[0].Gen_Eight_Chans[0].PipelineWrtAdd_reg[0][6] 2default:default2 
AFE_DataPath2default:default2c
O\AFE_Pipeline_inst/Gen_Two_AFEs[0].Gen_Eight_Chans[7].PipelineWrtAdd_reg[0][6] 2default:default2T
>C:/v23.1/FEB_test/FEB_test.srcs/sources_1/new/AFE_Pipeline.vhd2default:default2
492default:default8@Z8-4765h px� 
�
aRemoving register instance (%s) from module (%s) as it is equivalent to (%s) and driving same net3897*oasys2c
O\AFE_Pipeline_inst/Gen_Two_AFEs[0].Gen_Eight_Chans[1].PipelineWrtAdd_reg[0][6] 2default:default2 
AFE_DataPath2default:default2c
O\AFE_Pipeline_inst/Gen_Two_AFEs[0].Gen_Eight_Chans[7].PipelineWrtAdd_reg[0][6] 2default:default2T
>C:/v23.1/FEB_test/FEB_test.srcs/sources_1/new/AFE_Pipeline.vhd2default:default2
782default:default8@Z8-4765h px� 
�
aRemoving register instance (%s) from module (%s) as it is equivalent to (%s) and driving same net3897*oasys2c
O\AFE_Pipeline_inst/Gen_Two_AFEs[0].Gen_Eight_Chans[2].PipelineWrtAdd_reg[0][6] 2default:default2 
AFE_DataPath2default:default2c
O\AFE_Pipeline_inst/Gen_Two_AFEs[0].Gen_Eight_Chans[7].PipelineWrtAdd_reg[0][6] 2default:default2T
>C:/v23.1/FEB_test/FEB_test.srcs/sources_1/new/AFE_Pipeline.vhd2default:default2
782default:default8@Z8-4765h px� 
�
aRemoving register instance (%s) from module (%s) as it is equivalent to (%s) and driving same net3897*oasys2c
O\AFE_Pipeline_inst/Gen_Two_AFEs[0].Gen_Eight_Chans[3].PipelineWrtAdd_reg[0][6] 2default:default2 
AFE_DataPath2default:default2c
O\AFE_Pipeline_inst/Gen_Two_AFEs[0].Gen_Eight_Chans[7].PipelineWrtAdd_reg[0][6] 2default:default2T
>C:/v23.1/FEB_test/FEB_test.srcs/sources_1/new/AFE_Pipeline.vhd2default:default2
782default:default8@Z8-4765h px� 
�
aRemoving register instance (%s) from module (%s) as it is equivalent to (%s) and driving same net3897*oasys2c
O\AFE_Pipeline_inst/Gen_Two_AFEs[0].Gen_Eight_Chans[4].PipelineWrtAdd_reg[0][6] 2default:default2 
AFE_DataPath2default:default2c
O\AFE_Pipeline_inst/Gen_Two_AFEs[0].Gen_Eight_Chans[7].PipelineWrtAdd_reg[0][6] 2default:default2T
>C:/v23.1/FEB_test/FEB_test.srcs/sources_1/new/AFE_Pipeline.vhd2default:default2
782default:default8@Z8-4765h px� 
�
aRemoving register instance (%s) from module (%s) as it is equivalent to (%s) and driving same net3897*oasys2c
O\AFE_Pipeline_inst/Gen_Two_AFEs[0].Gen_Eight_Chans[5].PipelineWrtAdd_reg[0][6] 2default:default2 
AFE_DataPath2default:default2c
O\AFE_Pipeline_inst/Gen_Two_AFEs[0].Gen_Eight_Chans[7].PipelineWrtAdd_reg[0][6] 2default:default2T
>C:/v23.1/FEB_test/FEB_test.srcs/sources_1/new/AFE_Pipeline.vhd2default:default2
782default:default8@Z8-4765h px� 
�
aRemoving register instance (%s) from module (%s) as it is equivalent to (%s) and driving same net3897*oasys2c
O\AFE_Pipeline_inst/Gen_Two_AFEs[0].Gen_Eight_Chans[6].PipelineWrtAdd_reg[0][6] 2default:default2 
AFE_DataPath2default:default2c
O\AFE_Pipeline_inst/Gen_Two_AFEs[0].Gen_Eight_Chans[7].PipelineWrtAdd_reg[0][6] 2default:default2T
>C:/v23.1/FEB_test/FEB_test.srcs/sources_1/new/AFE_Pipeline.vhd2default:default2
782default:default8@Z8-4765h px� 
�
aRemoving register instance (%s) from module (%s) as it is equivalent to (%s) and driving same net3897*oasys2c
O\AFE_Pipeline_inst/Gen_Two_AFEs[0].Gen_Eight_Chans[0].PipelineWrtAdd_reg[0][5] 2default:default2 
AFE_DataPath2default:default2c
O\AFE_Pipeline_inst/Gen_Two_AFEs[0].Gen_Eight_Chans[7].PipelineWrtAdd_reg[0][5] 2default:default2T
>C:/v23.1/FEB_test/FEB_test.srcs/sources_1/new/AFE_Pipeline.vhd2default:default2
492default:default8@Z8-4765h px� 
�
aRemoving register instance (%s) from module (%s) as it is equivalent to (%s) and driving same net3897*oasys2c
O\AFE_Pipeline_inst/Gen_Two_AFEs[0].Gen_Eight_Chans[1].PipelineWrtAdd_reg[0][5] 2default:default2 
AFE_DataPath2default:default2c
O\AFE_Pipeline_inst/Gen_Two_AFEs[0].Gen_Eight_Chans[7].PipelineWrtAdd_reg[0][5] 2default:default2T
>C:/v23.1/FEB_test/FEB_test.srcs/sources_1/new/AFE_Pipeline.vhd2default:default2
782default:default8@Z8-4765h px� 
�
aRemoving register instance (%s) from module (%s) as it is equivalent to (%s) and driving same net3897*oasys2c
O\AFE_Pipeline_inst/Gen_Two_AFEs[0].Gen_Eight_Chans[2].PipelineWrtAdd_reg[0][5] 2default:default2 
AFE_DataPath2default:default2c
O\AFE_Pipeline_inst/Gen_Two_AFEs[0].Gen_Eight_Chans[7].PipelineWrtAdd_reg[0][5] 2default:default2T
>C:/v23.1/FEB_test/FEB_test.srcs/sources_1/new/AFE_Pipeline.vhd2default:default2
782default:default8@Z8-4765h px� 
�
aRemoving register instance (%s) from module (%s) as it is equivalent to (%s) and driving same net3897*oasys2c
O\AFE_Pipeline_inst/Gen_Two_AFEs[0].Gen_Eight_Chans[3].PipelineWrtAdd_reg[0][5] 2default:default2 
AFE_DataPath2default:default2c
O\AFE_Pipeline_inst/Gen_Two_AFEs[0].Gen_Eight_Chans[7].PipelineWrtAdd_reg[0][5] 2default:default2T
>C:/v23.1/FEB_test/FEB_test.srcs/sources_1/new/AFE_Pipeline.vhd2default:default2
782default:default8@Z8-4765h px� 
�
aRemoving register instance (%s) from module (%s) as it is equivalent to (%s) and driving same net3897*oasys2c
O\AFE_Pipeline_inst/Gen_Two_AFEs[0].Gen_Eight_Chans[4].PipelineWrtAdd_reg[0][5] 2default:default2 
AFE_DataPath2default:default2c
O\AFE_Pipeline_inst/Gen_Two_AFEs[0].Gen_Eight_Chans[7].PipelineWrtAdd_reg[0][5] 2default:default2T
>C:/v23.1/FEB_test/FEB_test.srcs/sources_1/new/AFE_Pipeline.vhd2default:default2
782default:default8@Z8-4765h px� 
�
aRemoving register instance (%s) from module (%s) as it is equivalent to (%s) and driving same net3897*oasys2c
O\AFE_Pipeline_inst/Gen_Two_AFEs[0].Gen_Eight_Chans[5].PipelineWrtAdd_reg[0][5] 2default:default2 
AFE_DataPath2default:default2c
O\AFE_Pipeline_inst/Gen_Two_AFEs[0].Gen_Eight_Chans[7].PipelineWrtAdd_reg[0][5] 2default:default2T
>C:/v23.1/FEB_test/FEB_test.srcs/sources_1/new/AFE_Pipeline.vhd2default:default2
782default:default8@Z8-4765h px� 
�
aRemoving register instance (%s) from module (%s) as it is equivalent to (%s) and driving same net3897*oasys2c
O\AFE_Pipeline_inst/Gen_Two_AFEs[0].Gen_Eight_Chans[6].PipelineWrtAdd_reg[0][5] 2default:default2 
AFE_DataPath2default:default2c
O\AFE_Pipeline_inst/Gen_Two_AFEs[0].Gen_Eight_Chans[7].PipelineWrtAdd_reg[0][5] 2default:default2T
>C:/v23.1/FEB_test/FEB_test.srcs/sources_1/new/AFE_Pipeline.vhd2default:default2
782default:default8@Z8-4765h px� 
�
aRemoving register instance (%s) from module (%s) as it is equivalent to (%s) and driving same net3897*oasys2c
O\AFE_Pipeline_inst/Gen_Two_AFEs[0].Gen_Eight_Chans[0].PipelineWrtAdd_reg[0][4] 2default:default2 
AFE_DataPath2default:default2c
O\AFE_Pipeline_inst/Gen_Two_AFEs[0].Gen_Eight_Chans[7].PipelineWrtAdd_reg[0][4] 2default:default2T
>C:/v23.1/FEB_test/FEB_test.srcs/sources_1/new/AFE_Pipeline.vhd2default:default2
492default:default8@Z8-4765h px� 
�
aRemoving register instance (%s) from module (%s) as it is equivalent to (%s) and driving same net3897*oasys2c
O\AFE_Pipeline_inst/Gen_Two_AFEs[0].Gen_Eight_Chans[1].PipelineWrtAdd_reg[0][4] 2default:default2 
AFE_DataPath2default:default2c
O\AFE_Pipeline_inst/Gen_Two_AFEs[0].Gen_Eight_Chans[7].PipelineWrtAdd_reg[0][4] 2default:default2T
>C:/v23.1/FEB_test/FEB_test.srcs/sources_1/new/AFE_Pipeline.vhd2default:default2
782default:default8@Z8-4765h px� 
�
aRemoving register instance (%s) from module (%s) as it is equivalent to (%s) and driving same net3897*oasys2c
O\AFE_Pipeline_inst/Gen_Two_AFEs[0].Gen_Eight_Chans[2].PipelineWrtAdd_reg[0][4] 2default:default2 
AFE_DataPath2default:default2c
O\AFE_Pipeline_inst/Gen_Two_AFEs[0].Gen_Eight_Chans[7].PipelineWrtAdd_reg[0][4] 2default:default2T
>C:/v23.1/FEB_test/FEB_test.srcs/sources_1/new/AFE_Pipeline.vhd2default:default2
782default:default8@Z8-4765h px� 
�
aRemoving register instance (%s) from module (%s) as it is equivalent to (%s) and driving same net3897*oasys2c
O\AFE_Pipeline_inst/Gen_Two_AFEs[0].Gen_Eight_Chans[3].PipelineWrtAdd_reg[0][4] 2default:default2 
AFE_DataPath2default:default2c
O\AFE_Pipeline_inst/Gen_Two_AFEs[0].Gen_Eight_Chans[7].PipelineWrtAdd_reg[0][4] 2default:default2T
>C:/v23.1/FEB_test/FEB_test.srcs/sources_1/new/AFE_Pipeline.vhd2default:default2
782default:default8@Z8-4765h px� 
�
aRemoving register instance (%s) from module (%s) as it is equivalent to (%s) and driving same net3897*oasys2c
O\AFE_Pipeline_inst/Gen_Two_AFEs[0].Gen_Eight_Chans[4].PipelineWrtAdd_reg[0][4] 2default:default2 
AFE_DataPath2default:default2c
O\AFE_Pipeline_inst/Gen_Two_AFEs[0].Gen_Eight_Chans[7].PipelineWrtAdd_reg[0][4] 2default:default2T
>C:/v23.1/FEB_test/FEB_test.srcs/sources_1/new/AFE_Pipeline.vhd2default:default2
782default:default8@Z8-4765h px� 
�
aRemoving register instance (%s) from module (%s) as it is equivalent to (%s) and driving same net3897*oasys2c
O\AFE_Pipeline_inst/Gen_Two_AFEs[0].Gen_Eight_Chans[5].PipelineWrtAdd_reg[0][4] 2default:default2 
AFE_DataPath2default:default2c
O\AFE_Pipeline_inst/Gen_Two_AFEs[0].Gen_Eight_Chans[7].PipelineWrtAdd_reg[0][4] 2default:default2T
>C:/v23.1/FEB_test/FEB_test.srcs/sources_1/new/AFE_Pipeline.vhd2default:default2
782default:default8@Z8-4765h px� 
�
aRemoving register instance (%s) from module (%s) as it is equivalent to (%s) and driving same net3897*oasys2c
O\AFE_Pipeline_inst/Gen_Two_AFEs[0].Gen_Eight_Chans[6].PipelineWrtAdd_reg[0][4] 2default:default2 
AFE_DataPath2default:default2c
O\AFE_Pipeline_inst/Gen_Two_AFEs[0].Gen_Eight_Chans[7].PipelineWrtAdd_reg[0][4] 2default:default2T
>C:/v23.1/FEB_test/FEB_test.srcs/sources_1/new/AFE_Pipeline.vhd2default:default2
782default:default8@Z8-4765h px� 
�
aRemoving register instance (%s) from module (%s) as it is equivalent to (%s) and driving same net3897*oasys2c
O\AFE_Pipeline_inst/Gen_Two_AFEs[0].Gen_Eight_Chans[0].PipelineWrtAdd_reg[0][3] 2default:default2 
AFE_DataPath2default:default2c
O\AFE_Pipeline_inst/Gen_Two_AFEs[0].Gen_Eight_Chans[7].PipelineWrtAdd_reg[0][3] 2default:default2T
>C:/v23.1/FEB_test/FEB_test.srcs/sources_1/new/AFE_Pipeline.vhd2default:default2
492default:default8@Z8-4765h px� 
�
aRemoving register instance (%s) from module (%s) as it is equivalent to (%s) and driving same net3897*oasys2c
O\AFE_Pipeline_inst/Gen_Two_AFEs[0].Gen_Eight_Chans[1].PipelineWrtAdd_reg[0][3] 2default:default2 
AFE_DataPath2default:default2c
O\AFE_Pipeline_inst/Gen_Two_AFEs[0].Gen_Eight_Chans[7].PipelineWrtAdd_reg[0][3] 2default:default2T
>C:/v23.1/FEB_test/FEB_test.srcs/sources_1/new/AFE_Pipeline.vhd2default:default2
782default:default8@Z8-4765h px� 
�
aRemoving register instance (%s) from module (%s) as it is equivalent to (%s) and driving same net3897*oasys2c
O\AFE_Pipeline_inst/Gen_Two_AFEs[0].Gen_Eight_Chans[2].PipelineWrtAdd_reg[0][3] 2default:default2 
AFE_DataPath2default:default2c
O\AFE_Pipeline_inst/Gen_Two_AFEs[0].Gen_Eight_Chans[7].PipelineWrtAdd_reg[0][3] 2default:default2T
>C:/v23.1/FEB_test/FEB_test.srcs/sources_1/new/AFE_Pipeline.vhd2default:default2
782default:default8@Z8-4765h px� 
�
aRemoving register instance (%s) from module (%s) as it is equivalent to (%s) and driving same net3897*oasys2c
O\AFE_Pipeline_inst/Gen_Two_AFEs[0].Gen_Eight_Chans[3].PipelineWrtAdd_reg[0][3] 2default:default2 
AFE_DataPath2default:default2c
O\AFE_Pipeline_inst/Gen_Two_AFEs[0].Gen_Eight_Chans[7].PipelineWrtAdd_reg[0][3] 2default:default2T
>C:/v23.1/FEB_test/FEB_test.srcs/sources_1/new/AFE_Pipeline.vhd2default:default2
782default:default8@Z8-4765h px� 
�
aRemoving register instance (%s) from module (%s) as it is equivalent to (%s) and driving same net3897*oasys2c
O\AFE_Pipeline_inst/Gen_Two_AFEs[0].Gen_Eight_Chans[4].PipelineWrtAdd_reg[0][3] 2default:default2 
AFE_DataPath2default:default2c
O\AFE_Pipeline_inst/Gen_Two_AFEs[0].Gen_Eight_Chans[7].PipelineWrtAdd_reg[0][3] 2default:default2T
>C:/v23.1/FEB_test/FEB_test.srcs/sources_1/new/AFE_Pipeline.vhd2default:default2
782default:default8@Z8-4765h px� 
�
aRemoving register instance (%s) from module (%s) as it is equivalent to (%s) and driving same net3897*oasys2c
O\AFE_Pipeline_inst/Gen_Two_AFEs[0].Gen_Eight_Chans[5].PipelineWrtAdd_reg[0][3] 2default:default2 
AFE_DataPath2default:default2c
O\AFE_Pipeline_inst/Gen_Two_AFEs[0].Gen_Eight_Chans[7].PipelineWrtAdd_reg[0][3] 2default:default2T
>C:/v23.1/FEB_test/FEB_test.srcs/sources_1/new/AFE_Pipeline.vhd2default:default2
782default:default8@Z8-4765h px� 
�
aRemoving register instance (%s) from module (%s) as it is equivalent to (%s) and driving same net3897*oasys2c
O\AFE_Pipeline_inst/Gen_Two_AFEs[0].Gen_Eight_Chans[6].PipelineWrtAdd_reg[0][3] 2default:default2 
AFE_DataPath2default:default2c
O\AFE_Pipeline_inst/Gen_Two_AFEs[0].Gen_Eight_Chans[7].PipelineWrtAdd_reg[0][3] 2default:default2T
>C:/v23.1/FEB_test/FEB_test.srcs/sources_1/new/AFE_Pipeline.vhd2default:default2
782default:default8@Z8-4765h px� 
�
aRemoving register instance (%s) from module (%s) as it is equivalent to (%s) and driving same net3897*oasys2c
O\AFE_Pipeline_inst/Gen_Two_AFEs[0].Gen_Eight_Chans[0].PipelineWrtAdd_reg[0][2] 2default:default2 
AFE_DataPath2default:default2c
O\AFE_Pipeline_inst/Gen_Two_AFEs[0].Gen_Eight_Chans[7].PipelineWrtAdd_reg[0][2] 2default:default2T
>C:/v23.1/FEB_test/FEB_test.srcs/sources_1/new/AFE_Pipeline.vhd2default:default2
492default:default8@Z8-4765h px� 
�
aRemoving register instance (%s) from module (%s) as it is equivalent to (%s) and driving same net3897*oasys2c
O\AFE_Pipeline_inst/Gen_Two_AFEs[0].Gen_Eight_Chans[1].PipelineWrtAdd_reg[0][2] 2default:default2 
AFE_DataPath2default:default2c
O\AFE_Pipeline_inst/Gen_Two_AFEs[0].Gen_Eight_Chans[7].PipelineWrtAdd_reg[0][2] 2default:default2T
>C:/v23.1/FEB_test/FEB_test.srcs/sources_1/new/AFE_Pipeline.vhd2default:default2
782default:default8@Z8-4765h px� 
�
aRemoving register instance (%s) from module (%s) as it is equivalent to (%s) and driving same net3897*oasys2c
O\AFE_Pipeline_inst/Gen_Two_AFEs[0].Gen_Eight_Chans[2].PipelineWrtAdd_reg[0][2] 2default:default2 
AFE_DataPath2default:default2c
O\AFE_Pipeline_inst/Gen_Two_AFEs[0].Gen_Eight_Chans[7].PipelineWrtAdd_reg[0][2] 2default:default2T
>C:/v23.1/FEB_test/FEB_test.srcs/sources_1/new/AFE_Pipeline.vhd2default:default2
782default:default8@Z8-4765h px� 
�
aRemoving register instance (%s) from module (%s) as it is equivalent to (%s) and driving same net3897*oasys2c
O\AFE_Pipeline_inst/Gen_Two_AFEs[0].Gen_Eight_Chans[3].PipelineWrtAdd_reg[0][2] 2default:default2 
AFE_DataPath2default:default2c
O\AFE_Pipeline_inst/Gen_Two_AFEs[0].Gen_Eight_Chans[7].PipelineWrtAdd_reg[0][2] 2default:default2T
>C:/v23.1/FEB_test/FEB_test.srcs/sources_1/new/AFE_Pipeline.vhd2default:default2
782default:default8@Z8-4765h px� 
�
aRemoving register instance (%s) from module (%s) as it is equivalent to (%s) and driving same net3897*oasys2c
O\AFE_Pipeline_inst/Gen_Two_AFEs[0].Gen_Eight_Chans[4].PipelineWrtAdd_reg[0][2] 2default:default2 
AFE_DataPath2default:default2c
O\AFE_Pipeline_inst/Gen_Two_AFEs[0].Gen_Eight_Chans[7].PipelineWrtAdd_reg[0][2] 2default:default2T
>C:/v23.1/FEB_test/FEB_test.srcs/sources_1/new/AFE_Pipeline.vhd2default:default2
782default:default8@Z8-4765h px� 
�
aRemoving register instance (%s) from module (%s) as it is equivalent to (%s) and driving same net3897*oasys2c
O\AFE_Pipeline_inst/Gen_Two_AFEs[0].Gen_Eight_Chans[5].PipelineWrtAdd_reg[0][2] 2default:default2 
AFE_DataPath2default:default2c
O\AFE_Pipeline_inst/Gen_Two_AFEs[0].Gen_Eight_Chans[7].PipelineWrtAdd_reg[0][2] 2default:default2T
>C:/v23.1/FEB_test/FEB_test.srcs/sources_1/new/AFE_Pipeline.vhd2default:default2
782default:default8@Z8-4765h px� 
�
aRemoving register instance (%s) from module (%s) as it is equivalent to (%s) and driving same net3897*oasys2c
O\AFE_Pipeline_inst/Gen_Two_AFEs[0].Gen_Eight_Chans[6].PipelineWrtAdd_reg[0][2] 2default:default2 
AFE_DataPath2default:default2c
O\AFE_Pipeline_inst/Gen_Two_AFEs[0].Gen_Eight_Chans[7].PipelineWrtAdd_reg[0][2] 2default:default2T
>C:/v23.1/FEB_test/FEB_test.srcs/sources_1/new/AFE_Pipeline.vhd2default:default2
782default:default8@Z8-4765h px� 
�
aRemoving register instance (%s) from module (%s) as it is equivalent to (%s) and driving same net3897*oasys2c
O\AFE_Pipeline_inst/Gen_Two_AFEs[0].Gen_Eight_Chans[0].PipelineWrtAdd_reg[0][1] 2default:default2 
AFE_DataPath2default:default2c
O\AFE_Pipeline_inst/Gen_Two_AFEs[0].Gen_Eight_Chans[7].PipelineWrtAdd_reg[0][1] 2default:default2T
>C:/v23.1/FEB_test/FEB_test.srcs/sources_1/new/AFE_Pipeline.vhd2default:default2
492default:default8@Z8-4765h px� 
�
aRemoving register instance (%s) from module (%s) as it is equivalent to (%s) and driving same net3897*oasys2c
O\AFE_Pipeline_inst/Gen_Two_AFEs[0].Gen_Eight_Chans[1].PipelineWrtAdd_reg[0][1] 2default:default2 
AFE_DataPath2default:default2c
O\AFE_Pipeline_inst/Gen_Two_AFEs[0].Gen_Eight_Chans[7].PipelineWrtAdd_reg[0][1] 2default:default2T
>C:/v23.1/FEB_test/FEB_test.srcs/sources_1/new/AFE_Pipeline.vhd2default:default2
782default:default8@Z8-4765h px� 
�
aRemoving register instance (%s) from module (%s) as it is equivalent to (%s) and driving same net3897*oasys2c
O\AFE_Pipeline_inst/Gen_Two_AFEs[0].Gen_Eight_Chans[2].PipelineWrtAdd_reg[0][1] 2default:default2 
AFE_DataPath2default:default2c
O\AFE_Pipeline_inst/Gen_Two_AFEs[0].Gen_Eight_Chans[7].PipelineWrtAdd_reg[0][1] 2default:default2T
>C:/v23.1/FEB_test/FEB_test.srcs/sources_1/new/AFE_Pipeline.vhd2default:default2
782default:default8@Z8-4765h px� 
�
aRemoving register instance (%s) from module (%s) as it is equivalent to (%s) and driving same net3897*oasys2c
O\AFE_Pipeline_inst/Gen_Two_AFEs[0].Gen_Eight_Chans[3].PipelineWrtAdd_reg[0][1] 2default:default2 
AFE_DataPath2default:default2c
O\AFE_Pipeline_inst/Gen_Two_AFEs[0].Gen_Eight_Chans[7].PipelineWrtAdd_reg[0][1] 2default:default2T
>C:/v23.1/FEB_test/FEB_test.srcs/sources_1/new/AFE_Pipeline.vhd2default:default2
782default:default8@Z8-4765h px� 
�
aRemoving register instance (%s) from module (%s) as it is equivalent to (%s) and driving same net3897*oasys2c
O\AFE_Pipeline_inst/Gen_Two_AFEs[0].Gen_Eight_Chans[4].PipelineWrtAdd_reg[0][1] 2default:default2 
AFE_DataPath2default:default2c
O\AFE_Pipeline_inst/Gen_Two_AFEs[0].Gen_Eight_Chans[7].PipelineWrtAdd_reg[0][1] 2default:default2T
>C:/v23.1/FEB_test/FEB_test.srcs/sources_1/new/AFE_Pipeline.vhd2default:default2
782default:default8@Z8-4765h px� 
�
aRemoving register instance (%s) from module (%s) as it is equivalent to (%s) and driving same net3897*oasys2c
O\AFE_Pipeline_inst/Gen_Two_AFEs[0].Gen_Eight_Chans[5].PipelineWrtAdd_reg[0][1] 2default:default2 
AFE_DataPath2default:default2c
O\AFE_Pipeline_inst/Gen_Two_AFEs[0].Gen_Eight_Chans[7].PipelineWrtAdd_reg[0][1] 2default:default2T
>C:/v23.1/FEB_test/FEB_test.srcs/sources_1/new/AFE_Pipeline.vhd2default:default2
782default:default8@Z8-4765h px� 
�
aRemoving register instance (%s) from module (%s) as it is equivalent to (%s) and driving same net3897*oasys2c
O\AFE_Pipeline_inst/Gen_Two_AFEs[0].Gen_Eight_Chans[6].PipelineWrtAdd_reg[0][1] 2default:default2 
AFE_DataPath2default:default2c
O\AFE_Pipeline_inst/Gen_Two_AFEs[0].Gen_Eight_Chans[7].PipelineWrtAdd_reg[0][1] 2default:default2T
>C:/v23.1/FEB_test/FEB_test.srcs/sources_1/new/AFE_Pipeline.vhd2default:default2
782default:default8@Z8-4765h px� 
�
aRemoving register instance (%s) from module (%s) as it is equivalent to (%s) and driving same net3897*oasys2c
O\AFE_Pipeline_inst/Gen_Two_AFEs[0].Gen_Eight_Chans[0].PipelineWrtAdd_reg[0][0] 2default:default2 
AFE_DataPath2default:default2c
O\AFE_Pipeline_inst/Gen_Two_AFEs[0].Gen_Eight_Chans[7].PipelineWrtAdd_reg[0][0] 2default:default2T
>C:/v23.1/FEB_test/FEB_test.srcs/sources_1/new/AFE_Pipeline.vhd2default:default2
492default:default8@Z8-4765h px� 
�
aRemoving register instance (%s) from module (%s) as it is equivalent to (%s) and driving same net3897*oasys2c
O\AFE_Pipeline_inst/Gen_Two_AFEs[0].Gen_Eight_Chans[1].PipelineWrtAdd_reg[0][0] 2default:default2 
AFE_DataPath2default:default2c
O\AFE_Pipeline_inst/Gen_Two_AFEs[0].Gen_Eight_Chans[7].PipelineWrtAdd_reg[0][0] 2default:default2T
>C:/v23.1/FEB_test/FEB_test.srcs/sources_1/new/AFE_Pipeline.vhd2default:default2
782default:default8@Z8-4765h px� 
�
aRemoving register instance (%s) from module (%s) as it is equivalent to (%s) and driving same net3897*oasys2c
O\AFE_Pipeline_inst/Gen_Two_AFEs[0].Gen_Eight_Chans[2].PipelineWrtAdd_reg[0][0] 2default:default2 
AFE_DataPath2default:default2c
O\AFE_Pipeline_inst/Gen_Two_AFEs[0].Gen_Eight_Chans[7].PipelineWrtAdd_reg[0][0] 2default:default2T
>C:/v23.1/FEB_test/FEB_test.srcs/sources_1/new/AFE_Pipeline.vhd2default:default2
782default:default8@Z8-4765h px� 
�
aRemoving register instance (%s) from module (%s) as it is equivalent to (%s) and driving same net3897*oasys2c
O\AFE_Pipeline_inst/Gen_Two_AFEs[0].Gen_Eight_Chans[3].PipelineWrtAdd_reg[0][0] 2default:default2 
AFE_DataPath2default:default2c
O\AFE_Pipeline_inst/Gen_Two_AFEs[0].Gen_Eight_Chans[7].PipelineWrtAdd_reg[0][0] 2default:default2T
>C:/v23.1/FEB_test/FEB_test.srcs/sources_1/new/AFE_Pipeline.vhd2default:default2
782default:default8@Z8-4765h px� 
�
aRemoving register instance (%s) from module (%s) as it is equivalent to (%s) and driving same net3897*oasys2c
O\AFE_Pipeline_inst/Gen_Two_AFEs[0].Gen_Eight_Chans[4].PipelineWrtAdd_reg[0][0] 2default:default2 
AFE_DataPath2default:default2c
O\AFE_Pipeline_inst/Gen_Two_AFEs[0].Gen_Eight_Chans[7].PipelineWrtAdd_reg[0][0] 2default:default2T
>C:/v23.1/FEB_test/FEB_test.srcs/sources_1/new/AFE_Pipeline.vhd2default:default2
782default:default8@Z8-4765h px� 
�
aRemoving register instance (%s) from module (%s) as it is equivalent to (%s) and driving same net3897*oasys2c
O\AFE_Pipeline_inst/Gen_Two_AFEs[0].Gen_Eight_Chans[5].PipelineWrtAdd_reg[0][0] 2default:default2 
AFE_DataPath2default:default2c
O\AFE_Pipeline_inst/Gen_Two_AFEs[0].Gen_Eight_Chans[7].PipelineWrtAdd_reg[0][0] 2default:default2T
>C:/v23.1/FEB_test/FEB_test.srcs/sources_1/new/AFE_Pipeline.vhd2default:default2
782default:default8@Z8-4765h px� 
�
aRemoving register instance (%s) from module (%s) as it is equivalent to (%s) and driving same net3897*oasys2c
O\AFE_Pipeline_inst/Gen_Two_AFEs[0].Gen_Eight_Chans[6].PipelineWrtAdd_reg[0][0] 2default:default2 
AFE_DataPath2default:default2c
O\AFE_Pipeline_inst/Gen_Two_AFEs[0].Gen_Eight_Chans[7].PipelineWrtAdd_reg[0][0] 2default:default2T
>C:/v23.1/FEB_test/FEB_test.srcs/sources_1/new/AFE_Pipeline.vhd2default:default2
782default:default8@Z8-4765h px� 
�
aRemoving register instance (%s) from module (%s) as it is equivalent to (%s) and driving same net3897*oasys2b
N\AFE_Pipeline_inst/Gen_Two_AFEs[0].Gen_Eight_Chans[0].PipelineRdAdd_reg[0][7] 2default:default2 
AFE_DataPath2default:default2b
N\AFE_Pipeline_inst/Gen_Two_AFEs[0].Gen_Eight_Chans[7].PipelineRdAdd_reg[0][7] 2default:default2T
>C:/v23.1/FEB_test/FEB_test.srcs/sources_1/new/AFE_Pipeline.vhd2default:default2
612default:default8@Z8-4765h px� 
�
aRemoving register instance (%s) from module (%s) as it is equivalent to (%s) and driving same net3897*oasys2b
N\AFE_Pipeline_inst/Gen_Two_AFEs[0].Gen_Eight_Chans[1].PipelineRdAdd_reg[0][7] 2default:default2 
AFE_DataPath2default:default2b
N\AFE_Pipeline_inst/Gen_Two_AFEs[0].Gen_Eight_Chans[7].PipelineRdAdd_reg[0][7] 2default:default2T
>C:/v23.1/FEB_test/FEB_test.srcs/sources_1/new/AFE_Pipeline.vhd2default:default2
792default:default8@Z8-4765h px� 
�
aRemoving register instance (%s) from module (%s) as it is equivalent to (%s) and driving same net3897*oasys2b
N\AFE_Pipeline_inst/Gen_Two_AFEs[0].Gen_Eight_Chans[2].PipelineRdAdd_reg[0][7] 2default:default2 
AFE_DataPath2default:default2b
N\AFE_Pipeline_inst/Gen_Two_AFEs[0].Gen_Eight_Chans[7].PipelineRdAdd_reg[0][7] 2default:default2T
>C:/v23.1/FEB_test/FEB_test.srcs/sources_1/new/AFE_Pipeline.vhd2default:default2
792default:default8@Z8-4765h px� 
�
aRemoving register instance (%s) from module (%s) as it is equivalent to (%s) and driving same net3897*oasys2b
N\AFE_Pipeline_inst/Gen_Two_AFEs[0].Gen_Eight_Chans[3].PipelineRdAdd_reg[0][7] 2default:default2 
AFE_DataPath2default:default2b
N\AFE_Pipeline_inst/Gen_Two_AFEs[0].Gen_Eight_Chans[7].PipelineRdAdd_reg[0][7] 2default:default2T
>C:/v23.1/FEB_test/FEB_test.srcs/sources_1/new/AFE_Pipeline.vhd2default:default2
792default:default8@Z8-4765h px� 
�
aRemoving register instance (%s) from module (%s) as it is equivalent to (%s) and driving same net3897*oasys2b
N\AFE_Pipeline_inst/Gen_Two_AFEs[0].Gen_Eight_Chans[4].PipelineRdAdd_reg[0][7] 2default:default2 
AFE_DataPath2default:default2b
N\AFE_Pipeline_inst/Gen_Two_AFEs[0].Gen_Eight_Chans[7].PipelineRdAdd_reg[0][7] 2default:default2T
>C:/v23.1/FEB_test/FEB_test.srcs/sources_1/new/AFE_Pipeline.vhd2default:default2
792default:default8@Z8-4765h px� 
�
aRemoving register instance (%s) from module (%s) as it is equivalent to (%s) and driving same net3897*oasys2b
N\AFE_Pipeline_inst/Gen_Two_AFEs[0].Gen_Eight_Chans[5].PipelineRdAdd_reg[0][7] 2default:default2 
AFE_DataPath2default:default2b
N\AFE_Pipeline_inst/Gen_Two_AFEs[0].Gen_Eight_Chans[7].PipelineRdAdd_reg[0][7] 2default:default2T
>C:/v23.1/FEB_test/FEB_test.srcs/sources_1/new/AFE_Pipeline.vhd2default:default2
792default:default8@Z8-4765h px� 
�
aRemoving register instance (%s) from module (%s) as it is equivalent to (%s) and driving same net3897*oasys2b
N\AFE_Pipeline_inst/Gen_Two_AFEs[0].Gen_Eight_Chans[6].PipelineRdAdd_reg[0][7] 2default:default2 
AFE_DataPath2default:default2b
N\AFE_Pipeline_inst/Gen_Two_AFEs[0].Gen_Eight_Chans[7].PipelineRdAdd_reg[0][7] 2default:default2T
>C:/v23.1/FEB_test/FEB_test.srcs/sources_1/new/AFE_Pipeline.vhd2default:default2
792default:default8@Z8-4765h px� 
�
aRemoving register instance (%s) from module (%s) as it is equivalent to (%s) and driving same net3897*oasys2b
N\AFE_Pipeline_inst/Gen_Two_AFEs[0].Gen_Eight_Chans[0].PipelineRdAdd_reg[0][6] 2default:default2 
AFE_DataPath2default:default2b
N\AFE_Pipeline_inst/Gen_Two_AFEs[0].Gen_Eight_Chans[7].PipelineRdAdd_reg[0][6] 2default:default2T
>C:/v23.1/FEB_test/FEB_test.srcs/sources_1/new/AFE_Pipeline.vhd2default:default2
612default:default8@Z8-4765h px� 
�
aRemoving register instance (%s) from module (%s) as it is equivalent to (%s) and driving same net3897*oasys2b
N\AFE_Pipeline_inst/Gen_Two_AFEs[0].Gen_Eight_Chans[1].PipelineRdAdd_reg[0][6] 2default:default2 
AFE_DataPath2default:default2b
N\AFE_Pipeline_inst/Gen_Two_AFEs[0].Gen_Eight_Chans[7].PipelineRdAdd_reg[0][6] 2default:default2T
>C:/v23.1/FEB_test/FEB_test.srcs/sources_1/new/AFE_Pipeline.vhd2default:default2
792default:default8@Z8-4765h px� 
�
aRemoving register instance (%s) from module (%s) as it is equivalent to (%s) and driving same net3897*oasys2b
N\AFE_Pipeline_inst/Gen_Two_AFEs[0].Gen_Eight_Chans[2].PipelineRdAdd_reg[0][6] 2default:default2 
AFE_DataPath2default:default2b
N\AFE_Pipeline_inst/Gen_Two_AFEs[0].Gen_Eight_Chans[7].PipelineRdAdd_reg[0][6] 2default:default2T
>C:/v23.1/FEB_test/FEB_test.srcs/sources_1/new/AFE_Pipeline.vhd2default:default2
792default:default8@Z8-4765h px� 
�
aRemoving register instance (%s) from module (%s) as it is equivalent to (%s) and driving same net3897*oasys2b
N\AFE_Pipeline_inst/Gen_Two_AFEs[0].Gen_Eight_Chans[3].PipelineRdAdd_reg[0][6] 2default:default2 
AFE_DataPath2default:default2b
N\AFE_Pipeline_inst/Gen_Two_AFEs[0].Gen_Eight_Chans[7].PipelineRdAdd_reg[0][6] 2default:default2T
>C:/v23.1/FEB_test/FEB_test.srcs/sources_1/new/AFE_Pipeline.vhd2default:default2
792default:default8@Z8-4765h px� 
�
aRemoving register instance (%s) from module (%s) as it is equivalent to (%s) and driving same net3897*oasys2b
N\AFE_Pipeline_inst/Gen_Two_AFEs[0].Gen_Eight_Chans[4].PipelineRdAdd_reg[0][6] 2default:default2 
AFE_DataPath2default:default2b
N\AFE_Pipeline_inst/Gen_Two_AFEs[0].Gen_Eight_Chans[7].PipelineRdAdd_reg[0][6] 2default:default2T
>C:/v23.1/FEB_test/FEB_test.srcs/sources_1/new/AFE_Pipeline.vhd2default:default2
792default:default8@Z8-4765h px� 
�
aRemoving register instance (%s) from module (%s) as it is equivalent to (%s) and driving same net3897*oasys2b
N\AFE_Pipeline_inst/Gen_Two_AFEs[0].Gen_Eight_Chans[5].PipelineRdAdd_reg[0][6] 2default:default2 
AFE_DataPath2default:default2b
N\AFE_Pipeline_inst/Gen_Two_AFEs[0].Gen_Eight_Chans[7].PipelineRdAdd_reg[0][6] 2default:default2T
>C:/v23.1/FEB_test/FEB_test.srcs/sources_1/new/AFE_Pipeline.vhd2default:default2
792default:default8@Z8-4765h px� 
�
aRemoving register instance (%s) from module (%s) as it is equivalent to (%s) and driving same net3897*oasys2b
N\AFE_Pipeline_inst/Gen_Two_AFEs[0].Gen_Eight_Chans[6].PipelineRdAdd_reg[0][6] 2default:default2 
AFE_DataPath2default:default2b
N\AFE_Pipeline_inst/Gen_Two_AFEs[0].Gen_Eight_Chans[7].PipelineRdAdd_reg[0][6] 2default:default2T
>C:/v23.1/FEB_test/FEB_test.srcs/sources_1/new/AFE_Pipeline.vhd2default:default2
792default:default8@Z8-4765h px� 
�
aRemoving register instance (%s) from module (%s) as it is equivalent to (%s) and driving same net3897*oasys2b
N\AFE_Pipeline_inst/Gen_Two_AFEs[0].Gen_Eight_Chans[0].PipelineRdAdd_reg[0][5] 2default:default2 
AFE_DataPath2default:default2b
N\AFE_Pipeline_inst/Gen_Two_AFEs[0].Gen_Eight_Chans[7].PipelineRdAdd_reg[0][5] 2default:default2T
>C:/v23.1/FEB_test/FEB_test.srcs/sources_1/new/AFE_Pipeline.vhd2default:default2
612default:default8@Z8-4765h px� 
�
aRemoving register instance (%s) from module (%s) as it is equivalent to (%s) and driving same net3897*oasys2b
N\AFE_Pipeline_inst/Gen_Two_AFEs[0].Gen_Eight_Chans[1].PipelineRdAdd_reg[0][5] 2default:default2 
AFE_DataPath2default:default2b
N\AFE_Pipeline_inst/Gen_Two_AFEs[0].Gen_Eight_Chans[7].PipelineRdAdd_reg[0][5] 2default:default2T
>C:/v23.1/FEB_test/FEB_test.srcs/sources_1/new/AFE_Pipeline.vhd2default:default2
792default:default8@Z8-4765h px� 
�
aRemoving register instance (%s) from module (%s) as it is equivalent to (%s) and driving same net3897*oasys2b
N\AFE_Pipeline_inst/Gen_Two_AFEs[0].Gen_Eight_Chans[2].PipelineRdAdd_reg[0][5] 2default:default2 
AFE_DataPath2default:default2b
N\AFE_Pipeline_inst/Gen_Two_AFEs[0].Gen_Eight_Chans[7].PipelineRdAdd_reg[0][5] 2default:default2T
>C:/v23.1/FEB_test/FEB_test.srcs/sources_1/new/AFE_Pipeline.vhd2default:default2
792default:default8@Z8-4765h px� 
�
aRemoving register instance (%s) from module (%s) as it is equivalent to (%s) and driving same net3897*oasys2b
N\AFE_Pipeline_inst/Gen_Two_AFEs[0].Gen_Eight_Chans[3].PipelineRdAdd_reg[0][5] 2default:default2 
AFE_DataPath2default:default2b
N\AFE_Pipeline_inst/Gen_Two_AFEs[0].Gen_Eight_Chans[7].PipelineRdAdd_reg[0][5] 2default:default2T
>C:/v23.1/FEB_test/FEB_test.srcs/sources_1/new/AFE_Pipeline.vhd2default:default2
792default:default8@Z8-4765h px� 
�
aRemoving register instance (%s) from module (%s) as it is equivalent to (%s) and driving same net3897*oasys2b
N\AFE_Pipeline_inst/Gen_Two_AFEs[0].Gen_Eight_Chans[4].PipelineRdAdd_reg[0][5] 2default:default2 
AFE_DataPath2default:default2b
N\AFE_Pipeline_inst/Gen_Two_AFEs[0].Gen_Eight_Chans[7].PipelineRdAdd_reg[0][5] 2default:default2T
>C:/v23.1/FEB_test/FEB_test.srcs/sources_1/new/AFE_Pipeline.vhd2default:default2
792default:default8@Z8-4765h px� 
�
aRemoving register instance (%s) from module (%s) as it is equivalent to (%s) and driving same net3897*oasys2b
N\AFE_Pipeline_inst/Gen_Two_AFEs[0].Gen_Eight_Chans[5].PipelineRdAdd_reg[0][5] 2default:default2 
AFE_DataPath2default:default2b
N\AFE_Pipeline_inst/Gen_Two_AFEs[0].Gen_Eight_Chans[7].PipelineRdAdd_reg[0][5] 2default:default2T
>C:/v23.1/FEB_test/FEB_test.srcs/sources_1/new/AFE_Pipeline.vhd2default:default2
792default:default8@Z8-4765h px� 
�
aRemoving register instance (%s) from module (%s) as it is equivalent to (%s) and driving same net3897*oasys2b
N\AFE_Pipeline_inst/Gen_Two_AFEs[0].Gen_Eight_Chans[6].PipelineRdAdd_reg[0][5] 2default:default2 
AFE_DataPath2default:default2b
N\AFE_Pipeline_inst/Gen_Two_AFEs[0].Gen_Eight_Chans[7].PipelineRdAdd_reg[0][5] 2default:default2T
>C:/v23.1/FEB_test/FEB_test.srcs/sources_1/new/AFE_Pipeline.vhd2default:default2
792default:default8@Z8-4765h px� 
�
aRemoving register instance (%s) from module (%s) as it is equivalent to (%s) and driving same net3897*oasys2b
N\AFE_Pipeline_inst/Gen_Two_AFEs[0].Gen_Eight_Chans[0].PipelineRdAdd_reg[0][4] 2default:default2 
AFE_DataPath2default:default2b
N\AFE_Pipeline_inst/Gen_Two_AFEs[0].Gen_Eight_Chans[7].PipelineRdAdd_reg[0][4] 2default:default2T
>C:/v23.1/FEB_test/FEB_test.srcs/sources_1/new/AFE_Pipeline.vhd2default:default2
612default:default8@Z8-4765h px� 
�
aRemoving register instance (%s) from module (%s) as it is equivalent to (%s) and driving same net3897*oasys2b
N\AFE_Pipeline_inst/Gen_Two_AFEs[0].Gen_Eight_Chans[1].PipelineRdAdd_reg[0][4] 2default:default2 
AFE_DataPath2default:default2b
N\AFE_Pipeline_inst/Gen_Two_AFEs[0].Gen_Eight_Chans[7].PipelineRdAdd_reg[0][4] 2default:default2T
>C:/v23.1/FEB_test/FEB_test.srcs/sources_1/new/AFE_Pipeline.vhd2default:default2
792default:default8@Z8-4765h px� 
�
aRemoving register instance (%s) from module (%s) as it is equivalent to (%s) and driving same net3897*oasys2b
N\AFE_Pipeline_inst/Gen_Two_AFEs[0].Gen_Eight_Chans[2].PipelineRdAdd_reg[0][4] 2default:default2 
AFE_DataPath2default:default2b
N\AFE_Pipeline_inst/Gen_Two_AFEs[0].Gen_Eight_Chans[7].PipelineRdAdd_reg[0][4] 2default:default2T
>C:/v23.1/FEB_test/FEB_test.srcs/sources_1/new/AFE_Pipeline.vhd2default:default2
792default:default8@Z8-4765h px� 
�
aRemoving register instance (%s) from module (%s) as it is equivalent to (%s) and driving same net3897*oasys2b
N\AFE_Pipeline_inst/Gen_Two_AFEs[0].Gen_Eight_Chans[3].PipelineRdAdd_reg[0][4] 2default:default2 
AFE_DataPath2default:default2b
N\AFE_Pipeline_inst/Gen_Two_AFEs[0].Gen_Eight_Chans[7].PipelineRdAdd_reg[0][4] 2default:default2T
>C:/v23.1/FEB_test/FEB_test.srcs/sources_1/new/AFE_Pipeline.vhd2default:default2
792default:default8@Z8-4765h px� 
�
aRemoving register instance (%s) from module (%s) as it is equivalent to (%s) and driving same net3897*oasys2b
N\AFE_Pipeline_inst/Gen_Two_AFEs[0].Gen_Eight_Chans[4].PipelineRdAdd_reg[0][4] 2default:default2 
AFE_DataPath2default:default2b
N\AFE_Pipeline_inst/Gen_Two_AFEs[0].Gen_Eight_Chans[7].PipelineRdAdd_reg[0][4] 2default:default2T
>C:/v23.1/FEB_test/FEB_test.srcs/sources_1/new/AFE_Pipeline.vhd2default:default2
792default:default8@Z8-4765h px� 
�
aRemoving register instance (%s) from module (%s) as it is equivalent to (%s) and driving same net3897*oasys2b
N\AFE_Pipeline_inst/Gen_Two_AFEs[0].Gen_Eight_Chans[5].PipelineRdAdd_reg[0][4] 2default:default2 
AFE_DataPath2default:default2b
N\AFE_Pipeline_inst/Gen_Two_AFEs[0].Gen_Eight_Chans[7].PipelineRdAdd_reg[0][4] 2default:default2T
>C:/v23.1/FEB_test/FEB_test.srcs/sources_1/new/AFE_Pipeline.vhd2default:default2
792default:default8@Z8-4765h px� 
�
aRemoving register instance (%s) from module (%s) as it is equivalent to (%s) and driving same net3897*oasys2b
N\AFE_Pipeline_inst/Gen_Two_AFEs[0].Gen_Eight_Chans[6].PipelineRdAdd_reg[0][4] 2default:default2 
AFE_DataPath2default:default2b
N\AFE_Pipeline_inst/Gen_Two_AFEs[0].Gen_Eight_Chans[7].PipelineRdAdd_reg[0][4] 2default:default2T
>C:/v23.1/FEB_test/FEB_test.srcs/sources_1/new/AFE_Pipeline.vhd2default:default2
792default:default8@Z8-4765h px� 
�
aRemoving register instance (%s) from module (%s) as it is equivalent to (%s) and driving same net3897*oasys2b
N\AFE_Pipeline_inst/Gen_Two_AFEs[0].Gen_Eight_Chans[0].PipelineRdAdd_reg[0][3] 2default:default2 
AFE_DataPath2default:default2b
N\AFE_Pipeline_inst/Gen_Two_AFEs[0].Gen_Eight_Chans[7].PipelineRdAdd_reg[0][3] 2default:default2T
>C:/v23.1/FEB_test/FEB_test.srcs/sources_1/new/AFE_Pipeline.vhd2default:default2
612default:default8@Z8-4765h px� 
�
aRemoving register instance (%s) from module (%s) as it is equivalent to (%s) and driving same net3897*oasys2b
N\AFE_Pipeline_inst/Gen_Two_AFEs[0].Gen_Eight_Chans[1].PipelineRdAdd_reg[0][3] 2default:default2 
AFE_DataPath2default:default2b
N\AFE_Pipeline_inst/Gen_Two_AFEs[0].Gen_Eight_Chans[7].PipelineRdAdd_reg[0][3] 2default:default2T
>C:/v23.1/FEB_test/FEB_test.srcs/sources_1/new/AFE_Pipeline.vhd2default:default2
792default:default8@Z8-4765h px� 
�
�Message '%s' appears more than %s times and has been disabled. User can change this message limit to see more message instances.
14*common2 
Synth 8-47652default:default2
1002default:defaultZ17-14h px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
|Finished Technology Mapping : Time (s): cpu = 00:00:52 ; elapsed = 00:00:54 . Memory (MB): peak = 2743.402 ; gain = 706.742
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
?
%s
*synth2'
Start IO Insertion
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
Q
%s
*synth29
%Start Flattening Before IO Insertion
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
T
%s
*synth2<
(Finished Flattening Before IO Insertion
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
H
%s
*synth20
Start Final Netlist Cleanup
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
K
%s
*synth23
Finished Final Netlist Cleanup
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
'tying undriven pin %s:%s to constant 0
3295*oasys2!
B_in_inferred2default:default2
in0[4]2default:defaultZ8-3295h px� 
�
'tying undriven pin %s:%s to constant 0
3295*oasys2!
B_in_inferred2default:default2
in0[3]2default:defaultZ8-3295h px� 
�
'tying undriven pin %s:%s to constant 0
3295*oasys2!
B_in_inferred2default:default2
in0[2]2default:defaultZ8-3295h px� 
�
'tying undriven pin %s:%s to constant 0
3295*oasys2!
B_in_inferred2default:default2
in0[1]2default:defaultZ8-3295h px� 
�
'tying undriven pin %s:%s to constant 0
3295*oasys2!
B_in_inferred2default:default2
in0[0]2default:defaultZ8-3295h px� 
�
'tying undriven pin %s:%s to constant 0
3295*oasys2%
AFE_DataPath_inst2default:default2(
BufferRdAdd[0][0][9]2default:defaultZ8-3295h px� 
�
'tying undriven pin %s:%s to constant 0
3295*oasys2%
AFE_DataPath_inst2default:default2(
BufferRdAdd[0][0][8]2default:defaultZ8-3295h px� 
�
'tying undriven pin %s:%s to constant 0
3295*oasys2%
AFE_DataPath_inst2default:default2(
BufferRdAdd[0][0][7]2default:defaultZ8-3295h px� 
�
'tying undriven pin %s:%s to constant 0
3295*oasys2%
AFE_DataPath_inst2default:default2(
BufferRdAdd[0][0][6]2default:defaultZ8-3295h px� 
�
'tying undriven pin %s:%s to constant 0
3295*oasys2%
AFE_DataPath_inst2default:default2(
BufferRdAdd[0][0][5]2default:defaultZ8-3295h px� 
�
'tying undriven pin %s:%s to constant 0
3295*oasys2%
AFE_DataPath_inst2default:default2(
BufferRdAdd[0][0][4]2default:defaultZ8-3295h px� 
�
'tying undriven pin %s:%s to constant 0
3295*oasys2%
AFE_DataPath_inst2default:default2(
BufferRdAdd[0][0][3]2default:defaultZ8-3295h px� 
�
'tying undriven pin %s:%s to constant 0
3295*oasys2%
AFE_DataPath_inst2default:default2(
BufferRdAdd[0][0][2]2default:defaultZ8-3295h px� 
�
'tying undriven pin %s:%s to constant 0
3295*oasys2%
AFE_DataPath_inst2default:default2(
BufferRdAdd[0][0][1]2default:defaultZ8-3295h px� 
�
'tying undriven pin %s:%s to constant 0
3295*oasys2%
AFE_DataPath_inst2default:default2(
BufferRdAdd[0][0][0]2default:defaultZ8-3295h px� 
�
'tying undriven pin %s:%s to constant 0
3295*oasys2%
AFE_DataPath_inst2default:default2(
BufferRdAdd[0][1][9]2default:defaultZ8-3295h px� 
�
'tying undriven pin %s:%s to constant 0
3295*oasys2%
AFE_DataPath_inst2default:default2(
BufferRdAdd[0][1][8]2default:defaultZ8-3295h px� 
�
'tying undriven pin %s:%s to constant 0
3295*oasys2%
AFE_DataPath_inst2default:default2(
BufferRdAdd[0][1][7]2default:defaultZ8-3295h px� 
�
'tying undriven pin %s:%s to constant 0
3295*oasys2%
AFE_DataPath_inst2default:default2(
BufferRdAdd[0][1][6]2default:defaultZ8-3295h px� 
�
'tying undriven pin %s:%s to constant 0
3295*oasys2%
AFE_DataPath_inst2default:default2(
BufferRdAdd[0][1][5]2default:defaultZ8-3295h px� 
�
'tying undriven pin %s:%s to constant 0
3295*oasys2%
AFE_DataPath_inst2default:default2(
BufferRdAdd[0][1][4]2default:defaultZ8-3295h px� 
�
'tying undriven pin %s:%s to constant 0
3295*oasys2%
AFE_DataPath_inst2default:default2(
BufferRdAdd[0][1][3]2default:defaultZ8-3295h px� 
�
'tying undriven pin %s:%s to constant 0
3295*oasys2%
AFE_DataPath_inst2default:default2(
BufferRdAdd[0][1][2]2default:defaultZ8-3295h px� 
�
'tying undriven pin %s:%s to constant 0
3295*oasys2%
AFE_DataPath_inst2default:default2(
BufferRdAdd[0][1][1]2default:defaultZ8-3295h px� 
�
'tying undriven pin %s:%s to constant 0
3295*oasys2%
AFE_DataPath_inst2default:default2(
BufferRdAdd[0][1][0]2default:defaultZ8-3295h px� 
�
'tying undriven pin %s:%s to constant 0
3295*oasys2%
AFE_DataPath_inst2default:default2(
BufferRdAdd[0][2][9]2default:defaultZ8-3295h px� 
�
'tying undriven pin %s:%s to constant 0
3295*oasys2%
AFE_DataPath_inst2default:default2(
BufferRdAdd[0][2][8]2default:defaultZ8-3295h px� 
�
'tying undriven pin %s:%s to constant 0
3295*oasys2%
AFE_DataPath_inst2default:default2(
BufferRdAdd[0][2][7]2default:defaultZ8-3295h px� 
�
'tying undriven pin %s:%s to constant 0
3295*oasys2%
AFE_DataPath_inst2default:default2(
BufferRdAdd[0][2][6]2default:defaultZ8-3295h px� 
�
'tying undriven pin %s:%s to constant 0
3295*oasys2%
AFE_DataPath_inst2default:default2(
BufferRdAdd[0][2][5]2default:defaultZ8-3295h px� 
�
'tying undriven pin %s:%s to constant 0
3295*oasys2%
AFE_DataPath_inst2default:default2(
BufferRdAdd[0][2][4]2default:defaultZ8-3295h px� 
�
'tying undriven pin %s:%s to constant 0
3295*oasys2%
AFE_DataPath_inst2default:default2(
BufferRdAdd[0][2][3]2default:defaultZ8-3295h px� 
�
'tying undriven pin %s:%s to constant 0
3295*oasys2%
AFE_DataPath_inst2default:default2(
BufferRdAdd[0][2][2]2default:defaultZ8-3295h px� 
�
'tying undriven pin %s:%s to constant 0
3295*oasys2%
AFE_DataPath_inst2default:default2(
BufferRdAdd[0][2][1]2default:defaultZ8-3295h px� 
�
'tying undriven pin %s:%s to constant 0
3295*oasys2%
AFE_DataPath_inst2default:default2(
BufferRdAdd[0][2][0]2default:defaultZ8-3295h px� 
�
'tying undriven pin %s:%s to constant 0
3295*oasys2%
AFE_DataPath_inst2default:default2(
BufferRdAdd[0][3][9]2default:defaultZ8-3295h px� 
�
'tying undriven pin %s:%s to constant 0
3295*oasys2%
AFE_DataPath_inst2default:default2(
BufferRdAdd[0][3][8]2default:defaultZ8-3295h px� 
�
'tying undriven pin %s:%s to constant 0
3295*oasys2%
AFE_DataPath_inst2default:default2(
BufferRdAdd[0][3][7]2default:defaultZ8-3295h px� 
�
'tying undriven pin %s:%s to constant 0
3295*oasys2%
AFE_DataPath_inst2default:default2(
BufferRdAdd[0][3][6]2default:defaultZ8-3295h px� 
�
'tying undriven pin %s:%s to constant 0
3295*oasys2%
AFE_DataPath_inst2default:default2(
BufferRdAdd[0][3][5]2default:defaultZ8-3295h px� 
�
'tying undriven pin %s:%s to constant 0
3295*oasys2%
AFE_DataPath_inst2default:default2(
BufferRdAdd[0][3][4]2default:defaultZ8-3295h px� 
�
'tying undriven pin %s:%s to constant 0
3295*oasys2%
AFE_DataPath_inst2default:default2(
BufferRdAdd[0][3][3]2default:defaultZ8-3295h px� 
�
'tying undriven pin %s:%s to constant 0
3295*oasys2%
AFE_DataPath_inst2default:default2(
BufferRdAdd[0][3][2]2default:defaultZ8-3295h px� 
�
'tying undriven pin %s:%s to constant 0
3295*oasys2%
AFE_DataPath_inst2default:default2(
BufferRdAdd[0][3][1]2default:defaultZ8-3295h px� 
�
'tying undriven pin %s:%s to constant 0
3295*oasys2%
AFE_DataPath_inst2default:default2(
BufferRdAdd[0][3][0]2default:defaultZ8-3295h px� 
�
'tying undriven pin %s:%s to constant 0
3295*oasys2%
AFE_DataPath_inst2default:default2(
BufferRdAdd[0][4][9]2default:defaultZ8-3295h px� 
�
'tying undriven pin %s:%s to constant 0
3295*oasys2%
AFE_DataPath_inst2default:default2(
BufferRdAdd[0][4][8]2default:defaultZ8-3295h px� 
�
'tying undriven pin %s:%s to constant 0
3295*oasys2%
AFE_DataPath_inst2default:default2(
BufferRdAdd[0][4][7]2default:defaultZ8-3295h px� 
�
'tying undriven pin %s:%s to constant 0
3295*oasys2%
AFE_DataPath_inst2default:default2(
BufferRdAdd[0][4][6]2default:defaultZ8-3295h px� 
�
'tying undriven pin %s:%s to constant 0
3295*oasys2%
AFE_DataPath_inst2default:default2(
BufferRdAdd[0][4][5]2default:defaultZ8-3295h px� 
�
'tying undriven pin %s:%s to constant 0
3295*oasys2%
AFE_DataPath_inst2default:default2(
BufferRdAdd[0][4][4]2default:defaultZ8-3295h px� 
�
'tying undriven pin %s:%s to constant 0
3295*oasys2%
AFE_DataPath_inst2default:default2(
BufferRdAdd[0][4][3]2default:defaultZ8-3295h px� 
�
'tying undriven pin %s:%s to constant 0
3295*oasys2%
AFE_DataPath_inst2default:default2(
BufferRdAdd[0][4][2]2default:defaultZ8-3295h px� 
�
'tying undriven pin %s:%s to constant 0
3295*oasys2%
AFE_DataPath_inst2default:default2(
BufferRdAdd[0][4][1]2default:defaultZ8-3295h px� 
�
'tying undriven pin %s:%s to constant 0
3295*oasys2%
AFE_DataPath_inst2default:default2(
BufferRdAdd[0][4][0]2default:defaultZ8-3295h px� 
�
'tying undriven pin %s:%s to constant 0
3295*oasys2%
AFE_DataPath_inst2default:default2(
BufferRdAdd[0][5][9]2default:defaultZ8-3295h px� 
�
'tying undriven pin %s:%s to constant 0
3295*oasys2%
AFE_DataPath_inst2default:default2(
BufferRdAdd[0][5][8]2default:defaultZ8-3295h px� 
�
'tying undriven pin %s:%s to constant 0
3295*oasys2%
AFE_DataPath_inst2default:default2(
BufferRdAdd[0][5][7]2default:defaultZ8-3295h px� 
�
'tying undriven pin %s:%s to constant 0
3295*oasys2%
AFE_DataPath_inst2default:default2(
BufferRdAdd[0][5][6]2default:defaultZ8-3295h px� 
�
'tying undriven pin %s:%s to constant 0
3295*oasys2%
AFE_DataPath_inst2default:default2(
BufferRdAdd[0][5][5]2default:defaultZ8-3295h px� 
�
'tying undriven pin %s:%s to constant 0
3295*oasys2%
AFE_DataPath_inst2default:default2(
BufferRdAdd[0][5][4]2default:defaultZ8-3295h px� 
�
'tying undriven pin %s:%s to constant 0
3295*oasys2%
AFE_DataPath_inst2default:default2(
BufferRdAdd[0][5][3]2default:defaultZ8-3295h px� 
�
'tying undriven pin %s:%s to constant 0
3295*oasys2%
AFE_DataPath_inst2default:default2(
BufferRdAdd[0][5][2]2default:defaultZ8-3295h px� 
�
'tying undriven pin %s:%s to constant 0
3295*oasys2%
AFE_DataPath_inst2default:default2(
BufferRdAdd[0][5][1]2default:defaultZ8-3295h px� 
�
'tying undriven pin %s:%s to constant 0
3295*oasys2%
AFE_DataPath_inst2default:default2(
BufferRdAdd[0][5][0]2default:defaultZ8-3295h px� 
�
'tying undriven pin %s:%s to constant 0
3295*oasys2%
AFE_DataPath_inst2default:default2(
BufferRdAdd[0][6][9]2default:defaultZ8-3295h px� 
�
'tying undriven pin %s:%s to constant 0
3295*oasys2%
AFE_DataPath_inst2default:default2(
BufferRdAdd[0][6][8]2default:defaultZ8-3295h px� 
�
'tying undriven pin %s:%s to constant 0
3295*oasys2%
AFE_DataPath_inst2default:default2(
BufferRdAdd[0][6][7]2default:defaultZ8-3295h px� 
�
'tying undriven pin %s:%s to constant 0
3295*oasys2%
AFE_DataPath_inst2default:default2(
BufferRdAdd[0][6][6]2default:defaultZ8-3295h px� 
�
'tying undriven pin %s:%s to constant 0
3295*oasys2%
AFE_DataPath_inst2default:default2(
BufferRdAdd[0][6][5]2default:defaultZ8-3295h px� 
�
'tying undriven pin %s:%s to constant 0
3295*oasys2%
AFE_DataPath_inst2default:default2(
BufferRdAdd[0][6][4]2default:defaultZ8-3295h px� 
�
'tying undriven pin %s:%s to constant 0
3295*oasys2%
AFE_DataPath_inst2default:default2(
BufferRdAdd[0][6][3]2default:defaultZ8-3295h px� 
�
'tying undriven pin %s:%s to constant 0
3295*oasys2%
AFE_DataPath_inst2default:default2(
BufferRdAdd[0][6][2]2default:defaultZ8-3295h px� 
�
'tying undriven pin %s:%s to constant 0
3295*oasys2%
AFE_DataPath_inst2default:default2(
BufferRdAdd[0][6][1]2default:defaultZ8-3295h px� 
�
'tying undriven pin %s:%s to constant 0
3295*oasys2%
AFE_DataPath_inst2default:default2(
BufferRdAdd[0][6][0]2default:defaultZ8-3295h px� 
�
'tying undriven pin %s:%s to constant 0
3295*oasys2%
AFE_DataPath_inst2default:default2(
BufferRdAdd[0][7][9]2default:defaultZ8-3295h px� 
�
'tying undriven pin %s:%s to constant 0
3295*oasys2%
AFE_DataPath_inst2default:default2(
BufferRdAdd[0][7][8]2default:defaultZ8-3295h px� 
�
'tying undriven pin %s:%s to constant 0
3295*oasys2%
AFE_DataPath_inst2default:default2(
BufferRdAdd[0][7][7]2default:defaultZ8-3295h px� 
�
'tying undriven pin %s:%s to constant 0
3295*oasys2%
AFE_DataPath_inst2default:default2(
BufferRdAdd[0][7][6]2default:defaultZ8-3295h px� 
�
'tying undriven pin %s:%s to constant 0
3295*oasys2%
AFE_DataPath_inst2default:default2(
BufferRdAdd[0][7][5]2default:defaultZ8-3295h px� 
�
'tying undriven pin %s:%s to constant 0
3295*oasys2%
AFE_DataPath_inst2default:default2(
BufferRdAdd[0][7][4]2default:defaultZ8-3295h px� 
�
'tying undriven pin %s:%s to constant 0
3295*oasys2%
AFE_DataPath_inst2default:default2(
BufferRdAdd[0][7][3]2default:defaultZ8-3295h px� 
�
'tying undriven pin %s:%s to constant 0
3295*oasys2%
AFE_DataPath_inst2default:default2(
BufferRdAdd[0][7][2]2default:defaultZ8-3295h px� 
�
'tying undriven pin %s:%s to constant 0
3295*oasys2%
AFE_DataPath_inst2default:default2(
BufferRdAdd[0][7][1]2default:defaultZ8-3295h px� 
�
'tying undriven pin %s:%s to constant 0
3295*oasys2%
AFE_DataPath_inst2default:default2(
BufferRdAdd[0][7][0]2default:defaultZ8-3295h px� 
�
'tying undriven pin %s:%s to constant 0
3295*oasys2%
AFE_DataPath_inst2default:default2(
BufferRdAdd[1][0][9]2default:defaultZ8-3295h px� 
�
'tying undriven pin %s:%s to constant 0
3295*oasys2%
AFE_DataPath_inst2default:default2(
BufferRdAdd[1][0][8]2default:defaultZ8-3295h px� 
�
'tying undriven pin %s:%s to constant 0
3295*oasys2%
AFE_DataPath_inst2default:default2(
BufferRdAdd[1][0][7]2default:defaultZ8-3295h px� 
�
'tying undriven pin %s:%s to constant 0
3295*oasys2%
AFE_DataPath_inst2default:default2(
BufferRdAdd[1][0][6]2default:defaultZ8-3295h px� 
�
'tying undriven pin %s:%s to constant 0
3295*oasys2%
AFE_DataPath_inst2default:default2(
BufferRdAdd[1][0][5]2default:defaultZ8-3295h px� 
�
'tying undriven pin %s:%s to constant 0
3295*oasys2%
AFE_DataPath_inst2default:default2(
BufferRdAdd[1][0][4]2default:defaultZ8-3295h px� 
�
'tying undriven pin %s:%s to constant 0
3295*oasys2%
AFE_DataPath_inst2default:default2(
BufferRdAdd[1][0][3]2default:defaultZ8-3295h px� 
�
'tying undriven pin %s:%s to constant 0
3295*oasys2%
AFE_DataPath_inst2default:default2(
BufferRdAdd[1][0][2]2default:defaultZ8-3295h px� 
�
'tying undriven pin %s:%s to constant 0
3295*oasys2%
AFE_DataPath_inst2default:default2(
BufferRdAdd[1][0][1]2default:defaultZ8-3295h px� 
�
'tying undriven pin %s:%s to constant 0
3295*oasys2%
AFE_DataPath_inst2default:default2(
BufferRdAdd[1][0][0]2default:defaultZ8-3295h px� 
�
'tying undriven pin %s:%s to constant 0
3295*oasys2%
AFE_DataPath_inst2default:default2(
BufferRdAdd[1][1][9]2default:defaultZ8-3295h px� 
�
'tying undriven pin %s:%s to constant 0
3295*oasys2%
AFE_DataPath_inst2default:default2(
BufferRdAdd[1][1][8]2default:defaultZ8-3295h px� 
�
'tying undriven pin %s:%s to constant 0
3295*oasys2%
AFE_DataPath_inst2default:default2(
BufferRdAdd[1][1][7]2default:defaultZ8-3295h px� 
�
'tying undriven pin %s:%s to constant 0
3295*oasys2%
AFE_DataPath_inst2default:default2(
BufferRdAdd[1][1][6]2default:defaultZ8-3295h px� 
�
'tying undriven pin %s:%s to constant 0
3295*oasys2%
AFE_DataPath_inst2default:default2(
BufferRdAdd[1][1][5]2default:defaultZ8-3295h px� 
�
�Message '%s' appears more than %s times and has been disabled. User can change this message limit to see more message instances.
14*common2 
Synth 8-32952default:default2
1002default:defaultZ17-14h px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
vFinished IO Insertion : Time (s): cpu = 00:00:57 ; elapsed = 00:00:59 . Memory (MB): peak = 2743.402 ; gain = 706.742
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
O
%s
*synth27
#Start Renaming Generated Instances
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
�Finished Renaming Generated Instances : Time (s): cpu = 00:00:57 ; elapsed = 00:00:59 . Memory (MB): peak = 2743.402 ; gain = 706.742
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
L
%s
*synth24
 Start Rebuilding User Hierarchy
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
�Finished Rebuilding User Hierarchy : Time (s): cpu = 00:00:57 ; elapsed = 00:00:59 . Memory (MB): peak = 2743.402 ; gain = 706.742
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
K
%s
*synth23
Start Renaming Generated Ports
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
�Finished Renaming Generated Ports : Time (s): cpu = 00:00:57 ; elapsed = 00:00:59 . Memory (MB): peak = 2743.402 ; gain = 706.742
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
M
%s
*synth25
!Start Handling Custom Attributes
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
�Finished Handling Custom Attributes : Time (s): cpu = 00:00:57 ; elapsed = 00:00:59 . Memory (MB): peak = 2743.402 ; gain = 706.742
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
J
%s
*synth22
Start Renaming Generated Nets
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
�Finished Renaming Generated Nets : Time (s): cpu = 00:00:57 ; elapsed = 00:00:59 . Memory (MB): peak = 2743.402 ; gain = 706.742
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
K
%s
*synth23
Start Writing Synthesis Report
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
A
%s
*synth2)

Report BlackBoxes: 
2default:defaulth p
x
� 
Q
%s
*synth29
%+------+----------------+----------+
2default:defaulth p
x
� 
Q
%s
*synth29
%|      |BlackBox name   |Instances |
2default:defaulth p
x
� 
Q
%s
*synth29
%+------+----------------+----------+
2default:defaulth p
x
� 
Q
%s
*synth29
%|1     |DAC_ila_1       |         1|
2default:defaulth p
x
� 
Q
%s
*synth29
%|2     |vio_0           |         1|
2default:defaulth p
x
� 
Q
%s
*synth29
%|3     |DPRAM_1Kx16     |        16|
2default:defaulth p
x
� 
Q
%s
*synth29
%|4     |AFE_DP_Pipeline |         2|
2default:defaulth p
x
� 
Q
%s
*synth29
%|5     |SCFIFO_1Kx16    |         1|
2default:defaulth p
x
� 
Q
%s
*synth29
%|6     |PLL_0           |         1|
2default:defaulth p
x
� 
Q
%s
*synth29
%|7     |PLL_AFE         |         1|
2default:defaulth p
x
� 
Q
%s
*synth29
%|8     |AFE_ila_0       |         1|
2default:defaulth p
x
� 
Q
%s
*synth29
%|9     |CMD_Fifo        |         1|
2default:defaulth p
x
� 
Q
%s
*synth29
%|10    |DAC_Ram         |         1|
2default:defaulth p
x
� 
Q
%s
*synth29
%|11    |DDR3LController |         1|
2default:defaulth p
x
� 
Q
%s
*synth29
%|12    |LVDSTxBuff      |         1|
2default:defaulth p
x
� 
Q
%s
*synth29
%+------+----------------+----------+
2default:defaulth p
x
� 
A
%s*synth2)

Report Cell Usage: 
2default:defaulth px� 
R
%s*synth2:
&+------+---------------------+------+
2default:defaulth px� 
R
%s*synth2:
&|      |Cell                 |Count |
2default:defaulth px� 
R
%s*synth2:
&+------+---------------------+------+
2default:defaulth px� 
R
%s*synth2:
&|1     |AFE_DP_Pipeline_bbox |     2|
2default:defaulth px� 
R
%s*synth2:
&|3     |AFE_ila_0_bbox       |     1|
2default:defaulth px� 
R
%s*synth2:
&|4     |CMD_Fifo_bbox        |     1|
2default:defaulth px� 
R
%s*synth2:
&|5     |DAC_Ram_bbox         |     1|
2default:defaulth px� 
R
%s*synth2:
&|6     |DAC_ila_1_bbox       |     1|
2default:defaulth px� 
R
%s*synth2:
&|7     |DDR3LController_bbox |     1|
2default:defaulth px� 
R
%s*synth2:
&|8     |DPRAM_1Kx16_bbox     |    16|
2default:defaulth px� 
R
%s*synth2:
&|24    |LVDSTxBuff_bbox      |     1|
2default:defaulth px� 
R
%s*synth2:
&|25    |PLL_0_bbox           |     1|
2default:defaulth px� 
R
%s*synth2:
&|26    |PLL_AFE_bbox         |     1|
2default:defaulth px� 
R
%s*synth2:
&|27    |SCFIFO_1Kx16_bbox    |     1|
2default:defaulth px� 
R
%s*synth2:
&|28    |vio_0_bbox           |     1|
2default:defaulth px� 
R
%s*synth2:
&|29    |CARRY4               |   267|
2default:defaulth px� 
R
%s*synth2:
&|30    |IDELAYCTRL           |     1|
2default:defaulth px� 
R
%s*synth2:
&|31    |IDELAYE2             |    18|
2default:defaulth px� 
R
%s*synth2:
&|32    |ISERDESE2            |    36|
2default:defaulth px� 
R
%s*synth2:
&|34    |LUT1                 |    66|
2default:defaulth px� 
R
%s*synth2:
&|35    |LUT2                 |   780|
2default:defaulth px� 
R
%s*synth2:
&|36    |LUT3                 |   763|
2default:defaulth px� 
R
%s*synth2:
&|37    |LUT4                 |   464|
2default:defaulth px� 
R
%s*synth2:
&|38    |LUT5                 |   552|
2default:defaulth px� 
R
%s*synth2:
&|39    |LUT6                 |  1406|
2default:defaulth px� 
R
%s*synth2:
&|40    |MUXF7                |     1|
2default:defaulth px� 
R
%s*synth2:
&|41    |FDCE                 |  2428|
2default:defaulth px� 
R
%s*synth2:
&|42    |FDPE                 |    95|
2default:defaulth px� 
R
%s*synth2:
&|43    |FDRE                 |   597|
2default:defaulth px� 
R
%s*synth2:
&|44    |FDSE                 |     1|
2default:defaulth px� 
R
%s*synth2:
&|45    |IBUF                 |    19|
2default:defaulth px� 
R
%s*synth2:
&|46    |IBUFDS               |    19|
2default:defaulth px� 
R
%s*synth2:
&|47    |IOBUF                |    20|
2default:defaulth px� 
R
%s*synth2:
&|48    |OBUF                 |    26|
2default:defaulth px� 
R
%s*synth2:
&|49    |OBUFDS               |     2|
2default:defaulth px� 
R
%s*synth2:
&|50    |OBUFT                |     6|
2default:defaulth px� 
R
%s*synth2:
&+------+---------------------+------+
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
�Finished Writing Synthesis Report : Time (s): cpu = 00:00:57 ; elapsed = 00:00:59 . Memory (MB): peak = 2743.402 ; gain = 706.742
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
t
%s
*synth2\
HSynthesis finished with 0 errors, 0 critical warnings and 462 warnings.
2default:defaulth p
x
� 
�
%s
*synth2�
Synthesis Optimization Runtime : Time (s): cpu = 00:00:46 ; elapsed = 00:00:56 . Memory (MB): peak = 2743.402 ; gain = 594.059
2default:defaulth p
x
� 
�
%s
*synth2�
�Synthesis Optimization Complete : Time (s): cpu = 00:00:58 ; elapsed = 00:01:00 . Memory (MB): peak = 2743.402 ; gain = 706.742
2default:defaulth p
x
� 
B
 Translating synthesized netlist
350*projectZ1-571h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2.
Netlist sorting complete. 2default:default2
00:00:002default:default2 
00:00:00.1232default:default2
2743.4022default:default2
0.0002default:defaultZ17-268h px� 
g
-Analyzing %s Unisim elements for replacement
17*netlist2
3632default:defaultZ29-17h px� 
j
2Unisim Transformation completed in %s CPU seconds
28*netlist2
02default:defaultZ29-28h px� 
K
)Preparing netlist for logic optimization
349*projectZ1-570h px� 
v
)Pushed %s inverter(s) to %s load pin(s).
98*opt2
12default:default2
362default:defaultZ31-138h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2.
Netlist sorting complete. 2default:default2
00:00:002default:default2 
00:00:00.0022default:default2
2743.4022default:default2
0.0002default:defaultZ17-268h px� 
�
!Unisim Transformation Summary:
%s111*project2m
Y  A total of 20 instances were transformed.
  IOBUF => IOBUF (IBUF, OBUFT): 20 instances
2default:defaultZ1-111h px� 
h
%Synth Design complete | Checksum: %s
562*	vivadotcl2
af3224af2default:defaultZ4-1430h px� 
U
Releasing license: %s
83*common2
	Synthesis2default:defaultZ17-83h px� 
�
G%s Infos, %s Warnings, %s Critical Warnings and %s Errors encountered.
28*	vivadotcl2
2972default:default2
2752default:default2
02default:default2
02default:defaultZ4-41h px� 
^
%s completed successfully
29*	vivadotcl2 
synth_design2default:defaultZ4-42h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2"
synth_design: 2default:default2
00:01:032default:default2
00:01:122default:default2
2743.4022default:default2
1081.2422default:defaultZ17-268h px� 
�
 The %s '%s' has been generated.
621*common2

checkpoint2default:default2C
/C:/v23.1/FEB_test/FEB_test.runs/synth_1/FEB.dcp2default:defaultZ17-1381h px� 
�
%s4*runtcl2p
\Executing : report_utilization -file FEB_utilization_synth.rpt -pb FEB_utilization_synth.pb
2default:defaulth px� 
�
Exiting %s at %s...
206*common2
Vivado2default:default2,
Wed Oct 11 09:47:36 20232default:defaultZ17-206h px� 


End Record