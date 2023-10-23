----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/22/2023 10:55:46 AM
-- Design Name: 
-- Module Name: Datapath_Testbench - Behavioral
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

LIBRARY ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use IEEE.numeric_std.all;
Library UNISIM;
use UNISIM.vcomponents.all;

use work.Proj_Def.all;

entity Datapath_Testbench is
--  Port ( );
end Datapath_Testbench;

architecture Behavioral of Datapath_Testbench is

component FEB_fabric is
  Port (
	Clk_80MHz			  	: in std_logic;
	Clk_100MHz			  	: in std_logic;
	Clk_200MHz			  	: in std_logic;
	SysClk				  	: in std_logic;  -- 160 MHz
	-- DDR3L pins
	DDR_DATA				: inout std_logic_vector(DATA_WIDTH-1 downto 0);
	DDR_ADDR				: out std_logic_vector(DDR3L_ADDR-1 downto 0);
	BA 						: out std_logic_vector(2 downto 0);
	DDR_CKE	 				: out std_logic_vector(0 downto 0);
	ODT 					: out std_logic_vector(0 downto 0);
	CS 						: out std_logic_vector(0 downto 0);
	DM 						: out std_logic_vector(1 downto 0);
	RAS,CAS					: out std_logic; 
	DDR_WE 					: out std_logic;
	DDR_CLKP,DDR_CLKN 		: out  std_logic_vector(0 downto 0);
	LDQS_P, LDQS_N 			: inout std_logic;
	UDQS_P, UDQS_N 			: inout std_logic;
	DDR_RESET_N 			: out std_logic;
	-- Microcontroller strobes
	CpldRst					: in std_logic;
	CpldCS					: in std_logic;
	uCRd					: in std_logic;
	uCWr 					: in std_logic;
	-- Microcontroller data and address buses
	uCA 					: in std_logic_vector(11 downto 0);
	uCD 					: in std_logic_vector(15 downto 0);
	iuCD 					: out std_logic_vector(15 downto 0);
--	uCD 					: inout std_logic_vector(15 downto 0);
	-- Geographic address pins
	GA 						: in std_logic_vector(1 downto 0);
	-- Chip dependent I/O functions
	A7		 				: out std_logic;
	LVDSTX 					: out std_logic;
	GPI0_N,GPI0_P,GPI1  	: in std_logic;
	-- LED/Flash Gate select line
	PulseSel 				: inout std_logic;
	-- LED pulser/Flash Gate
	Pulse 					: out std_logic;
	-- Temperature sensor lines
	Temp					: inout std_logic_vector(3 downto 0)
	);
end component;

-- DDR Pinout Signal 
signal DDR_DATA				: std_logic_vector(DATA_WIDTH-1 downto 0);
signal DDR_ADDR				: std_logic_vector(DDR3L_ADDR-1 downto 0);
signal BA 					: std_logic_vector(2 downto 0);
signal DDR_CKE	 			: std_logic_vector(0 downto 0);
signal ODT 					: std_logic_vector(0 downto 0);
signal CS 					: std_logic_vector(0 downto 0);
signal DM 					: std_logic_vector(1 downto 0);
signal RAS,CAS				: std_logic; 
signal DDR_WE 				: std_logic;
signal DDR_CLKP,DDR_CLKN 	: std_logic_vector(0 downto 0);
signal LDQS_P, LDQS_N 		: std_logic;
signal UDQS_P, UDQS_N 		: std_logic;
signal DDR_RESET_N 			: std_logic;
-- Chip dependent I/O functions
signal A7		 			: std_logic;
signal LVDSTX 				: std_logic;
signal GPI0_N,GPI0_P,GPI1  	: std_logic;
-- LED/Flash Gate select line
signal PulseSel 			: std_logic;
-- LED pulser/Flash Gate
signal Pulse 				: std_logic;
-- Temperature sensor lines
signal Temp					: std_logic_vector(3 downto 0);

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
-- Histogram signals from AFE_DataPath
signal Diff_Reg				  : Arrays_8x2x14;
signal GateWidth	    	  : Array_2x12;
signal GateReq 				  : std_logic_vector (1 downto 0);

-- Signals between AFE_DataPath and Event Builder
signal MaskReg				  : Array_2x8;
signal BufferRdAdd			  : Array_2x8x10;
signal BufferOut 			  : Array_2x8x16;
signal startEVB				  : Array_2x8;
-- Signals Event Builder
signal EvBuffRd				  : std_logic;
signal EvBuffOut	          : std_logic_vector(15 downto 0);
signal EvBuffEmpty	          : std_logic;
signal EvBuffWdsUsed          : std_logic_vector(10 downto 0);

signal asp					  : std_logic := '0';
 
signal TempEn 				  : std_logic;
signal TempCtrl 			  : std_logic_vector(3 downto 0);
signal One_Wire_Out 		  : std_logic_vector(15 downto 0);
-- LED pulser/Flash Gate
signal FMTxBuff_wreq		  : std_logic;

signal iCD				  	  : std_logic_vector(15 downto 0);

constant Clk100MHz_period: time := 10.0ns;  -- 100 MHz
constant Clk200MHz_period: time := 5.0ns;   -- 200 MHz
constant Clk160MHz_period: time := 6.25ns;  -- 160 MHz
constant Clk80MHz_period:  time := 12.5ns;  -- 80 MHz
constant Clk560MHz_period: time := 1.786ns; -- 80 MHz * 7 = 560MHz
constant Clk10MHz_period: time 	:= 100ns;
constant Clk12MHz_period: time 	:= 83ns;
constant Clk15MHz_period: time 	:= 67ns;
constant HW_period		: time 	:= 78ns;

signal reset	: std_logic := '1';
signal ResetHi	: std_logic := '1';
signal CpldRst	: std_logic := '1';
signal Clk100MHz, Clk200MHz, Clk160MHz, Clk80MHz, Clk560MHz, SysClk: std_logic := '0';
signal HW_Clk : std_logic := '0';


signal CpldCS 				  : std_logic := '0';
signal uCRd	  				  : std_logic := '0';
signal uCWr 				  : std_logic := '0';
signal uCA 	  				  : std_logic_vector(11 downto 0);
signal uCD 	  				  : std_logic_vector(15 downto 0);
signal iuCD 	  			  : std_logic_vector(15 downto 0);
signal GA 					  : std_logic_vector(1 downto 0):=(others => '0');
	
constant StopAFEemu : AddrPtr := "11" & X"AC";
constant StartAFEemu : AddrPtr := "11" & X"AD";
constant ResetAFEemu : AddrPtr := "11" & X"AE";
constant ReadAFEemu : AddrPtr := "11" & X"AF";
signal counterFM			: std_logic_vector(15 downto 0):=(others => '0');
signal up					: std_logic_vector(15 downto 0):=(others => '0');
signal down					: std_logic_vector(7 downto 0):= x"80";
signal counter				: integer range 0 to 14;

begin

--make the reset
reset 	<= '1', '0' after 13ns;
CpldRst <= '0', '1' after 25ns;
ResetHi <= not CpldRst;


-- make the clocks
Clk80MHz  <= not Clk80MHz  after Clk80MHz_period/2;
Clk100MHz  <= not Clk100MHz  after Clk100MHz_period/2;
Clk160MHz <= not Clk160MHz after Clk160MHz_period/2;
SysClk <= not Clk160MHz after Clk160MHz_period/2;
Clk200MHz <= not Clk200MHz after Clk200MHz_period/2;
Clk560MHz <= not Clk560MHz after Clk560MHz_period/2;
HW_Clk <= not HW_Clk after HW_period/2;

ResetHi <= not CpldRst;


FEB: FEB_fabric 
port map (
	Clk_80MHz			  	=> Clk80MHz,	
	Clk_100MHz			  	=> Clk100MHz,
	Clk_200MHz			  	=> Clk200MHz,		
	SysClk				  	=> SysClk,	  -- 160 MHz
	-- DDR3L pins
	DDR_DATA				=> DDR_DATA,			
	DDR_ADDR				=> DDR_ADDR,			
	BA 						=> BA, 				
	DDR_CKE	 				=> DDR_CKE,	 		
	ODT 					=> ODT,				
	CS 						=> CS, 				
	DM 						=> DM, 				
	RAS						=> RAS,
	CAS						=> CAS,			
	DDR_WE 					=> DDR_WE, 			
	DDR_CLKP		 		=> DDR_CLKP,
	DDR_CLKN				=> DDR_CLKN,
	LDQS_P	 				=> LDQS_P,
	LDQS_N 					=> LDQS_N, 	
	UDQS_P					=> UDQS_P,  
	UDQS_N 					=>  UDQS_N, 	
	DDR_RESET_N 			=> DDR_RESET_N, 		
	-- Microcontroller strobes
	CpldRst					=> CpldRst,	
	CpldCS					=> CpldCS,
	uCRd					=> uCRd,
	uCWr 					=> uCWr, 	
	-- Microcontroller data and address buses
	uCA 					=> uCA,
	uCD 					=> uCD,
	iuCD 					=> iuCD,
	-- Geographic address pins
	GA 						=> GA,
	-- Chip dependent I/O functions
	A7		 				=> A7,		
	LVDSTX 					=> LVDSTX, 	
	GPI0_N					=> GPI0_N,	
	GPI0_P                  => GPI0_P,  
	GPI1  					=> GPI1,  	
	-- LED/Flash Gate select line
	PulseSel 				=> PulseSel,
	-- LED pulser/Flash Gate
	Pulse 					=> Pulse,
	-- Temperature sensor lines
	Temp					=> Temp
	);
Fill_AFE_Sim: process(HW_Clk)
begin

	if CpldRst = '0' then
		uCA <= (others => '0');
		uCD <= (others => '0');		
		WRDL <= "00";	
		counter <= 0;	
		up <= (others => '0');	
		--GA <= (others => '0');	
	else
		counter <= counter + 1;
		if (counter < 1024) then 
		uCA(9 downto 0) <= StartAFEemu;	
		uCD <= up;
			if (counter mod 256 < 128) then 	
				up <= up + 1;
			else
				up <= up - 1;
			end if; 
		elsif (counter = 1024) then
		uCA(9 downto 0) <= ReadAFEemu;
		uCWR <= '1';
		CpldCS <= '0';		
		elsif (counter = 1025) then --	PedReg(0);
		WRDL <= "01";	
		uCA <= b"000010000000";
		uCD <= (others => '0');			
		elsif (counter = 1026) then --	SetThreshReg00(20);
		WRDL <= "01";	
		uCA <= b"000010010000";
		uCD <= x"0014";		
		uCWR <= '1';
		CpldCS <= '0';
		elsif (counter = 1027) then -- 	SetCrtlNPortN(21, 12);
		WRDL <= "01";	
		uCA <= b"001100010100";
		uCD(15 downto 13) <= b"000";
		uCD(7 downto 5)  <= b"000";	
		uCD(12 downto 8) <= b"10101";
		uCD(4 downto 0)  <= b"01100"; 
		elsif (counter = 1028) then  --SlfTrgEn
		uCWR <= '0';
		CpldCS <= '0';
		uCA(9 downto 0) <= IntTrgEnAddr;
		uCD <= x"0002";
		end if;

	end if;
end process;

end Behavioral;