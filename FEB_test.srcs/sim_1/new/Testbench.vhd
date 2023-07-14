----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Micol Rigatti
-- 
-- Create Date: 07/13/2023 03:52:11 PM
-- Design Name: FEB Testbench 
-- Module Name: Testbench - Behavioral
----------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library unisim;
use unisim.vcomponents.all;

use work.Proj_Def.all;

entity FEB_testbench is
end FEB_testbench;


architecture Behavioral of FEB_testbench is

component FEB is
port(
	-- 160 MHz VXO clock
	VXO_P,VXO_N 			: in std_logic;
	-- Microcontroller strobes
	CpldRst					: in std_logic;
	CpldCS					: in std_logic;
	uCRd					: in std_logic;
	uCWr 					: in std_logic;
	-- Microcontroller data and address buses
	uCA 					: in std_logic_vector(11 downto 0);
	uCD 					: inout std_logic_vector(15 downto 0);
	-- Geographic address pins
	GA 						: in std_logic_vector(1 downto 0);
	-- Chip dependent I/O functions
	A7,LVDSTX 				: buffer std_logic;
	GPI0_N,GPI0_P,GPI1  	: in std_logic
  );
end component;


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
signal Clk80MHz, Clk100MHz, Clk160MHz, Clk200MHz, Clk560MHz, SysClk: std_logic := '0';
signal Clk160MHz_n :std_logic := '1';
signal HW_Clk : std_logic := '0';

-- Microcontroller signals 
signal CpldCS 				  : std_logic := '0';
signal uCRd	  				  : std_logic := '0';
signal uCWr 				  : std_logic := '0';
signal uCA 	  				  : std_logic_vector(11 downto 0):=(others => '0');
signal uCD 	  				  : std_logic_vector(15 downto 0);
signal GA 					  : std_logic_vector(1 downto 0):=(others => '0');
-- Other signals 	
signal A7    				  : std_logic;
signal LVDSTX                 : std_logic;
signal GPI0_N                 : std_logic := '0';
signal GPI0_P                 : std_logic := '0';
signal GPI1                   : std_logic := '0';


begin

-- make the reset
reset 	  <= '1', '0' after 13ns;
CpldRst   <= '0', '1' after 25ns;
ResetHi   <= not CpldRst;

-- make the clocks
Clk80MHz  <= not Clk80MHz  after Clk80MHz_period/2;
Clk100MHz <= not Clk100MHz  after Clk100MHz_period/2;
Clk160MHz <= not Clk160MHz after Clk160MHz_period/2;
SysClk    <= not Clk160MHz after Clk160MHz_period/2;
Clk200MHz <= not Clk200MHz after Clk200MHz_period/2;
Clk560MHz <= not Clk560MHz after Clk560MHz_period/2;
HW_Clk    <= not HW_Clk after HW_period/2;

ResetHi   <= not CpldRst;
Clk160MHz_n <= not Clk160MHz;

DUT : FEB 
port map(
	VXO_P		=> Clk160MHz,
	VXO_N 		=> Clk160MHz_n,		
	CpldRst		=> CpldRst,				
	CpldCS		=> CpldCS,			
	uCRd		=> uCRd,			
	uCWr 		=> uCWr, 			
	uCA 		=> uCA, 			
	uCD 		=> uCD, 			
	GA 			=> GA, 				
	A7          => A7,     
	LVDSTX 		=> LVDSTX,	
	GPI0_N      => GPI0_N,
	GPI0_P      => GPI0_P,
	GPI1  	    => GPI1  
  );

test : process (CpldRst)
begin 
if rising_edge (CpldRst) then
	uCRd	<= '1';
	CpldCS	<= '1';
	uCWr    <= '1';
	uCA     <= b"00" & TestCounterLoAd;
	uCD     <= (others => '0');
	GA 	    <= b"00";
end if;	
end process; 

end Behavioral;