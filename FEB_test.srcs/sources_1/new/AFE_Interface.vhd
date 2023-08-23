----------------------------------------------------------------------------------
-- Company: FNAL
-- Engineer: Micol Rigatti <mrigatti@fnal.gov>
-- 
-- Create Date: 09/09/2022 09:05:03 AM
-- Design Name: AFE_Interface.vhd
-- Module Name: AFE_Interface - Behavioral
-- Project Name: CRV FEB
-- Target Devices: xc7s50fgga484-2
-- Tool Versions: 2021.2
-- Description: Based on the project of Jamieson Olsen <jamieson@fnal.gov> 
 
----------------------------------------------------------------------------------

LIBRARY ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use IEEE.numeric_std.all;
Library UNISIM;
use UNISIM.vcomponents.all;

use work.Proj_Def.all;
use work.Debug_ILA.all;

-- The 7series FPGAs ISERDESE2 modules when in DDR mode and cascaded together, 
-- only support 10 and 14 bit transmission modes. The AFE chip used on the CRV 
-- FEB board is AFE5807ZCF and it supports 12 and 14 bit transmission mode.
-- In this configuration ISERDESE2 and the AFE chips are set in 14 bit mode. 


entity AFE_Interface is
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
end AFE_Interface;

architecture AFE_Interface_Architecture of AFE_Interface is

    component auto_afe
    port(
        afe_p: in std_logic_vector(8 downto 0);
        afe_n: in std_logic_vector(8 downto 0);
        clock:   in  std_logic;  -- master clock 
        clock7x: in  std_logic;  -- 7 x master clock
        reset:   in  std_logic;
        done:    out std_logic;
        warn:    out std_logic;
        dout:    out Array_8x14
      );
    end component;

    signal ClkOut_80MHz			: std_logic;
    signal rst_reg			 	: std_logic_vector(15 downto 0);
    signal idelayctrl_rst_reg	: std_logic;
	signal afe0_p, afe0_n	    : std_logic_vector(8 downto 0);
	signal afe1_p, afe1_n		: std_logic_vector(8 downto 0);	


begin

--    -- Forward the 80MHz Master clock to the 2 AFEs
--    ODDR_inst: ODDR --Dedicated Dual Data Rate (DDR) Output Register
--	generic map( DDR_CLK_EDGE => "OPPOSITE_EDGE" )
--	-- OPPOSITE_EDGE mode The data transmit interface uses classic DDR methodology. 
--	-- Given a data and clock at pin D1-2 and C respectively, D1 is sampled at every 
--	-- positive edge of clock C and D2 is sampled at every negative edge of clock C. 
--	-- Q changes every clock edge.
--    port map(
--        Q => ClkOut_80MHz, 
--        C => Clk_80MHz,
--        CE => '1',
--        D1 => '1',
--        D2 => '0',
--        R  => '0',
--        S  => '0');

    OBUFDS_inst0: OBUFDS
        generic map(IOSTANDARD=>"LVDS")
        port map(I => Clk_80MHz, O => AFE0Clk_P, OB => AFE0Clk_N);

    OBUFDS_inst1: OBUFDS
        generic map(IOSTANDARD=>"LVDS")
        port map(I => Clk_80MHz, O => AFE1Clk_P, OB => AFE1Clk_N);

-- The AFE chips are running with an 80MHz clock and they are in 14 bit mode
-- therefore the data rate per LVDS pair is 1.120Gbps and the data bit width 
-- is 892ps. 
-- Due to routing and clock buffer delay inside the FPGA grid, DCLK (the x7 clock
-- sampling data) must be repositioned for capturing data and frame signals. This is 
-- achieved by inserting and IDELAY on the data and frame line.
-- In the FPGA the IDELAY is clocked with a 200MHz refclk, therefore
-- each IDELAY tap is a delay of 78ps. Thus the data bit width in IDELAY taps
-- is 892ps/78ps = 11.4.... lets call it 12. The automatic alignment FSM needs
-- to know this number when it is hunting for the center of the bit.

	-- Make the special reset pulse for the IDELAYCTRL module. needs to be 59.28ns minimum
    rst_proc: process(Clk_200MHz)
    begin
        if rising_edge(Clk_200MHz) then -- sampling @ 200MHz
            rst_reg <= rst_reg(14 downto 0) & reset;
            if (rst_reg = X"0000") then
                idelayctrl_rst_reg <= '0';
            else
                idelayctrl_rst_reg <= '1';  -- high for 80ns
            end if;
        end if;
    end process rst_proc;
    
    -- This controller is required for calibrating IDELAY elements
    IDELAYCTRL_inst: IDELAYCTRL
        port map(
            REFCLK => Clk_200MHz,
            RST    => idelayctrl_rst_reg, -- minimum pulse width is 60ns! MUST pulse this before using idelay!
            RDY    => open);

    -- Make 2 automatic AFE modules
	
	afe0_p <= AFE0FCLK_P & AFE0Dat_P;  
	afe0_n <= AFE0FCLK_N & AFE0Dat_N;
	afe1_p <= AFE1FCLK_P & AFE1Dat_P; 
	afe1_n <= AFE1FCLK_N & AFE1Dat_N;
	
    afe0_inst: auto_afe
    port map(
        afe_p   => afe0_p,
        afe_n   => afe0_n,
        clock   => Clk_80MHz,
        clock7x => Clk_560MHz,
        reset   => reset,
        done    => done(0),
        warn    => warn(0),
        dout    => dout_afe0
    );

    afe1_inst: auto_afe
    port map(
        afe_p   => afe1_p,
        afe_n   => afe1_n,
        clock   => Clk_80MHz,
        clock7x => Clk_560MHz,
        reset   => reset,
        done    => done(1),
        warn    => warn(1),
        dout    => dout_afe1
    );



--generateILA0: if true generate
--
--    AFE_ila1: AFE_ila_1
--    port map(
--    clk    		=> Clk_560MHz, 	
--    probe0(0) 	=> Clk_80MHz, --AFE0Clk_P, -- out 80 MHz
--    probe1   	=> afe0_p(7 downto 0),--AFE0Dat_P, -- in std_logic_vector(7 downto 0)	
--    probe2(0) 	=> afe0_p(8) -- in frame clock 	
--);
--
--end GENERATE;

end AFE_Interface_Architecture;
