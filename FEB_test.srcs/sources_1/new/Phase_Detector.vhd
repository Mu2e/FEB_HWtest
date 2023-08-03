----------------------------------------------------------------------------------
-- Company: FNAL
-- Engineer: Micol Rigatti <mrigatti@fnal.gov>
-- 
-- Create Date: 10/13/2022 11:02:35 AM
-- Design Name: 
-- Module Name: Phase_Detector - Behavioral
-- Project Name: CRV FEB
-- Target Devices: xc7s50fgga484-2
-- Tool Versions: 2021.2
-- Description: 
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



entity Phase_Detector is
port (
	SysClk				    : in std_logic;   -- 160 Mhz
	-- Microcontroller strobes
	CpldRst					: in std_logic; 
	-- Geographic address pins
	GA 						: in std_logic_vector(1 downto 0);
	-- Chip dependent I/O functions
	A7		 				: out std_logic;
	GPI0					: in std_logic;
	-- Trigger Logic
	TrgSrc					: in std_logic;
	GPO						: in std_logic
);
end Phase_Detector;

architecture Behavioral of Phase_Detector is

-- Signals used by the phase detector
signal SqWav				: std_logic;
signal PhDtct				: std_logic;
signal FBDiv 				: std_logic_vector(2 downto 0);

-- Chip dependent drive
signal RefIn				: std_logic;

begin


-- The external reference frequency is 25MHz so divide 160MHz
-- by 8 to compare two equal frequencies with the phase detector
IntClkDiv : process(SysClk,CpldRst)
begin
 if CpldRst = '0' then 
 
	FBDiv 	<= "000"; 
	SqWav 	<= '0';

	
elsif falling_edge(SysClk) then

 SqWav <= FBDiv(2); -- 20 MHz (160 Mhz/8)
 FBDiv <= FBDiv + 1;

end if; -- CpldRst
end process IntClkDiv;

RefIn <= GPI0;
PhDtct <= TrgSrc and not(FBDiv(2) xor RefIn);


A7 <= SqWav when GA = 2 else TrgSrc and PhDtct when GA = 3 else GPO;


end Behavioral;
