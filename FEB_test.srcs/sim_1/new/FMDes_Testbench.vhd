----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/22/2023 10:55:46 AM
-- Design Name: 
-- Module Name: FMDeserializer_Testbench - Behavioral
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

entity FMDeserializer_Testbench is
--  Port ( );
end FMDeserializer_Testbench;

architecture Behavioral of FMDeserializer_Testbench is


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
 	GPO			 		: inout std_logic;
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
 	PulseSel 			: buffer std_logic;
 -- LED pulser/Flash Gate
 	Pulse 				: out std_logic;
 	LEDSrc				: buffer std_logic;
 	GPI0 				: in std_logic
 	);
 end component;

 
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
signal PulseSel 			  : std_logic;
	-- LED pulser/Flash Gate
signal Pulse 				  : std_logic;
signal FMTxBuff_wreq		  : std_logic;

signal iCD				  	  : std_logic_vector(15 downto 0);

constant Clk100MHz_period: time := 10.0ns;  -- 100 MHz
constant Clk200MHz_period: time := 5.0ns;   -- 200 MHz
constant Clk160MHz_period: time := 6.25ns;  -- 160 MHz
constant Clk80MHz_period:  time := 12.5ns;  -- 80 MHz
constant Clk560MHz_period: time := 1.786ns; -- 80 MHz * 7 = 560MHz
constant Clk10MHz_period: time := 100ns;
constant Clk12MHz_period: time := 83ns;
constant Clk15MHz_period: time := 67ns;
constant HW_period: time := 78ns;

signal reset	: std_logic := '1';
signal ResetHi	: std_logic := '1';
signal CpldRst	: std_logic := '1';
signal Clk100MHz, Clk200MHz, Clk160MHz, Clk80MHz, Clk560MHz, SysClk, Clk5MHz: std_logic := '0';
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
signal counter				: std_logic_vector(15 downto 0):=(others => '0');
signal up					: std_logic_vector(15 downto 0):=(others => '0');
signal down					: std_logic_vector(7 downto 0):= x"80";
--signal counter				: integer range 0 to 14;

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
Clk5MHz <= not Clk5MHz after Clk10MHz_period;

ResetHi <= not CpldRst;

GPIO_sim : GPIO_emu 
 port map (
	SysClk		=> SysClk,
	CpldRst		=> CpldRst,
 	GPI0 		=> GPI0
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
-- Global signals
	WRDL 			=> WRDL,
-- Chip out
	PulseSel 		=> PulseSel, 
	Pulse 			=> Pulse, 
	GPI0 			=> GPI0,
-- uC register 
	LEDSrc 			=> LEDSrc
);



RxOut_Done: process(SysClk)
begin

	if CpldRst = '0' then
		uCA <= (others => '0');
		uCD <= (others => '0');		
		WRDL <= "00";	
		GA <= (others => '0');	
		GPI0 <= '0';
		counter <= (others => '0');	
	elsif rising_edge(SysClk) then

	for j in 0 to 20 loop
		counter <= counter + 1;
		if counter < 10 then 
			GPI0 <= '1';
		elsif counter >= 10 and counter < 20 then 
			GPI0 <= '0';
		elsif counter = 20 then
			counter <= (others => '0');	
		end if;
	end loop;


	end if;
end process;	




end Behavioral;

-- FM
-- 		uCD <= x"0005"; =====> RxOut.Done = '1' and Rx1Dat(21) = '1' Rx1Dat(20) = '0' and Rx1Dat(19 downto 0) = X"00000"
-- 
-- 
-- 
-- 
-- 
-- 
