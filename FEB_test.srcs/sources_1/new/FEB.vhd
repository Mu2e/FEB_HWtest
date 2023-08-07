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
	VXO_P, VXO_N			: in std_logic;
	-- 100 MHz VXO clock
--	ClkB_P, ClkB_N			: in std_logic;
	-- AFE Data lines
	AFE0Dat_P   			: in std_logic_vector(7 downto 0); -- LVDS pairs from an AFE chip (8 channels)
	AFE0Dat_N    			: in std_logic_vector(7 downto 0); 
	AFE1Dat_P 				: in std_logic_vector(7 downto 0);
	AFE1Dat_N    			: in std_logic_vector(7 downto 0);
	-- AFE Input clocks
	AFE0Clk_P, AFE0Clk_N	: out std_logic; -- Copy of 80MHz master clock sent to AFE chips
	AFE1Clk_P, AFE1Clk_N    : out std_logic;
	-- AFE clock, framing lines
	AFEDCLK_P, AFEDCLK_N	: in std_logic_vector(1 downto 0); -- Unused in this design 
	AFE0FCLK_P, AFE0FCLK_N	: in std_logic; -- LVDS pairs of the Frame Clock
	AFE1FCLK_P, AFE1FCLK_N	: in std_logic; -- LVDS pairs of the Frame Clock
	-- AFE serial control lines
	AFEPDn 				    : buffer std_logic_vector(1 downto 0);
	AFECS 				    : buffer std_logic_vector(1 downto 0);
	AFERst 				    : buffer std_logic;
	AFESClk, AFESDI  	    : buffer std_logic;
	AFESDO 				    : in std_logic;
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
	MuxEn 					: out std_logic_vector(3 downto 0);
	Muxad 					: out std_logic_vector(1 downto 0);
	-- Serial DAC control lines
	DACCS 					: buffer std_logic_vector(2 downto 0);
	DACClk 					: buffer std_logic;
	DACDat 					: buffer std_logic;
	DACLd 					: buffer std_logic;
	-- Chip dependent I/O functions
	A7						: out std_logic;
	LVDSTX 					: out std_logic;
	GPI0_N					: in std_logic;
	GPI0_P					: in std_logic;
	GPI1  					: in std_logic;
	-- LED/Flash Gate select line
	PulseSel 				: out std_logic;
	-- LED pulser/Flash Gate
	Pulse 					: out std_logic;
	-- Temperature sensor lines
	Temp					: inout std_logic_vector(3 downto 0);
	-- Debug header 
	DBG	 					: inout std_logic_vector(9 downto 1)
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

-- PLL signals 
signal PLL_locked 			  : std_logic;
signal HFPLL_locked	 		  : std_logic;			

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


signal TempCtrl 			  : std_logic_vector(3 downto 0);
signal One_Wire_Out 		  : std_logic_vector(15 downto 0);


signal FMTxBuff_wreq		  : std_logic;

-- uController status registers (are values read back by the uC)
signal iCD				  	  : std_logic_vector(15 downto 0);
signal MuxSelReg           	  : std_logic_vector(2 downto 0);
signal MuxadReg            	  : std_logic_vector(1 downto 0);  
signal FlashEn  			  : std_logic; 
signal FMTxBuff_empty 		  : std_logic;
signal FMTxBuff_full  		  : std_logic;

attribute mark_debug : string;
attribute mark_debug of uAddrReg: signal is "false";


begin

ResetHi <= not CpldRst;

-- Global signals used to syncronize with the uC read/write requests
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
GPI0DiffIn : IBUFDS
generic map (
	DIFF_TERM 	 => TRUE, -- Differential Termination
	IBUF_LOW_PWR => FALSE, -- Low power (TRUE) vs. performance (FALSE) setting for referenced I/O standards
	IOSTANDARD   => "DEFAULT")
port map (
	I  => GPI0_P, -- Diff_p buffer input (connect directly to top-level port)
	IB => GPI0_N, -- Diff_n buffer input (connect directly to top-level port)
	O  => GPI0);  -- Buffer output

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

HF_PLL : PLL_AFE 
port map(
	clk_in1		=> SysClk,
	resetn		=> CpldRst,

	Clk_80MHz	=> Clk_80MHz,
	Clk_560MHz	=> Clk_560MHz,
	locked		=> HFPLL_locked
);



ADC_Mux : Mux
port map(
    Clk_100MHz		=> Clk_100MHz,
-- Microcontroller strobes
    CpldRst			=> CpldRst,	
-- Microcontroller data and address buses	
    uCA 			=> uCA,
    uCD 			=> uCD,
-- Geographic address pins
    GA 				=> GA,
-- Synchronous edge detectors of uC read and write strobes
    uWRDL 			=> uWRDL,
-- Analog Mux address lines
    MuxEn           => MuxEn, 
    Muxad           => Muxad,
-- uController status registers
    MuxSelReg       => MuxSelReg,
    MuxadReg        => MuxadReg         
);




AFE : AFE_Interface
port map(
	AFE0Dat_P		=> AFE0Dat_P,
	AFE0Dat_N       => AFE0Dat_N,
	AFE1Dat_P       => AFE1Dat_P,
	AFE1Dat_N       => AFE1Dat_N,
	AFE0Clk_P       => AFE0Clk_P,
	AFE0Clk_N       => AFE0Clk_N,
	AFE1Clk_P       => AFE1Clk_P,
	AFE1Clk_N       => AFE1Clk_N,
	
	AFEDCLK_P       => AFEDCLK_P, -- unused
	AFEDCLK_N       => AFEDCLK_N, -- unused
	
	AFE0FCLK_P      => AFE0FCLK_P,
	AFE0FCLK_N      => AFE0FCLK_N,
	AFE1FCLK_P      => AFE1FCLK_P,
	AFE1FCLK_N      => AFE1FCLK_N,
	
	AFEPDn 		    => AFEPDn,
	AFECS 		    => AFECS,
	AFERst 		    => AFERst,
	AFESClk         => AFESClk,
	AFESDI  	    => AFESDI,
	AFESDO 		    => AFESDO,
-- FPGA interface
	Clk_80MHz		=> Clk_80MHz,			  
	Clk_560MHz		=> Clk_560MHz,			  
	Clk_200MHz		=> Clk_200MHz,			  
	reset			=> SerdesRst(0) or SerdesRst(1),				  
	done			=> done,				  
	warn			=> warn,				  
	dout_AFE0		=> dout_AFE0,				  
	dout_AFE1		=> dout_AFE1
);

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

Phase_Detector_inst: Phase_Detector
port map(
	SysClk 			=> SysClk,	-- 160 MHz			    
	CpldRst			=> CpldRst,				
	GA 				=> GA,				
	A7		 		=> A7,			
	GPI0			=> GPI0,
	TrgSrc			=> TrgSrc, 					
	GPO				=> GPO
);


Trigger_logic: Trigger 
port map(
  	SysClk			=> SysClk, -- 160 MHz
	ResetHi  		=> ResetHi,
--Signals to AFE_DataPath
	TrigReq			=> TrigReq,
	BeamOn			=> BeamOn,
-- Signals to EVB and DDR
	uBunch   		=> uBunch,   
	uBunchWrt		=> uBunchWrt,
	SlfTrgEn		=> SlfTrgEn,
-- Signal to Phase_Detector
	GPO				=> GPO,		
-- Microcontroller strobes
	CpldRst			=> CpldRst,	
	CpldCS			=> CpldCS,	
	uCRd			=> uCRd,
	uCWr 			=> uCWr, 	
-- Microcontroller data and address buses	
	uCA 			=> uCA,
	uCD 			=> uCD,
-- Geographic address pins
	GA 				=> GA,
-- Synchronous edge detectors of uC read and write strobes
	WRDL 			=> WRDL,
-- Chip out
	PulseSel 		=> PulseSel, 
	Pulse 			=> Pulse, 
	GPI0 			=> GPI0,
	LEDSrc 			=> LEDSrc,
-- uController status registers
	FlashEn  		=> FlashEn
);

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

-- Read the temperature/ID chip on the four connectoed CMBs
OneWire : One_Wire 
port map(
	reset 			=> CpldRst, 
	clock 			=> Clk_100MHz,
	-- Microcontroller data and address buses	
	uCA 			=> uCA,
	uCD 			=> uCD,
	-- Geographic address pins
	GA 				=> GA,
	-- Synchronous edge detectors of uC read and write strobes
	WRDL 			=> WRDL,
	-- inout/buffer  
	Temp 			=> Temp, 
	One_Wire_Out 	=> One_Wire_Out
);


-- Data written from the uC to the LVDS Tx port
uC_to_LVDSTX : LVDS_TX
port map(
	Clk_100MHz		=> Clk_100MHz,
	CpldRst			=> CpldRst,	
	ResetHi			=> ResetHi,
	-- Microcontroller data and address buses
	uCA 			=> uCA,
	uCD 			=> uCD,
	-- Geographic address pins
	GA 				=> GA,
	-- Synchronous edge detectors of uC read and write strobes
	uWRDL 			=> uWRDL,
	-- Chip dipendent I/O functions 
	LVDSTX 			=> LVDSTX,
	-- uController status registers
	FMTxBuff_full	=> FMTxBuff_full,
	FMTxBuff_empty	=> FMTxBuff_empty
);

uControllerRegister : uController_interface 
port map(
	Clk_100MHz		=> Clk_100MHz,
	-- Microcontroller strobes
	CpldRst			=> CpldRst,	
	-- Microcontroller data and address buses
	uCA 			=> uCA,
	uCD 			=> uCD,
	-- Geographic address pins
	GA  			=> GA,
	-- Synchronous edge detectors of uC read and write strobes
	uWRDL 			=> uWRDL, 			
	uRDDL 			=> uRDDL,
	uAddrReg		=> uAddrReg,

	iCD 			=> iCD,
	-- ADC Mux
	MuxSelReg		=> MuxSelReg,
	MuxadReg 		=> MuxadReg,
	-- Trigger
	FlashEn  		=> FlashEn, 	         
	PulseSel 		=> PulseSel,
	LEDSrc			=> LEDSrc,
	-- LVDS logic
	FMTxBuff_full	=> FMTxBuff_full,
	FMTxBuff_empty	=> FMTxBuff_empty	
	
  );
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



-- Select between DAC readback and the rest of the registers
uCD <= iCD when uCRd = '0' and CpldCS = '0' and uCA(11 downto 10) = GA 
   and (uCA(9 downto 0) < DatArray0Min or uCA(9 downto 0) > CtrlArray2Max)
	and (uCA(9 downto 0) < OneWireCmdAd or uCA(9 downto 0) > TempDat4Ad)
	and uCA(9 downto 0) /= PageStatAddr
-- else ShadowOut when uCRd = '0' and CpldCS = '0' and uCA(11 downto 10) = GA 
--    and uCA(9 downto 0) >= DatArray0Min and uCA(9 downto 0) <= CtrlArray2Max
 else One_Wire_Out when uCRd = '0' and CpldCS = '0' and uCA(11 downto 10) = GA 
    and uCA(9 downto 0) >= OneWireCmdAd and uCA(9 downto 0) <= TempDat4Ad
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


end behavioural;
