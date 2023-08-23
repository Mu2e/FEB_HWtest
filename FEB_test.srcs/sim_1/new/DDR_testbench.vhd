----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Micol Rigatti
-- 
-- Create Date: 08/22/2023 
-- Design Name: 
-- Module Name: DDR_testbench - Behavioral
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

entity DDR_testbench is
--  Port ( );
end DDR_testbench;

architecture Behavioral of DDR_testbench is

constant Clk80MHz_period:  time := 12.5ns;  -- 80 MHz
constant Clk100MHz_period: time := 10.0ns;  -- 100 MHz
constant Clk160MHz_period: time := 6.25ns;  -- 160 MHz
constant Clk200MHz_period: time := 5.0ns;   -- 200 MHz
constant Clk560MHz_period: time := 1.786ns; -- 80 MHz * 7 = 560MHz
constant Clk10MHz_period: time := 100ns;
constant Clk12MHz_period: time := 83ns;
constant Clk15MHz_period: time := 67ns;
constant HW_period: time := 78ns;

signal reset	: std_logic := '1';
signal ResetHi	: std_logic := '1';
signal CpldRst	: std_logic := '1';
signal Clk100MHz, Clk200MHz, Clk160MHz, Clk80MHz, Clk560MHz, SysClk: std_logic := '0';
signal HW_Clk : std_logic := '0';

-- DDR3L pins
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

-- Microcontroller strobes
signal CpldCS				: std_logic;
signal uCRd					: std_logic;  -- On FEB v2 this PIN is routed to a dedicated PIN, so we jumper this to a DBG header (PIN U17)
signal uCWr 				: std_logic;
-- Microcontroller data and address buses
signal uCA 					: std_logic_vector(11 downto 0);
signal uCD 					: std_logic_vector(15 downto 0);
-- Geographic address pins
signal GA 					: std_logic_vector(1 downto 0);
-- Synchronous edge detectors of uC read and write strobes
signal WRDL 				: std_logic_vector(1 downto 0);
signal RDDL 				: std_logic_vector(1 downto 0);
signal uWRDL 				: std_logic_vector(1 downto 0);
signal uRDDL 				: std_logic_vector(1 downto 0);
signal AddrReg				: std_logic_vector(11 downto 0);
signal uAddrReg				: std_logic_vector(11 downto 0);	

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

DDR: DDR_test
port map(
	Clk_100MHz		=> Clk100MHz,
	Clk_200MHz		=> Clk200MHz,
	SysClk			=> SysClk,	
	ResetHi			=> ResetHi,
-- DDR3L pins
	DDR_DATA		=> DDR_DATA,	
	DDR_ADDR		=> DDR_ADDR,	
	BA 				=> BA, 			
	DDR_CKE	 		=> DDR_CKE,		
	ODT 			=> ODT, 		
	CS 				=> CS, 			
	DM 				=> DM, 			
	RAS				=> RAS,
	CAS				=> CAS,		
	DDR_WE 			=> DDR_WE, 		
	DDR_CLKP        => DDR_CLKP,
	DDR_CLKN 	    => DDR_CLKN,
	LDQS_P          => LDQS_P,
	LDQS_N 		    => LDQS_N, 	
	UDQS_P          => UDQS_P,
	UDQS_N 		    => UDQS_N, 	 	
	RESET_N			=> DDR_RESET_N,
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
	AddrReg			=> AddrReg,
	WRDL 			=> WRDL,
	RDDL			=> RDDL
);



global_signals_100MHz : process(Clk100MHz, CpldRst)
	begin 
	if CpldRst = '0' then

	elsif rising_edge (Clk100MHz) then
    end if; 
end process;


end Behavioral;


