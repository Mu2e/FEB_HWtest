LIBRARY ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use IEEE.numeric_std.all;
Library UNISIM;
use UNISIM.vcomponents.all;

use work.Proj_Def.all;

entity GPIO_emu is
  Port (
	SysClk				: in std_logic;
	CpldRst				: in std_logic;
 	GPI0 				: out std_logic
	);
end GPIO_emu;

architecture Behavioral of GPIO_emu is

signal counter				: std_logic_vector(15 downto 0);


begin

RxOut_Done: process(SysClk)
begin

	if CpldRst = '0' then
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