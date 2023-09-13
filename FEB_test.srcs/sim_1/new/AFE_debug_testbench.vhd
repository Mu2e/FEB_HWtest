----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Micol Rigatti
-- 
-- Create Date: 08/22/2023 
-- Design Name: 
-- Module Name: AFE_debug_testbench - Behavioral
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

entity AFE_debug_testbench is
--  Port ( );
end AFE_debug_testbench;

architecture Behavioral of AFE_debug_testbench is

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
-- AFE serial control lines
signal AFEPDn 				: std_logic_vector(1 downto 0);
signal AFECS 				: std_logic_vector(0 downto 0);
signal AFERst 				: std_logic;
signal AFESClk            	: std_logic;
signal AFESDI  		        : std_logic;         
signal AFESDO 				: std_logic;

signal spi_enable   : std_logic;
signal spi_busy     : std_logic;
signal spi_tx_data  : std_logic_vector(23 downto 0);
signal spi_rx_data  : std_logic_vector(23 downto 0);
signal spi_addr_AFE : integer;


component spi_master is
    generic(
      slaves  : INTEGER := 1;  --number of spi slaves
      d_width : INTEGER := 24); --data bus width
    port(
      clock   : in std_logic;                             --system clock
      reset_n : in std_logic;                             --asynchronous reset
      enable  : in std_logic;                             --initiate transaction
      cpol    : in std_logic;                             --spi clock polarity
      cpha    : in std_logic;                             --spi clock phase
      cont    : in std_logic;                             --continuous mode command
      clk_div : in integer;                               --system clock cycles per 1/2 period of sclk
      addr    : in integer;                               --address of slave
      tx_data : in std_logic_vector(d_width-1 downto 0);  --data to transmit
      miso    : in std_logic;                             --master in, slave out
      sclk    : buffer std_logic;                             --spi clock
      ss_n    : buffer std_logic_vector(slaves-1 downto 0);   --slave select
      mosi    : out std_logic;                             --master out, slave in
      busy    : out std_logic;                             --busy / data ready signal
      rx_data : out std_logic_vector(d_width-1 downto 0)   --data received
      ); 
    end component;





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

--AFEspi : spi_master
--port map(
--  clock     => Clk100MHz, 
--  reset_n   => CpldRst, 
--  enable    => spi_enable, 
--  cpol      => '0',
--  cpha      => '0',
--  cont      => '0',
--  clk_div   => 8, -- 10 MHz
--  addr      => 0,
--  tx_data   => spi_tx_data,
--  miso      => AFESDO,         
--  sclk      => AFESClk,  
--  ss_n      => AFECS, 
--  mosi      => AFESDI, 
--  busy      => spi_busy,
--  rx_data   => spi_rx_data
--  ); 
--
--spi_enable <= '0', '1' after 300ns;



AFEControl : AFE_debug
port map(
    Clk_100MHz		=> Clk100MHz,
	ResetHi  		=> ResetHi,
-- Microcontroller strobes
    CpldRst			=> CpldRst,	
	CpldCS			=> CpldCS,
	uCWr 			=> uCWr, 
-- Microcontroller data and address buses	
    uCA 			=> uCA,
    uCD 			=> uCD,
-- Geographic address pins
    GA 				=> GA,
-- Synchronous edge detectors of uC read and write strobes
    uWRDL 			=> uWRDL,
-- AFE serial control lines
	AFEPDn 		    => AFEPDn,
	AFECS 		    => AFECS,
	AFERst 		    => AFERst,
	AFESClk         => AFESClk,
	AFESDI  	    => AFESDI,
	AFESDO 		    => AFESDO
);



global_signals_100MHz : process(Clk100MHz, CpldRst)
	begin 
	if CpldRst = '0' then

	elsif rising_edge (Clk100MHz) then
    end if; 
end process;


end Behavioral;


