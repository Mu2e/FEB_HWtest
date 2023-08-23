----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Micol Rigatti
-- 
-- Create Date: 08/16/2023 11:13:24 AM
-- Design Name: 
-- Module Name: AFE_Interface_testbench - Behavioral
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

entity AFE_Interface_testbench is
--  Port ( );
end AFE_Interface_testbench;

architecture Behavioral of AFE_Interface_testbench is

component AFE_Interface is
  Port (
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
			    
    -- FPGA interface       
    Clk_80MHz			    : in  std_logic; 	-- Master clock 80MHz
    Clk_100MHz			    : in  std_logic; 	-- uController clock 
    Clk_560MHz			    : in  std_logic; 	-- 7 x Master clock = 560MHz
    Clk_200MHz			    : in  std_logic; 	-- 200 MHz refclk for the IDELAY2
    reset				    : in  std_logic;
    done				    : out std_logic_vector(1 downto 0); -- status of automatic alignment FSM
    warn				    : out std_logic_vector(1 downto 0); -- pulse to indicate an error was seen in the FCLK pattern
    dout_afe0				: out Array_8x14; -- data synchronized to clock
    dout_afe1				: out Array_8x14  -- data synchronized to clock
	);
end component;
 

component AFE5807 is
    generic(clkadc_period: time := 12.5ns);
    port(
        clkadc_p, clkadc_n  : in std_logic;
        afe_p, afe_n: out std_logic_vector(7 downto 0);
        afe_f_p, afe_f_n: out std_logic
      );
end component;





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

-- AFE Interface logic signals
signal done		              : std_logic_vector(1 downto 0); 
signal warn		              : std_logic_vector(1 downto 0);
signal dout_AFE0		      : Array_8x14; 
signal dout_AFE1		      : Array_8x14;
signal SerdesRst			  : std_logic_vector(1 downto 0);

signal AFEout_frdata_p        : std_logic_vector(8 downto 0);
signal AFEout_frdata_n        : std_logic_vector(8 downto 0);

-- AFE Input clocks
signal AFE0Clk_P              : std_logic; 
signal AFE0Clk_N              : std_logic; 
signal AFE1Clk_P              : std_logic; 
signal AFE1Clk_N              : std_logic; 
-- AFE Data lines
signal AFE0Dat_P              : std_logic_vector(7 downto 0); 
signal AFE0Dat_N              : std_logic_vector(7 downto 0); 
signal AFE1Dat_P              : std_logic_vector(7 downto 0); 
signal AFE1Dat_N              : std_logic_vector(7 downto 0); 
-- AFE clock, framing lines
signal AFEDCLK_P              : std_logic_vector(1 downto 0); 
signal AFEDCLK_N              : std_logic_vector(1 downto 0); 
signal AFE0FCLK_P             : std_logic; 
signal AFE0FCLK_N             : std_logic; 
signal AFE1FCLK_P             : std_logic; 
signal AFE1FCLK_N             : std_logic; 
           

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

AFE1: AFE5807
--    generic(clkadc_period: time := 12.5ns);
port map(
    
    clkadc_p    => Clk560MHz,
    clkadc_n    => not Clk560MHz, 
    afe_p       => AFE0Dat_P,
    afe_n       => AFE0Dat_N,
    afe_f_p     => AFE0FCLK_P,
    afe_f_n     => AFE0FCLK_N
);

AFE2: AFE5807
--    generic(clkadc_period: time := 12.5ns);
port map(
    
    clkadc_p    => Clk560MHz,
    clkadc_n    => not Clk560MHz, 
    afe_p       => AFE1Dat_P,
    afe_n       => AFE1Dat_N,
    afe_f_p     => AFE1FCLK_P,
    afe_f_n     => AFE1FCLK_N
);


AFE_Interface_inst: AFE_Interface 
port map(
        -- AFE Input clocks
        AFE0Clk_P    => AFE0Clk_P,
        AFE0Clk_N    => AFE0Clk_N,
        AFE1Clk_P    => AFE1Clk_P,
        AFE1Clk_N    => AFE1Clk_N,
        -- AFE Data lines
        AFE0Dat_P    => AFE0Dat_P,
        AFE0Dat_N    => AFE0Dat_N,
        AFE1Dat_P    => AFE1Dat_P,
        AFE1Dat_N    => AFE1Dat_N,
        -- AFE clock
        AFEDCLK_P    => AFEDCLK_P,
        AFEDCLK_N    => AFEDCLK_N,
        AFE0FCLK_P   => AFE0FCLK_P,
        AFE0FCLK_N   => AFE0FCLK_N,
        AFE1FCLK_P   => AFE1FCLK_P,
        AFE1FCLK_N   => AFE1FCLK_N,
                   
        -- FPGA interface       
        Clk_80MHz	=> Clk80MHz, 
        Clk_100MHz	=> Clk100MHz,
        Clk_560MHz	=> Clk560MHz,
        Clk_200MHz	=> Clk200MHz,
        reset		=> reset, 
        done		=> done,
        warn		=> warn,
        dout_afe0	=> dout_afe0,
        dout_afe1	=> dout_afe1
                                  
      );


global_signals_100MHz : process(Clk100MHz, CpldRst)
	begin 
	if CpldRst = '0' then

	elsif rising_edge (Clk100MHz) then
    end if; 
end process;


end Behavioral;


