----------------------------------------------------------------------------------
-- Company: FNAL
-- Engineer: Micol Rigatti <mrigatti@fnal.gov>
-- 
-- Create Date: 07/12/2023 
-- Design Name: FEB.vhd
-- Module Name: FEB - Behavioral
-- Project Name: CRV FEB
-- Target Devices: xc7s50fgga484-2
-- Tool Versions: 2023.1
-- Description: 

----------------------------------------------------------------------------------

LIBRARY ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use IEEE.numeric_std.all;
Library UNISIM;
use UNISIM.vcomponents.all;

use work.Proj_Def.all;
use work.Debug_ILA.all;

entity FEB is
port(
	-- 160 MHz VXO clock
	VXO_P,VXO_N 			: in std_logic;
	-- 100 MHz VXO clock
--	ClkB_P, ClkB_N			: in std_logic;
--	-- AFE Data lines
--	AFE0Dat_P, AFE0Dat_N    : in std_logic_vector(7 downto 0); -- LVDS pairs from an AFE chip (8 channels)
--	AFE1Dat_P, AFE1Dat_N    : in std_logic_vector(7 downto 0);
--	-- AFE Input clocks
--	AFE0Clk_P, AFE0Clk_N    : out std_logic; -- Copy of 80MHz master clock sent to AFE chips
--	AFE1Clk_P, AFE1Clk_N    : out std_logic;
--	-- AFE clock, framing lines
--	AFEDCLK_P, AFEDCLK_N    : in std_logic_vector(1 downto 0); -- Unused in this design 
--	AFE0FCLK_P, AFE0FCLK_N  : in std_logic; -- LVDS pairs of the Frame Clock
--	AFE1FCLK_P, AFE1FCLK_N  : in std_logic; -- LVDS pairs of the Frame Clock
--	-- AFE serial control lines
--	AFEPDn 				    : buffer std_logic_vector(1 downto 0);
--	AFECS 				    : buffer std_logic_vector(1 downto 0);
--	AFERst 				    : buffer std_logic;
--	AFESClk, AFESDI  	    : buffer std_logic;
--	AFESDO 				    : in std_logic;
--	-- DDR3L pins
--	DDR_DATA				: inout std_logic_vector(DATA_WIDTH-1 downto 0);
--	DDR_ADDR				: out std_logic_vector(DDR3L_ADDR-1 downto 0);
--	BA 						: out std_logic_vector(2 downto 0);
--	DDR_CKE	 				: out std_logic_vector(0 downto 0);
--	ODT 					: out std_logic_vector(0 downto 0);
--	CS 						: out std_logic_vector(0 downto 0);
--	DM 						: out std_logic_vector(1 downto 0);
--	RAS,CAS					: out std_logic; 
--	DDR_WE 					: out std_logic;
--	DDR_CLKP,DDR_CLKN 		: out  std_logic_vector(0 downto 0);
--	LDQS_P, LDQS_N 			: inout std_logic;
--	UDQS_P, UDQS_N 			: inout std_logic;
--	DDR_RESET_N 			: out std_logic;
	-- Microcontroller strobes
	CpldRst					: in std_logic;
	CpldCS					: in std_logic;
	uCRd					: in std_logic;  -- On FEB v2 this PIN is routed to a dedicated PIN, so we jumper this to a DBG header (PIN U17)
	uCWr 					: in std_logic;
	-- Microcontroller data and address buses
	uCA 					: in std_logic_vector(11 downto 0);
	uCD 					: inout std_logic_vector(15 downto 0);
	-- Geographic address pins
	GA 						: in std_logic_vector(1 downto 0);
	-- Analog Mux address lines
--	MuxEn 					: buffer std_logic_vector(3 downto 0);
--	Muxad 					: buffer std_logic_vector(1 downto 0);
--	-- Serial DAC control lines
--	DACCS 					: buffer std_logic_vector(2 downto 0);
--	DACClk 					: buffer std_logic;
--	DACDat 					: buffer std_logic;
--	DACLd 					: buffer std_logic;
	-- Chip dependent I/O functions
--	A7,LVDSTX 				: buffer std_logic;
--	GPI0_N,GPI0_P,GPI1  	: in std_logic;
--	-- LED/Flash Gate select line
--	PulseSel 				: buffer std_logic;
--	-- LED pulser/Flash Gate
--	Pulse 					: out std_logic;
--	-- Temperature sensor lines
--	Temp					: inout std_logic_vector(3 downto 0)
	-- Debug header 
	DBG	 					: out std_logic_vector(9 downto 1)
);
end FEB;

architecture behavioural of FEB is

-- Clocks
signal Clk_80MHz			  : std_logic;
signal Clk_100MHz			  : std_logic;	
signal Clk_200MHz			  : std_logic;
signal Clk_560MHz			  : std_logic;
signal SysClk				  : std_logic;   -- 160 Mhz
signal ResetHi         		  : std_logic;

-- Synchronous edge detectors of uC read and write strobes
signal WRDL 				  : std_logic_vector(1 downto 0);
signal RDDL 				  : std_logic_vector(1 downto 0);
signal uWRDL 				  : std_logic_vector(1 downto 0);
signal uRDDL 				  : std_logic_vector(1 downto 0);
signal AddrReg				  : std_logic_vector(11 downto 0);
signal uAddrReg				  : std_logic_vector(11 downto 0);	

-- Trigger logic signals
signal TrigReq		          : std_logic;
signal SlfTrgEn				  : std_logic;
signal BeamOn				  : std_logic;
signal LEDSrc		          : std_logic;
signal uBunch   			  : std_logic_vector(31 downto 0);
signal uBunchWrt			  : std_logic;
-- Trigger and phase detector logic signals 
signal GPO		          	  : std_logic;
signal GPI0		          	  : std_logic;

-- AFE Interface logic signals
signal done		              : std_logic_vector(1 downto 0); 
signal warn		              : std_logic_vector(1 downto 0);
signal dout_AFE0		      : Array_8x14; 
signal dout_AFE1		      : Array_8x14;
signal SerdesRst			  : std_logic_vector(1 downto 0);

-- uController registers signals... 
signal TrgSrc		          : std_logic;
--... for AFE_DataPath
signal PipelineSet 			  : std_logic_vector (7 downto 0);
signal ControllerNo 		  : std_logic_vector (4 downto 0):= "00000";
signal PortNo 				  : std_logic_vector (4 downto 0):= "00000";
signal BeamOnLength 		  : std_logic_vector (11 downto 0) := X"050";
signal BeamOffLength 		  : std_logic_vector (11 downto 0) := X"700";
signal ADCSmplCntReg 		  : std_logic_vector (3 downto 0) := X"8";

-- Histogram signals from AFE_DataPath
signal Diff_Reg				  : Arrays_8x2x14;
signal GateWidth	    	  : Array_2x12;
signal GateReq 				  : std_logic_vector (1 downto 0);

-- Signals between AFE_DataPath and Event Builder
signal MaskReg				  : Array_2x8;
signal BufferRdAdd			  : Array_2x8x10;
signal BufferOut 			  : Array_2x8x16;
-- Signals Event Builder
signal EvBuffRd				  : std_logic;
signal EvBuffOut	          : std_logic_vector(15 downto 0);
signal EvBuffEmpty	          : std_logic;
signal EvBuffWdsUsed          : std_logic_vector(10 downto 0);

signal asp					  : std_logic := '0';

signal TempEn 				  : std_logic;
signal TempCtrl 			  : std_logic_vector(3 downto 0);
signal One_Wire_Out 		  : std_logic_vector(15 downto 0);


signal FMTxBuff_wreq		  : std_logic;

signal iCD				  	  : std_logic_vector(15 downto 0);

-- uController test registers
signal TestCount 			  : std_logic_vector (31 downto 0); -- Make a test counter that increments with each read

-- PLL signals 
signal PLL_locked 			  : std_logic;


attribute mark_debug : string;
attribute mark_debug of uAddrReg: signal is "true";
attribute mark_debug of TestCount: signal is "true";

begin

ResetHi <= not CpldRst;

global_signals_160MHz : process(SysClk, CpldRst)
	begin 
	if CpldRst = '0' then
	WRDL 	<= "00";
	RDDL 	<= "00";
	AddrReg <= (others => '0'); 
	elsif rising_edge (SysClk) then
	-- Synchronous edge detectors for read and write strobes
	WRDL(0) <= not uCWR and not CpldCS;
	WRDL(1) <= WRDL(0);
	RDDL(0) <= not uCRD and not CpldCS;
	RDDL(1) <= RDDL(0);
		if RDDL = 1 or WRDL = 1 
		then AddrReg <= uCA;
		else AddrReg <= AddrReg;
		end if;
	end if;
end process;
	
global_signals_100MHz : process(Clk_100MHz, CpldRst)
	begin 
	if CpldRst = '0' then
	uWRDL 	<= "00"; 
	uRDDL 	<= "00";
	uAddrReg <= (others => '0');
	elsif rising_edge (Clk_100MHz) then
	-- Synchronous edge detectors for read and write strobes
	uWRDL(0) <= not uCWR and not CpldCS;
	uWRDL(1) <= uWRDL(0);	
	uRDDL(0) <= not uCRD and not CpldCS;
	uRDDL(1) <= uRDDL(0);
		if uRDDL = 1 or uWRDL = 1 
		then uAddrReg <= uCA;
		else uAddrReg <= uAddrReg;
		end if;
	end if;
end process;

-- IBUFDS: Differential Input Buffer
-- GPI0DiffIn : IBUFDS
-- generic map (
-- 	DIFF_TERM 	 => TRUE, -- Differential Termination
-- 	IBUF_LOW_PWR => FALSE, -- Low power (TRUE) vs. performance (FALSE) setting for referenced I/O standards
-- 	IOSTANDARD   => "DEFAULT")
-- port map (
-- 	I  => GPI0_P, -- Diff_p buffer input (connect directly to top-level port)
-- 	IB => GPI0_N, -- Diff_n buffer input (connect directly to top-level port)
-- 	O  => GPI0);	  -- Buffer output

PLL :  PLL_0 
port map(
	clk_in1_p	=> VXO_P,
	clk_in1_n	=> VXO_N,
	resetn		=> CpldRst,

	Clk_100MHz	=> Clk_100MHz,
	Clk_200MHz	=> Clk_200MHz, 
	SysClk		=> SysClk,
	locked		=> PLL_locked
);

	
--PLL : SysPLL 
-- port map(
--	clk_in1_p		=> ClkB_P,
--	clk_in1_n		=> ClkB_N,
--	resetn			=> CpldRst,
--					 
--	Clk_80MHz		=> Clk_80MHz,	
--	Clk_100MHz		=> Clk_100MHz,	
--	SysClk   		=> SysClk,  	
--	Clk_200MHz		=> Clk_200MHz	
-- );
--
--HF_PLL : HF_SysPLL 
-- port map(
--	clk_in1			=> Clk_80MHz,				
--	resetn			=> CpldRst,			
-- 
--	Clk_560MHz		=> Clk_560MHz	
-- );

uController_registers : process(Clk_100MHz, CpldRst)
begin 
if CpldRst = '0' then
	TestCount <= (others => '0');
elsif rising_edge (Clk_100MHz) then
-- Testcounter counter is writeable. For each read of the lower half, the entire
-- 32 bit counter increments
	if uWRDL = 1 and  uCA(11 downto 10) = GA and uCA(9 downto 0) = TestCounterHiAd then 
		TestCount <= uCD & TestCount(15 downto 0);
	elsif uWRDL = 1 and  uCA(11 downto 10) = GA and uCA(9 downto 0) = TestCounterLoAd then 
		TestCount <= TestCount(31 downto 16) & uCD;
	elsif uRDDL = 2 and uAddrReg(11 downto 10) = GA and uAddrReg(9 downto 0) = TestCounterLoAd then 
		TestCount <= TestCount + 1;
	else 
		TestCount <= TestCount;
	end if;
end if;
end process;

-- DDR : DDR_test
-- generic map(
-- 	-- DDR3L parameters
-- 	DATA_WIDTH		=> DATA_WIDTH,  -- 16 Both ARTY and FEB
-- 	DDR3L_ADDR		=> DDR3L_ADDR,  -- 14: ARTY 15: FEB
-- 	APP_ADDR		=> APP_ADDR 	-- 28: ARTY 29: FEB
-- )
-- port map(
-- 	Clk_100MHz		=> Clk_100MHz,
-- 	Clk_200MHz		=> Clk_200MHz,
-- 	SysClk			=> SysClk,	
-- 	ResetHi			=> ResetHi,
-- -- DDR3L pins
-- 	DDR_DATA		=> DDR_DATA,	
-- 	DDR_ADDR		=> DDR_ADDR,	
-- 	BA 				=> BA, 			
-- 	DDR_CKE	 		=> DDR_CKE,		
-- 	ODT 			=> ODT, 		
-- 	CS 				=> CS, 			
-- 	DM 				=> DM, 			
-- 	RAS				=> RAS,
-- 	CAS				=> CAS,		
-- 	DDR_WE 			=> DDR_WE, 		
-- 	DDR_CLKP        => DDR_CLKP,
-- 	DDR_CLKN 	    => DDR_CLKN,
-- 	LDQS_P          => LDQS_P,
-- 	LDQS_N 		    => LDQS_N, 	
-- 	UDQS_P          => UDQS_P,
-- 	UDQS_N 		    => UDQS_N, 	 	
-- 	RESET_N			=> DDR_RESET_N,
-- -- Microcontroller strobes
-- 	CpldRst			=> CpldRst,	
-- 	CpldCS			=> CpldCS,	
-- 	uCRd			=> uCRd,
-- 	uCWr 			=> uCWr, 	
-- -- Microcontroller data and address buses	
-- 	uCA 			=> uCA,
-- 	uCD 			=> uCD,
-- -- Geographic address pins
-- 	GA 				=> GA,
-- -- Synchronous edge detectors of uC read and write strobes
-- 	AddrReg			=> AddrReg,
-- 	WRDL 			=> WRDL,
-- 	RDDL			=> RDDL,
-- -- Debug
-- 	DBG	 			=> DBG
-- );



ILA_uC : uC_ILA 
port map(
	clk    	  => Clk_100MHz,-- std_logic;
	probe0(0) => CpldRst, 	-- std_logic_vector(0 downto 0);
    probe1(0) => CpldCS, 	-- std_logic_vector(0 downto 0);
    probe2(0) => uCRd,		-- std_logic_vector(0 downto 0);
    probe3(0) => uCWr,	 	-- std_logic_vector(0 downto 0);
    probe4 	  => uCA,		-- std_logic_vector(11 downto 0);
    probe5 	  => uCD,		-- std_logic_vector(15 downto 0);
    probe6 	  => GA,		-- std_logic_vector(1 downto 0);
	probe7	  => WRDL, 		-- std_logic_vector(1 downto 0);
	probe8 	  => RDDL, 		-- std_logic_vector(1 downto 0);
	probe9    => uWRDL,		-- std_logic_vector(1 downto 0);
	probe10	  => uRDDL 		-- std_logic_vector(1 downto 0)	
);


--AFE_Interface_inst : AFE_Interface
--port map(
--	AFE0Dat_P		=> AFE0Dat_P,
--	AFE0Dat_N       => AFE0Dat_N,
--	AFE1Dat_P       => AFE1Dat_P,
--	AFE1Dat_N       => AFE1Dat_N,
--	AFE0Clk_P       => AFE0Clk_P,
--	AFE0Clk_N       => AFE0Clk_N,
--	AFE1Clk_P       => AFE1Clk_P,
--	AFE1Clk_N       => AFE1Clk_N,
--	
--	AFEDCLK_P       => AFEDCLK_P, -- unused
--	AFEDCLK_N       => AFEDCLK_N, -- unused
--	
--	AFE0FCLK_P      => AFE0FCLK_P,
--	AFE0FCLK_N      => AFE0FCLK_N,
--	AFE1FCLK_P      => AFE1FCLK_P,
--	AFE1FCLK_N      => AFE1FCLK_N,
--	
--	AFEPDn 		    => AFEPDn,
--	AFECS 		    => AFECS,
--	AFERst 		    => AFERst,
--	AFESClk         => AFESClk,
--	AFESDI  	    => AFESDI,
--	AFESDO 		    => AFESDO,
---- FPGA interface
--	Clk_80MHz		=> Clk_80MHz,			  
--	Clk_560MHz		=> Clk_560MHz,			  
--	Clk_200MHz		=> Clk_200MHz,			  
--	reset			=> SerdesRst(0) or SerdesRst(1),				  
--	done			=> done,				  
--	warn			=> warn,				  
--	dout_AFE0		=> dout_AFE0,				  
--	dout_AFE1		=> dout_AFE1
--);
--
--AFE_DataPath_inst : AFE_DataPath
--port map (
--	Clk_80MHz	    => Clk_80MHz,		
--	SysClk			=> SysClk,
--	ResetHi			=> ResetHi,
---- Signals from Trigger Logic
--	TrigReq			=> TrigReq,
--	BeamOn			=> BeamOn,
---- Signals for EventBuilder
--	MaskReg			=> MaskReg,			
--	BufferRdAdd		=> BufferRdAdd,		
--	BufferOut 		=> BufferOut, 		
---- Signals from uC
--	ControllerNo 	=> ControllerNo, 
--	PortNo 			=> PortNo,	
--	BeamOnLength    => BeamOnLength,
--	BeamOffLength   => BeamOffLength, 
--	ADCSmplCntReg   => ADCSmplCntReg,
---- Data output from the deserializer for AFE0 and AFE1 synchronized to 80 MHz clock
--    din_AFE0		=> dout_AFE0,
--    din_AFE1		=> dout_AFE1,
--	done 			=> done,
---- Pipeline signals 	
--	PipelineSet		=> PipelineSet,
---- Histogram signals
--	Diff_Reg		=> Diff_Reg,	
--	GateWidth	    => GateWidth,
--	GateReq 		=> GateReq, 	
---- Microcontroller strobes
--	CpldRst			=> CpldRst,	
--	CpldCS			=> CpldCS,
--	uCRd			=> uCRd,
--	uCWr 			=> uCWr, 	
---- Microcontroller data and address buses	
--	uCA				=> uCA,
--	uCD             => uCD,
---- Geographic address pins
--	GA              => GA 
--);
--
--Phase_Detector_inst: Phase_Detector
--port map(
--	SysClk 			=> SysClk,	-- 160 MHz			    
--	CpldRst			=> CpldRst,				
--	GA 				=> GA,				
--	A7		 		=> A7,			
--	GPI0			=> GPI0,
--	TrgSrc			=> TrgSrc, 					
--	GPO				=> GPO
--);
--
--
--Trigger_logic: Trigger 
--port map(
--  	SysClk			=> SysClk, -- 160 MHz
--	ResetHi  		=> ResetHi,
----Signals to AFE_DataPath
--	TrigReq			=> TrigReq,
--	BeamOn			=> BeamOn,
---- Signals to EVB and DDR
--	uBunch   		=> uBunch,   
--	uBunchWrt		=> uBunchWrt,
--	SlfTrgEn		=> SlfTrgEn,
---- Signal to Phase_Detector
--	GPO				=> GPO,		
---- Microcontroller strobes
--	CpldRst			=> CpldRst,	
--	CpldCS			=> CpldCS,	
--	uCRd			=> uCRd,
--	uCWr 			=> uCWr, 	
---- Microcontroller data and address buses	
--	uCA 			=> uCA,
--	uCD 			=> uCD,
---- Geographic address pins
--	GA 				=> GA,
---- Global signals
--	uWRDL 			=> uWRDL,
--	WRDL 			=> WRDL,
---- Chip out
--	PulseSel 		=> PulseSel, 
--	Pulse 			=> Pulse, 
--	GPI0 			=> GPI0,
---- uC register 
--	LEDSrc 			=> LEDSrc
--
--);
--
--EventBuilder_logic :  EventBuilder
--port map(
--	SysClk			=> SysClk,	 -- 160 MHz
--	CpldRst			=> CpldRst,
--	ResetHi			=> ResetHi,
---- Signals from/to AFE Buffer in AFE_DataPath
--	MaskReg			=> MaskReg,
--	BufferRdAdd		=> BufferRdAdd,	
--	BufferOut 		=> BufferOut, 	
---- Signals from Trigger Logic
--	SlfTrgEn		=> SlfTrgEn,
--	uBunchWrt		=> uBunchWrt,
--	uBunch   		=> uBunch,
---- Signals for the DDR
--	EvBuffRd		=> EvBuffRd,		
--	EvBuffOut		=> EvBuffOut,			
--	EvBuffEmpty		=> EvBuffEmpty,			
--	EvBuffWdsUsed	=> EvBuffWdsUsed,
--	asp 			=> asp
--	);
--
--
--DDR_Interface_inst : DDR_Interface
--generic map(
--	-- DDR3L parameters
--	DATA_WIDTH			=> DATA_WIDTH,  -- 16 Both ARTY and FEB
--	DDR3L_ADDR			=> DDR3L_ADDR,  -- 14: ARTY 15: FEB
--	APP_ADDR			=> APP_ADDR 	-- 28: ARTY 29: FEB
--)
--port map(
--	ClkB_P			=> ClkB_P,	
--	ClkB_N 			=> ClkB_N, 	
--	SysClk			=> SysClk,	
--	ResetHi			=> ResetHi,
--	Clk_80MHz		=> Clk_80MHz,
--	Clk_200MHz		=> Clk_200MHz,
---- DDR3L pins
--	DDR_DATA		=> DDR_DATA,	
--	DDR_ADDR		=> DDR_ADDR,	
--	BA 				=> BA, 			
--	DDR_CKE	 		=> DDR_CKE,		
--	ODT 			=> ODT, 		
--	CS 				=> CS, 			
--	DM 				=> DM, 			
--	RAS				=> RAS,
--	CAS				=> CAS,		
--	DDR_WE 			=> DDR_WE, 		
--	DDR_CLKP        => DDR_CLKP,
--	DDR_CLKN 	    => DDR_CLKN,
--	LDQS_P          => LDQS_P,
--	LDQS_N 		    => LDQS_N, 	
--	UDQS_P          => UDQS_P,
--	UDQS_N 		    => UDQS_N, 		
--	RESET_N			=> DDR_RESET_N,
---- Signals for the DDR	
--	EvBuffRd		=> EvBuffRd,	
--	EvBuffOut		=> EvBuffOut,	
--	EvBuffEmpty		=> EvBuffEmpty,	
--	EvBuffWdsUsed	=> EvBuffWdsUsed,
---- Signals from Trigger Logic
--	SlfTrgEn 		=> SlfTrgEn, 	
--	uBunchWrt		=> uBunchWrt,	
--	uBunch			=> uBunch,		
---- Microcontroller strobes
--	CpldRst			=> CpldRst,	
--	CpldCS			=> CpldCS,	
--	uCRd			=> uCRd,
--	uCWr 			=> uCWr, 	
---- Microcontroller data and address buses	
--	uCA 			=> uCA,
--	uCD 			=> uCD,
---- Geographic address pins
--	GA 				=> GA,
---- Synchronous edge detectors of uC read and write strobes
--	AddrReg			=> AddrReg,
--	WRDL 			=> WRDL,
--	RDDL			=> RDDL
--);
--
---- Read the temperature/ID chip on the four connectoed CMBs
--OneWire : One_Wire 
--port map(
--	reset 			=> CpldRst, 
--	clock 			=> Clk_100MHz,
--	CpldCS 			=> CpldCS, 
--	uCWr 		  	=> uCWr, 
--	GA 				=> GA, 
--	uCA 			=> uCA, 
--	uCD 			=> uCD,
--	Temp 			=> Temp, 
--	TempEn 			=> TempEn, 
--	TempCtrl		=> TempCtrl, 
--	One_Wire_Out 	=> One_Wire_Out
--);
--
--Temp(0) <= '0' when TempEn = '1' and TempCtrl = "0001" else 'Z';
--Temp(1) <= '0' when TempEn = '1' and TempCtrl = "0010" else 'Z';
--Temp(2) <= '0' when TempEn = '1' and TempCtrl = "0100" else 'Z';
--Temp(3) <= '0' when TempEn = '1' and TempCtrl = "1000" else 'Z';
--
--
---- Data written from the uC to the LVDS Tx port
--uC_to_LVDSTX : LVDS_TX
--port map(
--	Clk_100MHz		=> Clk_100MHz,
--	ResetHi			=> ResetHi,
--	FMTxBuff_wreq	=> FMTxBuff_wreq,
---- Microcontroller data and address buses
--	uCA 			=> uCA,
--	uCD 			=> uCD,
---- Microcontroller strobes
--	CpldRst			=> CpldRst,		
--	CpldCS			=> CpldCS,	
--	uCRd			=> uCRd,	
--	uCWr 			=> uCWr, 		
---- Geographic address pins
--	GA 				=> GA,
---- Chip dipendent I/O functions 
--	LVDSTX 			=> LVDSTX,
---- Global signal
--	uWRDL			=> uWRDL
--);
--
--uC : uControllerRegister 
--port map(
--	Clk_100MHz		=> Clk_100MHz,
--	ResetHi			=> ResetHi,
---- AFE serial control lines
--	AFEPDn 			=> AFEPDn,
--	AFECS 			=> AFECS, 	
--	AFESClk         => AFESClk,
--	AFESDI  	    => AFESDI, 
--	AFESDO 			=> AFESDO, 
---- Microcontroller strobes
--	CpldRst			=> CpldRst,	
--	CpldCS			=> CpldCS,	
--	uCRd			=> uCRd,	
--	uCWr 			=> uCWr, 	
---- Microcontroller data and address buses
--	uCA 			=> uCA,
--	uCD 			=> uCD,
---- Geographic address pins
--	GA  			=> GA,
---- Analog Mux address lines
--	MuxEn 			=> MuxEn, 			
--	Muxad 			=> Muxad, 	
---- Serial DAC control lines
--	DACCS 			=> DACCS, 
--	DACClk 			=> DACClk,
--	DACDat 			=> DACDat,
--	DACLd 			=> DACLd, 
---- Global signals   
--	uAddrReg		=> uAddrReg, 
--	uWRDL 			=> uWRDL, 			
--	uRDDL 			=> uRDDL, 
--	done			=> done,
--
--	TrgSrc			=> TrgSrc,			
--	ADCSmplCntReg 	=> ADCSmplCntReg, 	
--	ControllerNo 	=> ControllerNo, 	
--	PortNo 		 	=> PortNo, 		 	
--	FMTxBuff_wreq	=> FMTxBuff_wreq,	
--	PipelineSet		=> PipelineSet
--  );
--
--
--
--Hist : Histogram 
--port map(
--	Clk_80MHz	 	=> Clk_80MHz,
--	Clk_100MHz	 	=> Clk_100MHz,
--	ResetHi	 		=> ResetHi, 
---- Microcontroller strobes
--	CpldRst			=> CpldRst,
---- Microcontroller data and address buses
--	uCA				=> uCA,
--	uCD				=> uCD,
---- Geographic address pins
--	GA				=> GA,
---- Signals from AFE_DataPath
--	Diff_Reg		=> Diff_Reg,	
--	GateWidth	    => GateWidth,
--	GateReq 		=> GateReq,
---- Global Signals
--	uAddrReg		=> uAddrReg,	
--	uWRDL 			=> uWRDL,
--	uRDDL 			=> uRDDL
--  );

with uCA(9 downto 0) select

iCD <= 	-- X"000" & "00" & AFEPDn when CSRRegAddr,
		-- X"000" & "00" & AlignReq when SlipCtrlAd,
		-- X"0" & '0' & SlipCntReg(1)
		--	& X"0" & '0' & SlipCntReg(0) when SlipCntRegAd,
		-- X"00" & WidthReg when GateAddr,
		-- DRAMRdBuffOut when PageFIFOAddr,
		-- X"0" & '0' & DRAMRdBuffWdsUsed when PageFIFOWdsAd,
		-- X"0" & Read_Seq_Stat & X"0" & '0' &  DDRWrtSeqStat when WriteSeqStatAd,
		-- X"00" & PipelineSet when PipeLineAddr,
		-- X"00" & "000" & MuxSelReg & MuxadReg when MuxCtrlAd,
		-- MaskReg(1) & MaskReg(0) when InputMaskAddr,
		-- In_Seq_Stat(1)(7 downto 0) & In_Seq_Stat(0)(7 downto 0) when InseqStatAd,
		-- X"000" & '0' & LEDSrc & PulseSel & FlashEn when FlashCtrlAddr,
		-- UpTimeStage(31 downto 16) when UpTimeRegAddrHi,
		-- UpTimeStage(15 downto 0) when UpTimeRegAddrLo,
		TestCount(31 downto 16) when TestCounterHiAd,
		TestCount(15 downto 0) when TestCounterLoAd,
		-- X"000" & "00" & FMTxBuff_full & FMTxBuff_empty when LVDSTxFIFOStatAd,
		-- X"0" & BeamOnLength when BeamOnLengthAd,
		-- X"0" & BeamOffLength when BeamOffLengthAd,
		-- "0000000" & TurnOnTime when OnTimeAddr,
		-- "0000000" & TurnOffTime when OffTimeAddr,
 		-- "0000000" & LEDTime when LEDTimeAddr,
		-- "00" & SDWrtAd(29 downto 16) when SDRamWrtPtrHiAd,
		-- SDWrtAd(15 downto 0) when SDRamWrtPtrLoAd,
		-- "00" & SDRdAD(29 downto 16) when SDRamRdPtrHiAd,
		-- SDRdAD(15 downto 0) when SDRamRdPtrLoAd,
		-- DDRRd_Mux(7 downto 0) & DDRRd_Mux(15 downto 8) when SDRamSwapPort,
		-- DDRRd_Mux when SDRamPortAd,
		-- AFERdReg when AFERdDataAd,
		-- '0' & DDR_Rd_Cnt & '0' & SDwr_count when DDRCountAddr,
		-- X"0" & '0' & SDrd_empty & SDrd_full & SDcmd_empty(1) & SDcmd_full(1) 
		-- & SDwr_underrun & SDwr_empty & SDwr_full & SDcmd_empty(0) & SDcmd_full(0) 
		-- & SDCalDn & SD_RstO when DDRStatAddr,
		-- HistInterval when HistIntvalAd,
		-- X"00" & '0' & HistEnReq(1) & HistEnReq(0) & HistMode & '0' & HistChan when HistCtrlAd,
 		-- X"0" & std_logic_vector(Hist_Offset_Reg) when HistOfstAd,
		-- X"0" & '0' & HistAddrb(0) when HistPtrAd0,
		-- X"0" & '0' & HistAddrb(1) when HistPtrAd1,
		-- Hist_Outb(0) when HistRd0Ad,
		-- Hist_Outb(1) when HistRd1Ad,
		-- GA & "00" & X"001" when DebugVersionAd,
		-- X"0" & std_logic_vector(Ped_Reg(0)(0)) when PedRegAddr(0)(0),
		-- X"0" & std_logic_vector(Ped_Reg(0)(1)) when PedRegAddr(0)(1),
		-- X"0" & std_logic_vector(Ped_Reg(0)(2)) when PedRegAddr(0)(2),
		-- X"0" & std_logic_vector(Ped_Reg(0)(3)) when PedRegAddr(0)(3),
		-- X"0" & std_logic_vector(Ped_Reg(0)(4)) when PedRegAddr(0)(4),
		-- X"0" & std_logic_vector(Ped_Reg(0)(5)) when PedRegAddr(0)(5),
		-- X"0" & std_logic_vector(Ped_Reg(0)(6)) when PedRegAddr(0)(6),
		-- X"0" & std_logic_vector(Ped_Reg(0)(7)) when PedRegAddr(0)(7),
		-- X"0" & std_logic_vector(Ped_Reg(1)(0)) when PedRegAddr(1)(0),
		-- X"0" & std_logic_vector(Ped_Reg(1)(1)) when PedRegAddr(1)(1),
		-- X"0" & std_logic_vector(Ped_Reg(1)(2)) when PedRegAddr(1)(2),
		-- X"0" & std_logic_vector(Ped_Reg(1)(3)) when PedRegAddr(1)(3),
		-- X"0" & std_logic_vector(Ped_Reg(1)(4)) when PedRegAddr(1)(4),
		-- X"0" & std_logic_vector(Ped_Reg(1)(5)) when PedRegAddr(1)(5),
		-- X"0" & std_logic_vector(Ped_Reg(1)(6)) when PedRegAddr(1)(6),
		-- X"0" & std_logic_vector(Ped_Reg(1)(7)) when PedRegAddr(1)(7),
		-- X"0" & std_logic_vector(IntTrgThresh(0)(0)) when ThreshRegAddr(0)(0),
		-- X"0" & std_logic_vector(IntTrgThresh(0)(1)) when ThreshRegAddr(0)(1),
		-- X"0" & std_logic_vector(IntTrgThresh(0)(2)) when ThreshRegAddr(0)(2),
		-- X"0" & std_logic_vector(IntTrgThresh(0)(3)) when ThreshRegAddr(0)(3),
		-- X"0" & std_logic_vector(IntTrgThresh(0)(4)) when ThreshRegAddr(0)(4),
		-- X"0" & std_logic_vector(IntTrgThresh(0)(5)) when ThreshRegAddr(0)(5),
		-- X"0" & std_logic_vector(IntTrgThresh(0)(6)) when ThreshRegAddr(0)(6),
		-- X"0" & std_logic_vector(IntTrgThresh(0)(7)) when ThreshRegAddr(0)(7),
		-- X"0" & std_logic_vector(IntTrgThresh(1)(0)) when ThreshRegAddr(1)(0),
		-- X"0" & std_logic_vector(IntTrgThresh(1)(1)) when ThreshRegAddr(1)(1),
		-- X"0" & std_logic_vector(IntTrgThresh(1)(2)) when ThreshRegAddr(1)(2),
		-- X"0" & std_logic_vector(IntTrgThresh(1)(3)) when ThreshRegAddr(1)(3),
		-- X"0" & std_logic_vector(IntTrgThresh(1)(4)) when ThreshRegAddr(1)(4),
		-- X"0" & std_logic_vector(IntTrgThresh(1)(5)) when ThreshRegAddr(1)(5),
		-- X"0" & std_logic_vector(IntTrgThresh(1)(6)) when ThreshRegAddr(1)(6),
		-- X"0" & std_logic_vector(IntTrgThresh(1)(7)) when ThreshRegAddr(1)(7),
		-- X"000" & "00" & TrgSrc & '0' when TrigCtrlAddr,
		-- X"000" & ADCSmplCntReg when ADCSmplCntrAd,
		-- X"000" &"00" & SlfTrgEn & TmgSrcSel when IntTrgEnAddr,
		-- "000" & ControllerNo & "000" & PortNo when FEBAddresRegAd,
		-- "00" & FRDat(0) & "00" & FRDat2(0) when FRDat0RegAd,
		-- "00" & FRDat(1) & "00" & FRDat2(1) when FRDat1RegAd,
		-- uBunch(15 downto  0)        when uBLoAd,
		-- uBunch(31 downto 16)        when uBHiAd,
		-- uBunchBuffOut(15 downto  0) when uBBuffLoAd,
		-- uBunchBuffOut(31 downto 16) when uBBuffHiAd,
		-- DDRAddrOut(15 downto  0)    when uBBuffAdLoAd,
		-- DDRAddrOut(31 downto 16)    when uBBuffAdHiAd,
		 X"0000" when others;

-- Select between DAC readback and the rest of the registers
uCD <= iCD when uCRd = '0' and CpldCS = '0' and uCA(11 downto 10) = GA 
   and (uCA(9 downto 0) < DatArray0Min or uCA(9 downto 0) > CtrlArray2Max)
	and (uCA(9 downto 0) < OneWireCmdAd or uCA(9 downto 0) > TempDat4Ad)
	and uCA(9 downto 0) /= PageStatAddr
-- else ShadowOut when uCRd = '0' and CpldCS = '0' and uCA(11 downto 10) = GA 
--    and uCA(9 downto 0) >= DatArray0Min and uCA(9 downto 0) <= CtrlArray2Max
-- else One_Wire_Out when uCRd = '0' and CpldCS = '0' and uCA(11 downto 10) = GA 
--    and uCA(9 downto 0) >= OneWireCmdAd and uCA(9 downto 0) <= TempDat4Ad
-- Contrive to to show status bits from 4 FPGAs with a read from a single address.
-- else 'Z'&'Z'&'Z'&'Z'&'Z'&'Z'&'Z'&'Z'&'Z'&'Z'&'Z'& DRAMRdBuffEmpty &'Z'&'Z'&'Z'  
-- 		& PageRdStat when uCRd = '0' and CpldCS = '0' and GA = "00" and uCA(9 downto 0) = PageStatAddr
-- else 'Z'&'Z'&'Z'&'Z'&'Z'&'Z'&'Z'&'Z'&'Z'&'Z'& DRAMRdBuffEmpty &'Z'&'Z'&'Z'
-- 	   & PageRdStat &'Z' when uCRd = '0' and CpldCS = '0' and GA = "01" and uCA(9 downto 0) = PageStatAddr 
-- else 'Z'&'Z'&'Z'&'Z'&'Z'&'Z'&'Z'&'Z'&'Z'& DRAMRdBuffEmpty &'Z'&'Z'&'Z'
-- 		& PageRdStat &'Z'&'Z' when uCRd = '0' and CpldCS = '0' and GA = "10" and uCA(9 downto 0) = PageStatAddr 
-- else 'Z'&'Z'&'Z'&'Z'&'Z'&'Z'&'Z'&'Z'& DRAMRdBuffEmpty &'Z'&'Z'&'Z'
-- 		& PageRdStat &'Z'&'Z'&'Z' when uCRd = '0' and CpldCS = '0' and GA = "11" and uCA(9 downto 0) = PageStatAddr 
else (others => 'Z');

end behavioural;
