----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/17/2023 10:37:41 AM
-- Design Name: 
-- Module Name: Exclude_DDR_Testbench - Behavioral
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



entity Exclude_EVB_Testbench is
--  Port ( );
end Exclude_EVB_Testbench;

architecture Behavioral of Exclude_EVB_Testbench is

component Exclude_EVB is
  Port (
	SysClk				: in std_logic; -- 160 MHz
	CpldRst				: in std_logic;
	ResetHi				: in std_logic;
-- Signals from/to AFE Buffer
	MaskReg				: in Array_2x8;
	BufferRdAdd			: buffer Array_2x8x10;
	BufferOut 			: in Array_2x8x16;
-- Microcontroller strobes
	CpldCS				: in std_logic;
	uCRd				: in std_logic;
	uCWr 				: in std_logic;
-- Microcontroller data and address buses	
	uCA 				: in std_logic_vector(11 downto 0);
	uCD 				: in std_logic_vector(15 downto 0);
	iuCD 				: out std_logic_vector(15 downto 0);
-- Geographic address pins
	GA 					: in std_logic_vector(1 downto 0);
-- Synchronous edge detectors of uC read and write strobes
	WRDL 				: in std_logic_vector(1 downto 0)
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

signal reset	: std_logic := '1';
signal ResetHi	: std_logic := '1';
signal CpldRst	: std_logic := '1';
signal Clk100MHz, Clk200MHz, Clk160MHz, Clk80MHz, Clk560MHz: std_logic := '0';


signal CpldCS 				  : std_logic := '0';
signal uCRd	  				  : std_logic := '0';
signal uCWr 				  : std_logic := '0';
signal uCA 	  				  : std_logic_vector(11 downto 0);
signal uCD 	  				  : std_logic_vector(15 downto 0);
signal iuCD 	  			  : std_logic_vector(15 downto 0);
signal GA 					  : std_logic_vector(1 downto 0);

-- Synchronous edge detectors of uC read and write strobes
signal WRDL 		: std_logic_vector(1 downto 0):=(others => '0');
signal RDDL 		: std_logic_vector(1 downto 0):=(others => '0');
signal uWRDL 		: std_logic_vector(1 downto 0):=(others => '0');
signal uRDDL 		: std_logic_vector(1 downto 0):=(others => '0');
signal AddrReg		: std_logic_vector(11 downto 0):=(others => '0');
signal uAddrReg		: std_logic_vector(11 downto 0):=(others => '0');

signal MaskReg				  : Array_2x8;
signal BufferRdAdd			  : Array_2x8x10;
signal BufferOut 			  : Array_2x8x16;

signal SlfTrgEn 			  : std_logic;
signal uBunch   			  : std_logic_vector(31 downto 0);
signal uBunchWrt			  : std_logic;

signal EvBuffRd				  : std_logic;
signal EvBuffOut			  : std_logic_vector(15 downto 0);
signal EvBuffEmpty			  : std_logic;
signal EvBuffWdsUsed		  : std_logic_vector(10 downto 0);

signal asp	: std_logic := '0';

Signal wea 					  : std_logic_vector(0 downto 0);
signal addra				  : std_logic_vector(9 downto 0):=(others => '0');
--signal addrb				  : std_logic_vector(9 downto 0):=(others => '0');
signal dina					  : std_logic_vector(15 downto 0):=(others => '0');

begin

--make the reset
reset 	<= '1', '0' after 13ns;
CpldRst <= '1', '0' after 12.5ns, '1' after 25ns;
ResetHi <= not CpldRst;


-- make the clocks
Clk80MHz  <= not Clk80MHz  after Clk80MHz_period/2;
Clk100MHz  <= not Clk100MHz  after Clk100MHz_period/2;
Clk160MHz <= not Clk160MHz after Clk160MHz_period/2;
Clk200MHz <= not Clk200MHz after Clk200MHz_period/2;
Clk560MHz <= not Clk560MHz after Clk560MHz_period/2;


data_back_AFE: Exclude_EVB
port map(
	SysClk			=> Clk160MHz,	 -- 160 MHz
	CpldRst			=> CpldRst,
	ResetHi			=> ResetHi,
-- Signals from/to AFE Buffer
	MaskReg			=> MaskReg,
	BufferRdAdd		=> BufferRdAdd,	
	BufferOut 		=> BufferOut, 	
-- Microcontroller strobes
	CpldCS			=> CpldCS,	
	uCRd			=> uCRd,
	uCWr 			=> uCWr, 	
-- Microcontroller data and address buses	
	uCA 			=> uCA,
	uCD 			=> uCD,
	iuCD 			=> iuCD,
-- Geographic address pins
	GA 				=> GA,
-- Synchronous edge detectors of uC read and write strobes
	WRDL 			=> WRDL
	);
	
Gen_Two_AFEs : for i in 0 to 1 generate
Gen_Eight_Chans : for k in 0 to 7 generate
AFEBuff : DPRAM_1Kx16
  PORT MAP ( 
	clka  => Clk80MHz, 
	wea   => wea, 
	addra => addra,	
    dina  => dina,	
	
	clkb  => Clk160MHz, -- 160 MHz
	addrb => BufferRdAdd(i)(k),
	doutb => BufferOut(i)(k)
);
end generate;
end generate;


Fill_RAM : process
begin 

	wait until rising_edge(CpldRst);
	for i in 0 to 1024 loop
	wea <= "1";
	addra <= std_logic_vector(unsigned(addra)+1);
	dina  <= std_logic_vector(unsigned(dina)+1);
	wait for Clk80MHz_period;
	end loop;

end process;	

uBunch_gen : process
begin 
	uBunch <= (others => '0');
	wait until rising_edge(Clk160MHz);
	for i in 0 to 1024 loop
	uBunchWrt <= '1';
	uBunch <= std_logic_vector(unsigned(uBunch)+1);
	wait for Clk80MHz_period;
	end loop;
	
end process;	

trigger_request: process
begin
	wait until rising_edge(Clk160MHz);
	SlfTrgEn	 	<= '1';

	MaskReg(0)		<= X"FF";
	MaskReg(1)		<= X"FF";
	wait for Clk10MHz_period*10;
	asp <= '1';
end process;


read_EvBuff: process
begin
	wait until rising_edge(asp);
	WRDL <= "01";
	uCA(9 downto 0) <= "11" & X"AA";
end process;


end Behavioral;
