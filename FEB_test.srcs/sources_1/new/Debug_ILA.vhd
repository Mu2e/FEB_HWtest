----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/13/2023 05:45:35 PM
-- Design Name: 
-- Module Name: Debug_ILA - Behavioral
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

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

package Debug_ILA is

component uC_ILA is
port (
	clk    : in std_logic;
	probe0 : in std_logic_vector(0 downto 0);
    probe1 : in std_logic_vector(0 downto 0);
    probe2 : in std_logic_vector(0 downto 0);
    probe3 : in std_logic_vector(0 downto 0);
    probe4 : in std_logic_vector(11 downto 0);
    probe5 : in std_logic_vector(15 downto 0);
    probe6 : in std_logic_vector(1 downto 0);
	probe7 : in std_logic_vector(1 downto 0);
	probe8 : in std_logic_vector(1 downto 0);
	probe9 : in std_logic_vector(1 downto 0);
	probe10 : in std_logic_vector(1 downto 0)
);
end component;


end package;
