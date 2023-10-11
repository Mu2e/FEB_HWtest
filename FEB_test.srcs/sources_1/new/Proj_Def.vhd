----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09/09/2022 09:17:56 AM
-- Design Name: 
-- Module Name: Proj_Def - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

package Proj_Def is


	constant DATA_WIDTH			: integer := 16;  -- 16 Both ARTY and FEB
	constant DDR3L_ADDR			: integer := 15;  -- 14: ARTY 15: FEB
	constant APP_ADDR			: integer := 29;  -- 28: ARTY 29: FEB

    constant afe_data_bit_width_idelay_taps: integer := 12;

	-- Define Arrays in terms of their size
	
	-- Use this to deal with (0 downto 0)
	Type Array_2x1 is Array(0 to 1) of std_logic_vector (0 downto 0);
	
	Type Array_2x2 is Array(0 to 1) of std_logic_vector(1 downto 0);
	Type Array_2x3 is Array(0 to 1) of std_logic_vector (2 downto 0);
	Type Array_2x4 is Array(0 to 1) of std_logic_vector(3 downto 0);
	Type Array_2x5 is Array(0 to 1) of std_logic_vector(4 downto 0);
	Type Array_2x6 is Array(0 to 1) of std_logic_vector(5 downto 0);
	Type Array_2x7 is Array(0 to 1) of std_logic_vector(6 downto 0);
	Type Array_2x8 is Array(0 to 1) of std_logic_vector(7 downto 0);
	Type Array_2x9 is Array(0 to 1) of std_logic_vector(8 downto 0);
	Type Array_2x10 is Array(0 to 1) of std_logic_vector(9 downto 0); 
	Type Array_2x11 is Array(0 to 1) of std_logic_vector(10 downto 0); 
	Type Array_2x12 is Array(0 to 1) of std_logic_vector(11 downto 0);
	Type Array_2x14 is Array(0 to 1) of std_logic_vector(13 downto 0);
	Type Array_2x16 is Array(0 to 1) of std_logic_vector(15 downto 0); 
	Type Array_2x32 is Array(0 to 1) of std_logic_vector(31 downto 0); 
	
	Type Array_5x9 is Array (0 to 4) of std_logic_vector(8 downto 0);
	
	Type Array_8x2 is Array(0 to 7) of std_logic_vector(1 downto 0); 
	Type Array_8x4 is Array(0 to 7) of std_logic_vector(3 downto 0);
	Type Array_8x6 is Array(0 to 7) of std_logic_vector(5 downto 0);
	Type Array_8x8 is Array(0 to 7) of std_logic_vector(7 downto 0);
	Type Array_8x10 is Array(0 to 7) of std_logic_vector(9 downto 0);
	Type Array_8x12 is Array(0 to 7) of std_logic_vector(11 downto 0);
	Type Array_8x14 is Array(0 to 7) of std_logic_vector(13 downto 0);
	Type Array_8x16 is Array(0 to 7) of std_logic_vector(15 downto 0);
	
	Type Array_2x8x2 is Array(0 to 1) of Array_8x2;
	Type Array_2x8x4 is Array(0 to 1) of Array_8x4;
	Type Array_2x8x8 is Array(0 to 1) of Array_8x8;
	Type Array_2x8x10 is Array(0 to 1) of Array_8x10;
	Type Array_2x8x12 is Array(0 to 1) of Array_8x12;
	Type Array_2x8x14 is Array(0 to 1) of Array_8x14;
	Type Array_2x8x16 is Array(0 to 1) of Array_8x16;
	
	-- Signed arrays
	Type Arrays_3x12 is Array(0 to 2) of signed(11 downto 0);
	Type Arrays_3x14 is Array(0 to 2) of signed(13 downto 0);
	Type Arrays_8x12 is Array(0 to 7) of signed(11 downto 0);
	Type Arrays_8x14 is Array(0 to 7) of signed(13 downto 0);
	Type Arrays_8x16 is Array(0 to 7) of signed(15 downto 0);
	Type Arrays_2x3x12 is Array(0 to 1) of Arrays_3x12;
	Type Arrays_2x3x14 is Array(0 to 1) of Arrays_3x14;
	Type Arrays_8x2x12 is Array(0 to 1) of Arrays_8x12;
	Type Arrays_8x2x14 is Array(0 to 1) of Arrays_8x14;
	Type Arrays_8x2x16 is Array(0 to 1) of Arrays_8x16;


	Type PtrArrayType is Array(0 to 15) of std_logic_vector(3 downto 0);
	constant ChanArray : PtrArrayType := (X"0",X"1",X"2",X"3",X"4",X"5",X"6",X"7",
										  X"8",X"9",X"A",X"B",X"C",X"D",X"E",X"F");

----------------------------- Type Defs -------------------------------
-- Inter-module link FM serializer and deserializer type declarations

	Type TxOutRec is record
		FM,Done : std_logic;
		end record;

	Type RxInRec is record
		FM,Clr_Err : std_logic;
	end record;

	Type RxOutRec is record
		Done,Parity_Err : std_logic;
	end record;
	
-- TClk FM serializer and deserializer type declarations
	Type TClkTxInRec is record
			En : std_logic;
			Data : std_logic_vector(7 downto 0);
	end record;
	
	Type TClkTxOutRec is record
			FM,Done : std_logic;
		end record;
	
	Type TClkRxInRec is record
			FM,Clr_Err : std_logic;
	end record;
	
	Type  TClkRxOutRec is record
			Done,Parity_Err : std_logic;
			Data : std_logic_vector(7 downto 0);
	end record;
----------------------- Address list -----------------------------

Subtype AddrPtr is std_logic_vector(9 downto 0);

-- Control and status register
constant CSRRegAddr : AddrPtr  := "00" & X"00";
-- SDRAM related pointers are 30 bit byte address pointers
-- Given the 32 bit wide data I/O registers of the LPDDR interface
-- the lower order two bits should be zero.
-- LPDDR write address register
constant SDRamWrtPtrHiAd : AddrPtr := "00" & X"02";
constant SDRamWrtPtrLoAd : AddrPtr := "00" & X"03";

-- LPDDR read address register
constant SDRamRdPtrHiAd	: AddrPtr := "00" & X"04";
constant SDRamRdPtrLoAd	: AddrPtr := "00" & X"05";

-- Port for microcontroller read/write of SDRAM data
constant SDRamSwapPort : AddrPtr := "00" & X"06";
constant SDRamPortAd : AddrPtr := "00" & X"07";

-- DDR status bits, read and write counter
constant DDRStatAddr : AddrPtr := "00" & X"08";
constant DDRCountAddr : AddrPtr := "00" & X"09";

-- LVDS FEB to Controller link transmit address
constant LVDSTxFIFOAd : AddrPtr := "00" & X"0A";
constant LVDSTxFIFOStatAd : AddrPtr := "00" & X"0B";

-- DDR read event data FIFO, evant FIFO words used
constant PageFIFOAddr : AddrPtr := "00" & X"0C";
constant PageFIFOWdsAd : AddrPtr := "00" & X"0D";

-- Three bits showing the state of the DDR write sequencer
constant WriteSeqStatAd : AddrPtr := "00" & X"0E";
constant InseqStatAd : AddrPtr := "00" & X"0F";

-- Histogramming logic parameter adresses
constant HistCtrlAd   : AddrPtr := "00" & X"10";
constant HistIntvalAd : AddrPtr := "00" & X"11";
constant HistOfstAd : AddrPtr := "00" & X"12";
constant HistPtrAd0  : AddrPtr := "00" & X"14";
constant HistPtrAd1  : AddrPtr := "00" & X"15";
constant HistRd0Ad   : AddrPtr := "00" & X"16";
constant HistRd1Ad   : AddrPtr := "00" & X"17";

-- Address for controlling analog mux used for I/V curve data
constant MuxCtrlAd : AddrPtr  := "00" & X"20";
-- Specify which channels to read out
constant InputMaskAddr	: AddrPtr := "00" & X"21";
-- Counter used to produce sequential data as a diagnostic
constant TestCounterHiAd : AddrPtr := "00" & X"22";
constant TestCounterLoAd : AddrPtr := "00" & X"23";

-- Registers used for one wire link to the DS18B20 temperature sensor
constant OneWireCmdAd : AddrPtr := "00" & X"24";
constant TempCtrlAd : AddrPtr := "00" & X"25";

constant TempDat0Ad : AddrPtr := "00" & X"26";
constant TempDat1Ad : AddrPtr := "00" & X"27";
constant TempDat2Ad : AddrPtr := "00" & X"28";
constant TempDat3Ad : AddrPtr := "00" & X"29";
constant TempDat4Ad : AddrPtr := "00" & X"2A";

-- AFE Fifo emplty flags
constant AFEFifoStatAd : AddrPtr := "00" & X"2F";

-- SiPM Bias Trim DAC addresses
constant DatArray0Min : AddrPtr  := "00" & X"30";
constant DatArray0Max : AddrPtr  := "00" & X"37";
constant DatArray1Min : AddrPtr  := "00" & X"38";
constant DatArray1Max : AddrPtr  := "00" & X"3F";
constant DatArray2Min : AddrPtr  := "00" & X"40";
constant DatArray2Max : AddrPtr  := "00" & X"47";

constant CtrlArray0Min : AddrPtr := "00" & X"48";
constant CtrlArray0Max : AddrPtr := "00" & X"4F";
constant CtrlArray1Min : AddrPtr := "00" & X"50";
constant CtrlArray1Max : AddrPtr := "00" & X"57";
constant CtrlArray2Min : AddrPtr := "00" & X"58";
constant CtrlArray2Max : AddrPtr := "00" & X"5F";

--Clock alignment slip control registers
constant SlipCtrlAd   : AddrPtr := "00" & X"61";
constant SlipCntRegAd : AddrPtr := "00" & X"62";
constant AlignEnAd    : AddrPtr := "00" & X"63";

--uBunch debugging
constant uBHiAd       : AddrPtr := "00" & X"64";
constant uBLoAd       : AddrPtr := "00" & X"65";
constant uBBuffHiAd   : AddrPtr := "00" & X"66";
constant uBBuffLoAd   : AddrPtr := "00" & X"67";
constant uBBuffAdHiAd : AddrPtr := "00" & X"68";
constant uBBuffAdLoAd : AddrPtr := "00" & X"69";

-- Spill word count
-- One second timer reset at FPGA config
constant UpTimeRegAddrHi : AddrPtr := "00" & X"6C";
constant UpTimeRegAddrLo : AddrPtr := "00" & X"6D";
-- Diagnostic access to timestamp register
constant TimeStampAdHi : AddrPtr := "00" & X"72";
constant TimeStampAdLo : AddrPtr := "00" & X"73";

-- Simon Debug
constant FRDat0RegAd : AddrPtr := "00" & X"74";
constant FRDat1RegAd : AddrPtr := "00" & X"75";
constant DebugVersionAd : AddrPtr := "00" & X"76";
constant PageRstAddr : AddrPtr := "00" & X"77";
-- Spill indicator

Type AddrArrayType is Array(0 to 7) of AddrPtr;
Type RegArrayType is Array(0 to 1) of AddrArrayType;
constant PedRegAddr : RegArrayType := (("00" & X"80","00" & X"81","00" & X"82","00" & X"83",
													 "00" & X"84","00" & X"85","00" & X"86","00" & X"87"),
													("00" & X"88","00" & X"89","00" & X"8A","00" & X"8B",
													 "00" & X"8C","00" & X"8D","00" & X"8E","00" & X"8F"));
constant ThreshRegAddr : RegArrayType := (("00" & X"90","00" & X"91","00" & X"92","00" & X"93",
														 "00" & X"94","00" & X"95","00" & X"96","00" & X"97"),
													   ("00" & X"98","00" & X"99","00" & X"9A","00" & X"9B",
														 "00" & X"9C","00" & X"9D","00" & X"9E","00" & X"9F"));
-- Register collecting data returned for the AFEs
constant AFERdDataAd : AddrPtr  := "00" & X"FF";
-- Map of the internal setup registers of the AFE chips
constant AFE0ArrayMin : AddrPtr  := "01" & X"00";
constant AFE0ArrayMax : AddrPtr  := "01" & X"66";
constant AFE1ArrayMin : AddrPtr  := "10" & X"00";
constant AFE1ArrayMax : AddrPtr  := "10" & X"66";

--constant PageSize : std_logic_vector (15 downto 0) := X"01FE";
constant PageSize : std_logic_vector (15 downto 0) := X"FFFF";



-- Timing constants assuming 160 MHz clock
-- 1us timer
constant Count1us : std_logic_vector (7 downto 0) := X"63"; -- 99 D
-- 10us timer
constant Count10us : std_logic_vector (10 downto 0) := "011" & X"E7"; -- 999 (10us)
-- 1msec timer
constant Count1ms : std_logic_vector (17 downto 0) := "01" & X"869F"; -- 99999 (1ms)
-- 1Second timer
constant Count1s : std_logic_vector (27 downto 0) := X"5F5E0FF"; -- 99,999,999 Decimal


---------------------- Broadcast addresses ------------------------------
	
-- Flash gate control register
constant FlashCtrlAddr : AddrPtr := "11" & X"00";
-- Flash gate on time and off time
constant OnTimeAddr  : AddrPtr := "11" & X"01";
constant OffTimeAddr : AddrPtr := "11" & X"02";

-- Trigger control register
constant TrigCtrlAddr : AddrPtr := "11" & X"03";

-- Adjutable pipeline attached to serdes outpus
constant PipeLineAddr	: AddrPtr := "11" & X"04";
-- Adjustable gate used for use in the test beam
constant BeamOnLengthAd  : AddrPtr := "11" & X"05";
constant BeamOffLengthAd : AddrPtr := "11" & X"06";

constant GateAddr	: AddrPtr := "11" & X"07";
-- Adjust such that controller and FEB time stamps match
constant CoarseInitRegAddr : AddrPtr  := "11" & X"0A";
-- Adjust such that pulser trigs from the controller are in time
constant PlsrTrgDlyRegAd : AddrPtr  := "11" & X"0B"; 
-- TCLK start spill event register
constant ADCSmplCntrAd : AddrPtr := "11" & X"0C";
constant uBunchWidthAd : AddrPtr := "11" & X"0D";

constant Inttrgenaddr : AddrPtr := "11" & X"0E";

constant BrdCstRdPtrHiAd : AddrPtr := "11" & X"10";
constant BrdCstRdPtrLoAd : AddrPtr := "11" & X"11";

constant uBunchRdPtrHiAd : AddrPtr := "11" & X"12";
constant uBunchRdPtrLoAd : AddrPtr := "11" & X"13";

constant FEBAddresRegAd      : AddrPtr := "11" & X"14";
constant HistCtrlBroadCastAd : AddrPtr := "11" & X"15";
constant CSRBroadCastAd : AddrPtr := "11" & X"16";
constant PageStatAddr : AddrPtr := "11" & X"17";
constant LEDTimeAddr : AddrPtr := "11" & X"18";

constant BrdCstAlgnReqAd : AddrPtr := "11" & X"19";

----------------------------------------------------------------------

component AFE_Interface
port(
	-- AFE Input clocks
	AFE0Clk_P, AFE0Clk_N    : out std_logic; -- Copy of 80MHz master clock sent to AFE chips
	AFE1Clk_P, AFE1Clk_N    : out std_logic;
	-- AFE Data lines
	AFE0Dat_P, AFE0Dat_N    : in std_logic_vector(7 downto 0); -- LVDS pairs from an AFE chip (8 channels)
	AFE1Dat_P, AFE1Dat_N    : in std_logic_vector(7 downto 0);
	-- AFE clock, framing lines
	AFEDCLK_P, AFEDCLK_N    : in std_logic_vector(1 downto 0); -- Unused in this design 
	AFE0FCLK_P, AFE0FCLK_N  : in std_logic; -- LVDS pairs of the Frame Clock
	AFE1FCLK_P, AFE1FCLK_N  : in std_logic; -- LVDS pairs of the Frame Clock
	-- AFE serial control lines
	AFEPDn 				    : buffer std_logic_vector(1 downto 0);
	AFECS 				    : buffer std_logic_vector(1 downto 0);
	AFERst 				    : buffer std_logic;
	AFESClk			  	    : buffer std_logic;
	AFESDI			  	    : out std_logic;
	AFESDO 				    : in std_logic;				
	-- FPGA interface       
	Clk_80MHz			    : in  std_logic; 	-- Master clock 80MHz
	Clk_100MHz			    : in  std_logic; 	-- uController clock 
	Clk_560MHz			    : in  std_logic; 	-- 7 x Master clock = 560MHz
	Clk_200MHz			    : in  std_logic; 	-- 200 MHz refclk for the IDELAY2
	reset				    : in  std_logic;
	done				    : out std_logic_vector(1 downto 0); -- status of automatic alignment FSM
	warn				    : out std_logic_vector(1 downto 0); -- pulse to indicate an error was seen in the FCLK pattern
	dout_afe0				: out Array_8x14; -- data synchronized to clock
	dout_AFE1				: out Array_8x14; -- data synchronized to clock
    -- Microcontroller strobes
	CpldRst					: in std_logic;
	CpldCS					: in std_logic;
	uCWr 					: in std_logic;
-- Microcontroller data and address buses	
	uCA 					: in std_logic_vector(11 downto 0);
	uCD 					: in std_logic_vector(15 downto 0);        
-- Geographic address pins
	GA 						: in std_logic_vector(1 downto 0);
-- Synchronous edge detectors of uC read and write strobes
	uWRDL 					: in std_logic_vector(1 downto 0)
);
end component;

component AFE_DataPath is
  Port (
	Clk_80MHz			: in std_logic; 
	SysClk				: in std_logic; -- 160 MHz
	ResetHi				: in std_logic;
-- Signals from Trigger Logic
	TrigReq				: in std_logic;
	BeamOn				: in std_logic;
-- Signals for EventBuilder
	MaskReg				: buffer Array_2x8;
	BufferRdAdd			: in Array_2x8x10;
	BufferOut 			: out Array_2x8x16;
	startEVB			: out Array_2x8;
-- Data output from the deserializer for AFE0 and AFE1 synchronized to 80 MHz clock
    din_AFE0			: in Array_8x14; 
    din_AFE1			: in Array_8x14;
    done				: in std_logic_vector(1 downto 0); -- status of automatic alignment FSM
	SerdesRst			: out std_logic_vector(1 downto 0);
-- Histogram signals
	Diff_Reg			: inout Arrays_8x2x14;
	GateWidth	    	: inout Array_2x12;
	GateReq 			: inout std_logic_vector (1 downto 0);
-- Microcontroller strobes
	CpldRst				: in std_logic;
	CpldCS				: in std_logic;
	uCRd				: in std_logic;
	uCWr 				: in std_logic;
-- Microcontroller data and address buses	
	uCA 				: in std_logic_vector(11 downto 0);
	uCD 				: in std_logic_vector(15 downto 0);
-- Geographic address pins
	GA 					: in std_logic_vector(1 downto 0);
-- Global signals
	WRDL 				: in std_logic_vector(1 downto 0);
-- uController status registers
	PipelineSet 		: buffer std_logic_vector (7 downto 0);
	In_Seq_Stat 		: buffer Array_2x8x4;
	ControllerNo 		: buffer std_logic_vector (4 downto 0);
	PortNo 				: buffer std_logic_vector (4 downto 0);
	BeamOnLength 		: buffer std_logic_vector (11 downto 0);
	BeamOffLength 		: buffer std_logic_vector (11 downto 0);
	ADCSmplCntReg 		: buffer std_logic_vector (3 downto 0);
	Ped_Reg				: buffer Arrays_8x2x14;
	IntTrgThresh 		: buffer Arrays_8x2x14
);
end component;
	
component AFE_Pipeline is
  Port (
	Clk_80MHz			: in std_logic; 
-- Data output from the deserializer for AFE0 and AFE1 synchronized to 80 MHz clock
    din_AFE0			: in Array_8x14; 
    din_AFE1			: in Array_8x14;
	dout_AFE0			: out Array_8x14; 
    dout_AFE1			: out Array_8x14;
    done				: in std_logic_vector(1 downto 0); -- status of automatic alignment FSM
-- Pipeline signals
	PipelineSet 		: in std_logic_vector (7 downto 0);	
-- Microcontroller strobes
	CpldRst				: in std_logic
	);
end component;
	
component Phase_Detector is
port (
	SysClk				: in std_logic;   -- 160 Mhz
	Clk_100MHz			: in std_logic;
	-- Microcontroller strobes
	CpldRst				: in std_logic; 
	-- Microcontroller data and address buses	
	uCA 				: in std_logic_vector(11 downto 0);
	uCD 				: in std_logic_vector(15 downto 0);
	-- Geographic address pins
	GA 					: in std_logic_vector(1 downto 0);
	-- Synchronous edge detectors of uC read and write strobes
	uWRDL 				: in std_logic_vector(1 downto 0);
	-- Chip dependent I/O functions
	A7		 			: out std_logic;
	GPI0				: in std_logic;
	-- Trigger Logic
	TrgSrc				: buffer std_logic;
	GPO					: in std_logic
);
end component;

component FM_Tx is
generic (Pwidth : positive);
port(
	clock					: in std_logic;
	reset					: in std_logic;
	Enable 					: in std_logic;
	Data 					: in std_logic_vector(Pwidth - 1 downto 0);
	Tx_Out 					: buffer TxOutRec);
end component;

component FM_Rx is
generic (Pwidth : positive);
port (
	SysClk					: in std_logic;
	RxClk					: in std_logic;
	reset 					: in std_logic;
	Rx_In 					: in RxInRec;
    Data 					: buffer std_logic_vector (Pwidth - 1 downto 0);
    Rx_Out 					: buffer RxOutRec);
end component;

component Trigger is
  Port (
	SysClk				: in std_logic; -- 160 MHz
	ResetHi  			: in std_logic;
-- Signals for other logic
	TrigReq				: buffer std_logic;
	SlfTrgEn 			: buffer std_logic;
	BeamOn 				: buffer std_logic;
	uBunch   			: buffer std_logic_vector(31 downto 0);
	uBunchWrt			: buffer std_logic;
	GPO			 		: out std_logic;
-- Microcontroller strobes
	CpldRst				: in std_logic;
	CpldCS				: in std_logic;
	uCRd				: in std_logic;
	uCWr 				: in std_logic;
-- Microcontroller data and address buses	
	uCA 				: in std_logic_vector(11 downto 0);
	uCD 				: in std_logic_vector(15 downto 0);
-- Geographic address pins
	GA 					: in std_logic_vector(1 downto 0);
-- Synchronous edge detectors of uC read and write strobes
	WRDL 				: in std_logic_vector(1 downto 0);
-- LED/Flash Gate select line
	PulseSel 			: inout std_logic;
-- LED pulser/Flash Gate
	Pulse 				: out std_logic;
	LEDSrc				: out std_logic;
	GPI0 				: in std_logic;
-- uController status registers
	FlashEn  			: buffer std_logic;
	TurnOnTime  		: buffer std_logic_vector (8 downto 0);
	TurnOffTime 		: buffer std_logic_vector (8 downto 0);
	LEDTime	   			: buffer std_logic_vector (8 downto 0);
	TmgSrcSel			: buffer std_logic 

	);
end component;

component EventBuilder is
port (
	SysClk				: in std_logic; -- 160 MHz
	CpldRst				: in std_logic;
	ResetHi				: in std_logic;
-- Signals from/to AFE Buffer
	MaskReg				: in Array_2x8;
	BufferRdAdd			: buffer Array_2x8x10;
	BufferOut 			: in Array_2x8x16;
	startEVB			: in Array_2x8;
-- Signals from Trigger Logic
	SlfTrgEn 			: in std_logic;
	uBunchWrt			: in std_logic;
	uBunch				: in std_logic_vector(31 downto 0);
-- Signals for the DDR	
	EvBuffRd			: in std_logic;
	EvBuffOut			: out std_logic_vector(15 downto 0);
	EvBuffEmpty			: out std_logic;
	EvBuffWdsUsed		: out std_logic_vector(10 downto 0)
	);
end component;


component One_Wire is
port(
	clock  				: in std_logic;
	reset  				: in std_logic;
-- Microcontroller data and address buses	
	uCA 				: in std_logic_vector(11 downto 0);
	uCD 				: in std_logic_vector(15 downto 0);	
-- Geographic address pins
	GA 					: in std_logic_vector(1 downto 0);
-- Synchronous edge detectors of uC read and write strobes
	WRDL 				: in std_logic_vector(1 downto 0);
-- inout/buffer  
	Temp 				: inout  std_logic_vector(3 downto 0);
	One_Wire_Out 		: inout std_logic_vector(15 downto 0)
);
end component;

component LVDS_TX is
port (
	Clk_100MHz			: in std_logic;
	CpldRst				: in std_logic;
	ResetHi				: in std_logic; 
	-- Microcontroller data and address buses	
	uCA 				: in std_logic_vector(11 downto 0);
	uCD 				: in std_logic_vector(15 downto 0);	
	-- Geographic address pins
	GA 					: in std_logic_vector(1 downto 0);
	-- Synchronous edge detectors of uC read and write strobes
	uWRDL 				: in std_logic_vector(1 downto 0);
	-- Chip dipendent I/O functions 
	LVDSTX 				: out std_logic;
	-- uController status registers
	FMTxBuff_full		: out std_logic;
	FMTxBuff_empty		: buffer std_logic
);
end component;

component DDR_Interface is
generic(
	-- DDR3L parameters
	DATA_WIDTH			: integer := 16;  -- 16 Both ARTY and FEB
	DDR3L_ADDR			: integer := 15;  -- 14: ARTY 15: FEB
	APP_ADDR			: integer := 29  -- 28: ARTY 29: FEB
);
port (
	ClkB_P,ClkB_N  		: in std_logic; 
	SysClk				: in std_logic; -- 160 MHz
	ResetHi				: in std_logic;
	Clk_80MHz			: in std_logic;
	Clk_200MHz			: in std_logic;
-- DDR3L pins
	DDR_DATA			: inout std_logic_vector(DATA_WIDTH-1 downto 0);
	DDR_ADDR			: out std_logic_vector(DDR3L_ADDR-1 downto 0);
	BA 					: out std_logic_vector(2 downto 0);
	DDR_CKE	 			: out std_logic_vector(0 downto 0);
	ODT 				: out std_logic_vector(0 downto 0);
	CS 					: out std_logic_vector(0 downto 0);
	DM 					: out std_logic_vector(1 downto 0);
	RAS,CAS				: out std_logic; 
	DDR_WE 				: out std_logic;
	DDR_CLKP,DDR_CLKN 	: out  std_logic_vector(0 downto 0);
	LDQS_P, LDQS_N 		: inout std_logic;
	UDQS_P, UDQS_N 		: inout std_logic;
	RESET_N				: out std_logic;
-- Signals for the DDR	
	EvBuffRd			: buffer std_logic;
	EvBuffOut			: in std_logic_vector(15 downto 0);
	EvBuffEmpty			: in std_logic;
	EvBuffWdsUsed		: in std_logic_vector(10 downto 0);
-- Signals from Trigger Logic
	SlfTrgEn 			: in std_logic;
	uBunchWrt			: in std_logic;
	uBunch				: in std_logic_vector(31 downto 0);
-- Microcontroller strobes
	CpldRst				: in std_logic;
	CpldCS				: in std_logic;
	uCRd				: in std_logic;
	uCWr 				: in std_logic;
-- Microcontroller data and address buses	
	uCA 				: in std_logic_vector(11 downto 0);
	uCD 				: in std_logic_vector(15 downto 0);
-- Geographic address pins
	GA 					: in std_logic_vector(1 downto 0);
-- Synchronous edge detectors of uC read and write strobes
	AddrReg			  	: in std_logic_vector(11 downto 0);
	WRDL 				: in std_logic_vector(1 downto 0);
	RDDL				: in std_logic_vector(1 downto 0)
	);
end component;

component DDR_test is
	generic(
		-- DDR3L parameters
		DATA_WIDTH			: integer := 16;  -- 16 Both ARTY and FEB
		DDR3L_ADDR			: integer := 15;  -- 14: ARTY 15: FEB
		APP_ADDR			: integer := 29  -- 28: ARTY 29: FEB
	);
	port (
        Clk_100MHz			: in std_logic;
		Clk_200MHz			: in std_logic;
        SysClk				: in std_logic; -- 160 MHz
        ResetHi				: in std_logic;
	-- DDR3L pins
		DDR_DATA			: inout std_logic_vector(DATA_WIDTH-1 downto 0);
		DDR_ADDR			: out std_logic_vector(DDR3L_ADDR-1 downto 0);
		BA 					: out std_logic_vector(2 downto 0);
		DDR_CKE	 			: out std_logic_vector(0 downto 0);
		ODT 				: out std_logic_vector(0 downto 0);
		CS 					: out std_logic_vector(0 downto 0);
		DM 					: out std_logic_vector(1 downto 0);
		RAS,CAS				: out std_logic; 
		DDR_WE 				: out std_logic;
		DDR_CLKP,DDR_CLKN 	: out  std_logic_vector(0 downto 0);
		LDQS_P, LDQS_N 		: inout std_logic;
		UDQS_P, UDQS_N 		: inout std_logic;
		RESET_N				: out std_logic;
	-- Microcontroller strobes
		CpldRst				: in std_logic;
		CpldCS				: in std_logic;
		uCRd				: in std_logic;
		uCWr 				: in std_logic;
	-- Microcontroller data and address buses	
		uCA 				: in std_logic_vector(11 downto 0);
		uCD 				: in std_logic_vector(15 downto 0);
	-- Geographic address pins
		GA 					: in std_logic_vector(1 downto 0);
	-- Synchronous edge detectors of uC read and write strobes
		AddrReg			  	: in std_logic_vector(11 downto 0);
		WRDL 				: in std_logic_vector(1 downto 0);
		RDDL				: in std_logic_vector(1 downto 0)
	);
	end component;

component Histogram is
port(
	Clk_80MHz	 			: in std_logic;
	Clk_100MHz	 			: in std_logic;	
	ResetHi	 				: in std_logic;
	-- Microcontroller strobes
	CpldRst					: in std_logic;
	-- Microcontroller data and address buses
	uCA 					: in std_logic_vector(11 downto 0);
	uCD 					: inout std_logic_vector(15 downto 0);
	-- Geographic address pins
	GA 						: in std_logic_vector(1 downto 0);
	
	uAddrReg 				: in std_logic_vector(11 downto 0);	
	Diff_Reg				: inout Arrays_8x2x14;
	GateWidth	    		: inout Array_2x12;
	GateReq 				: inout std_logic_vector (1 downto 0);	
	uWRDL 					: in std_logic_vector(1 downto 0);
	uRDDL 					: in std_logic_vector(1 downto 0)
);
end component;

component uController_interface is
    port (
        Clk_100MHz			: in std_logic;
		ResetHi			    : in std_logic;
    -- Microcontroller strobes
        CpldRst				: in std_logic;
		CpldCS				: in std_logic;
    -- Microcontroller data and address buses	
        uCA 				: in std_logic_vector(11 downto 0);
        uCD 				: in std_logic_vector(15 downto 0);
    -- Geographic address pins
        GA 					: in std_logic_vector(1 downto 0);
    -- Synchronous edge detectors of uC read and write strobes
        uWRDL 				: in std_logic_vector(1 downto 0);
		uRDDL 				: in std_logic_vector(1 downto 0);
        uAddrReg 				: in std_logic_vector(11 downto 0);

        iCD                 : out std_logic_vector(15 downto 0);
    -- OUTPUT REGISTERS     
    -- ADC mux
        MuxSelReg           : in std_logic_vector(2 downto 0);
        MuxadReg            : in std_logic_vector(1 downto 0);
	-- Trigger
		FlashEn  			: in std_logic; 	         
		PulseSel 			: in std_logic;
		LEDSrc				: in std_logic;
		TurnOnTime  		: in std_logic_vector (8 downto 0);
		TurnOffTime 		: in std_logic_vector (8 downto 0);
		LEDTime	   			: in std_logic_vector (8 downto 0);
		TmgSrcSel			: in std_logic; 
		SlfTrgEn 			: in std_logic;
		uBunch   			: in std_logic_vector(31 downto 0);
		TrgSrc		        : in std_logic;
	-- LVDS logic
		FMTxBuff_full		: in std_logic;
		FMTxBuff_empty		: in std_logic;
	-- AFE Logic
		AFEPDn				: in std_logic_vector(1 downto 0);
		dout_afe0			: in Array_8x14;
		done				: in std_logic_vector(1 downto 0);
	-- DAC logic
		AlignReq            : in std_logic_vector (1 downto 0);
		AFERdReg            : in std_logic_vector (15 downto 0);
	-- AFE DataPath logic
		PipelineSet 		: in std_logic_vector (7 downto 0);
		MaskReg				: in Array_2x8;
		In_Seq_Stat 		: in Array_2x8x4;
		ControllerNo 		: in std_logic_vector (4 downto 0);
		PortNo 				: in std_logic_vector (4 downto 0);
		BeamOnLength 		: in std_logic_vector (11 downto 0);
		BeamOffLength 		: in std_logic_vector (11 downto 0);
		ADCSmplCntReg 		: in std_logic_vector (3 downto 0);
		Ped_Reg				: in Arrays_8x2x14;
		IntTrgThresh 		: in Arrays_8x2x14              
    );
end component;

component Mux is
    port (
        Clk_100MHz			: in std_logic;
    -- Microcontroller strobes
        CpldRst				: in std_logic;
    -- Microcontroller data and address buses	
        uCA 				: in std_logic_vector(11 downto 0);
        uCD 				: in std_logic_vector(15 downto 0);
    -- Geographic address pins
        GA 					: in std_logic_vector(1 downto 0);
    -- Synchronous edge detectors of uC read and write strobes
        uWRDL 				: in std_logic_vector(1 downto 0);
    -- Analog Mux address lines
	    MuxEn               : out std_logic_vector(3 downto 0);
	    Muxad               : out std_logic_vector(1 downto 0);
	-- uController status registers
		MuxSelReg           : out std_logic_vector(2 downto 0);
		MuxadReg            : out std_logic_vector(1 downto 0)           
    );
end component;

component DAC is
    port (
        Clk_100MHz			: in std_logic;
        ResetHi			    : in std_logic;
    -- Microcontroller strobes
        CpldRst				: in std_logic;
		CpldCS				: in std_logic;
        uCWr 				: in std_logic;
    -- Microcontroller data and address buses	
        uCA 				: in std_logic_vector(11 downto 0);
        uCD 				: in std_logic_vector(15 downto 0);        
    -- Geographic address pins
        GA 					: in std_logic_vector(1 downto 0);
    -- Synchronous edge detectors of uC read and write strobes
        uWRDL 				: in std_logic_vector(1 downto 0);
	-- Serial DAC control lines
	    DACCS 				: buffer std_logic_vector(2 downto 0);
	    DACClk 				: buffer std_logic;
	    DACDat 				: buffer std_logic;
	    DACLd 				: buffer std_logic;
    -- uController status registers
        AlignReq            : buffer std_logic_vector (1 downto 0);
        AFERdReg            : buffer std_logic_vector (15 downto 0)
    );
end component;

component AFE_debug is
    port (
        Clk_100MHz			: in std_logic;
        ResetHi			    : in std_logic;
    -- Microcontroller strobes
        CpldRst				: in std_logic;
        CpldCS				: in std_logic;
        uCWr 				: in std_logic;
    -- Microcontroller data and address buses	
        uCA 				: in std_logic_vector(11 downto 0);
        uCD 				: in std_logic_vector(15 downto 0);        
    -- Geographic address pins
        GA 					: in std_logic_vector(1 downto 0);
    -- Synchronous edge detectors of uC read and write strobes
        uWRDL 				: in std_logic_vector(1 downto 0);
    -- AFE serial control lines
	    AFEPDn 				 : buffer std_logic_vector(1 downto 0);
	    AFECS 				 : buffer std_logic_vector(1 downto 0);
	    AFERst 				 : buffer std_logic;
	    AFESClk            	 : buffer std_logic;
        AFESDI  		     : out std_logic;         
	    AFESDO 				 : in std_logic
    );
end component;





-----------------------------------------------------------------------
------------------------ Xilinx IP Components -------------------------
-----------------------------------------------------------------------	

component DPRAM_1Kx16 is
port (
	clka 					  : in std_logic;
	wea   					  : in std_logic_vector(0 downto 0);
	addra 					  : in std_logic_vector(9 downto 0);
	dina  					  : in std_logic_vector(15 downto 0);
	clkb  					  : in std_logic;
	addrb 					  : in std_logic_vector(9 downto 0);
	doutb 					  : out std_logic_vector(15 downto 0)
);
end component;


component AFE_DP_Pipeline
port (
	clka 					  : in std_logic;
	wea 					  : in std_logic_vector(0 downto 0);
	addra					  : in std_logic_vector(7 downto 0);
	dina  					  : in std_logic_vector(111 downto 0);
	clkb  					  : in std_logic;
	addrb 					  : in std_logic_vector(7 downto 0);
	doutb 					  : out std_logic_vector(111 downto 0)
);
end component;


component SCFIFO_32x256
port (
	rst,clk,wr_en,rd_en 	  : in std_logic;
    din 					  : in std_logic_vector(31 downto 0);
    dout 					  : out std_logic_vector(31 downto 0);
    empty,full 				  : out std_logic
);
end component;

component SCFIFO_1kx16
port (
	clk,rst, wr_en,rd_en 	  : in std_logic;
    din 					  : in std_logic_vector(15 downto 0);
    dout 					  : out std_logic_vector(15 downto 0);
    full,empty 				  : out std_logic;
    data_count 				  : out std_logic_vector(10 downto 0)
);
end component;

component LVDSTxBuff
port (
	rst,clk,wr_en,rd_en : in std_logic;
    din 				: in std_logic_vector(15 downto 0);
    dout 				: out std_logic_vector(15 downto 0);
	full,empty 			: out std_logic
);
end component;

component DDR3LController is
  port (
	ddr3_dq       		: inout std_logic_vector(15 downto 0);
	ddr3_dqs_p    		: inout std_logic_vector(1 downto 0);
	ddr3_dqs_n    		: inout std_logic_vector(1 downto 0);
	ddr3_addr     		: out   std_logic_vector(14 downto 0);
	ddr3_ba       		: out   std_logic_vector(2 downto 0);
	ddr3_ras_n    		: out   std_logic;
	ddr3_cas_n    		: out   std_logic;
	ddr3_we_n     		: out   std_logic;
	ddr3_reset_n  		: out   std_logic;
	ddr3_ck_p     		: out   std_logic_vector(0 downto 0);
	ddr3_ck_n     		: out   std_logic_vector(0 downto 0);
	ddr3_cke      		: out   std_logic_vector(0 downto 0);
	ddr3_cs_n     		: out   std_logic_vector(0 downto 0);
	ddr3_dm       		: out   std_logic_vector(1 downto 0);
	ddr3_odt      		: out   std_logic_vector(0 downto 0);
	app_addr            : in    std_logic_vector(28 downto 0);
	app_cmd             : in    std_logic_vector(2 downto 0);
	app_en              : in    std_logic;
	app_wdf_data        : in    std_logic_vector(63 downto 0);
	app_wdf_end         : in    std_logic;
	app_wdf_mask        : in    std_logic_vector(7 downto 0);
	app_wdf_wren        : in    std_logic;
	app_rd_data         : out   std_logic_vector(63 downto 0);
	app_rd_data_end     : out   std_logic;
	app_rd_data_valid   : out   std_logic;
	app_rdy             : out   std_logic;
	app_wdf_rdy         : out   std_logic;
	app_sr_req          : in    std_logic;
	app_ref_req         : in    std_logic;
	app_zq_req          : in    std_logic;
	app_sr_active       : out   std_logic;
	app_ref_ack         : out   std_logic;
	app_zq_ack          : out   std_logic;
	ui_clk              : out   std_logic;
	ui_clk_sync_rst     : out   std_logic;
	init_calib_complete : out   std_logic;
    -- debug signals
--    ddr3_ila_wrpath     : out   std_logic_vector(390 downto 0);
--    ddr3_ila_rdpath     : out   std_logic_vector(1023 downto 0);
--    ddr3_ila_basic      : out   std_logic_vector(119 downto 0);
--    ddr3_vio_sync_out   : in    std_logic_vector(13 downto 0);
--    dbg_byte_sel        : in    std_logic_vector(1 downto 0);
--    dbg_sel_pi_incdec   : in    std_logic;
--    dbg_pi_f_inc        : in    std_logic;
--    dbg_pi_f_dec        : in    std_logic;
--    dbg_sel_po_incdec   : in    std_logic;
--    dbg_po_f_inc        : in    std_logic;
--    dbg_po_f_stg23_sel  : in    std_logic;
--    dbg_po_f_dec        : in    std_logic;
--    dbg_pi_counter_read_val   : out   std_logic_vector(5 downto 0);
--    dbg_po_counter_read_val   : out   std_logic_vector(8 downto 0);
--    dbg_prbs_final_dqs_tap_cnt_r : out std_logic_vector(107 downto 0);
--    dbg_prbs_first_edge_taps     : out std_logic_vector(107 downto 0);
--    dbg_prbs_second_edge_taps    : out std_logic_vector(107 downto 0);
	-- System Clock Ports
	sys_clk_i           : in    std_logic;
	-- Reference Clock Ports
	clk_ref_i           : in    std_logic;
	device_temp         : out 	std_logic_vector(11 downto 0);
	device_temp_i       : in    std_logic_vector(11 downto 0);
  sys_rst               : in    std_logic
  );
end component;

-- Histogrammer memory 512x32
component Hist_Ram
  port (
    rsta,rstb,clka,clkb : in std_logic;
    wea,web 			: in std_logic_vector(0 downto 0);
    addra 				: in std_logic_vector(9 downto 0);
	addrb 				: in std_logic_vector(10 downto 0);
    dina  				: in std_logic_vector(31 downto 0);
	dinb  				: in std_logic_vector(15 downto 0);
    douta 				: out std_logic_vector(31 downto 0);
	doutb 				: out std_logic_vector(15 downto 0)
  );
end component;

-- Fifo for queueing serial data. With this, the processor doesn't need to
-- check for serial transmits being done before sending the next data word 
component Cmd_FIFO 
  port (
    clk,rst,wr_en,rd_en : in std_logic;
    din 				: in std_logic_vector(27 downto 0);
    dout 				: out std_logic_vector(27 downto 0);
    full,empty 			: out std_logic;
	wr_rst_busy, rd_rst_busy : out std_logic
	);
end component;

-- Ram used to shadow DAC writes for later readback
component DAC_Ram
  port (
    clka 				: in std_logic;
    wea 				: in std_logic_vector(0 downto 0);
    addra 				: in std_logic_vector(7 downto 0);
    dina 				: in std_logic_vector(15 downto 0);
    douta 				: out std_logic_vector(15 downto 0) 
);
end component;
 
component PLL_0 
 port (
 	clk_in1_p			: in std_logic;
 	clk_in1_n			: in std_logic;
	resetn				: in std_logic;

	Clk_100MHz			: out std_logic;
	Clk_200MHz			: out std_logic;
	SysClk				: out std_logic;
	locked				: out std_logic
 );
 end component;


component PLL_AFE 
 port (
	clk_in1				: in std_logic;
	resetn				: in std_logic;
   
	Clk_80MHz			: out std_logic;
	Clk_560MHz			: out std_logic;
	locked				: out std_logic
);
end component;
 
end package;