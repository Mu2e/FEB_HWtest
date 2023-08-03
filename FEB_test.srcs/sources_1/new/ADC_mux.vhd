----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Micol Rigatti 
-- 
-- Create Date: 08/03/2023 10:11:37 AM
-- Design Name: 
-- Module Name: ADC_mux - Behavioral
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
use work.Debug_ILA.all;

entity ADC_Mux is
    port (
        Clk_100MHz			: in std_logic;
    -- Microcontroller strobes
        CpldRst				: in std_logic;
    -- Microcontroller data and address buses	
        uCA 				: in std_logic_vector(11 downto 0);
        uCD 				: in std_logic_vector(15 downto 0);
    -- Geographic address pins
        GA 					: in std_logic_vector(1 downto 0);
    -- Synchronous edge detectors of uC read and write strobes
        uWRDL 				: in std_logic_vector(1 downto 0);
    -- Analog Mux address lines
	    MuxEn               : out std_logic_vector(3 downto 0);
	    Muxad               : out std_logic_vector(1 downto 0);
    -- uController status registers
        MuxSelReg           : out std_logic_vector(2 downto 0);
        MuxadReg            : out std_logic_vector(1 downto 0)    
    );
end ADC_Mux;

architecture Behavioral of ADC_Mux is

begin 

mux : process(Clk_100MHz, CpldRst)
begin 
    if CpldRst = '0' then 
        MuxEn       <= X"0"; 
        Muxad       <= "00"; 
        MuxSelReg   <= "000"; 
        MuxadReg    <= "00";

    elsif rising_edge (Clk_100MHz) then 

    -- Analog multiplexer control lines
    if uWRDL = 1 and  uCA(11 downto 10) = GA and uCA(9 downto 0) = MuxCtrlAd then 
    	Case uCD(4 downto 2) is
    		When "100" =>   MuxEn <= "0001";
    		When "101" =>   MuxEn <= "0010";
    		When "110" =>   MuxEn <= "0100";
    		When "111" =>   MuxEn <= "1000";
    		When others =>  MuxEn <= "0000";
    	end case;
    -- Remap select lines since layout channel ordering is not monotonic
    	Case uCD(1 downto 0) is
    		When "00" =>    MuxAd <= "11";
    		When "01" =>    MuxAd <= "00";
    		When "10" =>    MuxAd <= "10";
    		When "11" =>    MuxAd <= "01";
    		When others =>  MuxAd <= "00";
    	end case;

    	MuxadReg <= uCD(1 downto 0);
    	MuxSelReg <= uCD(4 downto 2);
    end if;
end if;
end process; 

--with uCA(9 downto 0) select
--
--iCD <= 	 X"00" & "000" & MuxSelReg & MuxadReg when MuxCtrlAd,
--         X"0000" when others;

end Behavioral;