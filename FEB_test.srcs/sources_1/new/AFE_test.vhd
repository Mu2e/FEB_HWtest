----------------------------------------------------------------------------------
-- Company: FNAL
-- Engineer: Micol Rigatti <mrigatti@fnal.gov>
-- 
-- Create Date: 07/12/2023 
-- Design Name: FEB.vhd
-- Module Name: FEB - Behavioral
-- Project Name: CRV FEB
-- Target Devices: xc7s50fgga484-2
-- Tool Versions: 2023.1
-- Description: 

----------------------------------------------------------------------------------

LIBRARY ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use IEEE.numeric_std.all;
Library UNISIM;
use UNISIM.vcomponents.all;

use work.Proj_Def.all;
use work.Debug_ILA.all;

entity AFE_test is
port(
	-- 160 MHz VXO clock
	VXO_P, VXO_N			: in std_logic;
	-- 100 MHz VXO clock
--	ClkB_P, ClkB_N			: in std_logic;
	-- AFE Data lines
	AFE0Dat_P   			: in std_logic_vector(7 downto 0); -- LVDS pairs from an AFE chip (8 channels)
	AFE0Dat_N    			: in std_logic_vector(7 downto 0); 
	AFE1Dat_P 				: in std_logic_vector(7 downto 0);
	AFE1Dat_N    			: in std_logic_vector(7 downto 0);
	-- AFE Input clocks
	AFE0Clk_P, AFE0Clk_N	: out std_logic; -- Copy of 80MHz master clock sent to AFE chips
	AFE1Clk_P, AFE1Clk_N    : out std_logic;
	-- AFE clock, framing lines
	AFEDCLK_P, AFEDCLK_N	: in std_logic_vector(1 downto 0); -- Unused in this design 
	AFE0FCLK_P, AFE0FCLK_N	: in std_logic; -- LVDS pairs of the Frame Clock
	AFE1FCLK_P, AFE1FCLK_N	: in std_logic; -- LVDS pairs of the Frame Clock
	-- AFE serial control lines
	AFEPDn 				    : buffer std_logic_vector(1 downto 0);
	AFECS 				    : buffer std_logic_vector(1 downto 0);
	AFERst 				    : buffer std_logic;
	AFESClk			  	    : buffer std_logic;
	AFESDI			  	    : out std_logic;
	AFESDO 				    : in std_logic;
	-- Microcontroller strobes
	CpldRst					: in std_logic;
	CpldCS					: in std_logic;
	uCRd					: in std_logic;  -- On FEB v2 this PIN is routed to a dedicated PIN, so we jumper this to a DBG header (PIN U17)
	uCWr 					: in std_logic;
	-- Microcontroller data and address buses
	uCA 					: in std_logic_vector(11 downto 0);
	uCD 					: inout std_logic_vector(15 downto 0);
	-- Geographic address pins
	GA 						: in std_logic_vector(1 downto 0);
	-- Debug header 
	DBG	 					: out std_logic_vector(9 downto 1)
);
end AFE_test;

architecture behavioural of AFE_test is

-- Clocks
signal Clk_80MHz			  : std_logic;
signal Clk_100MHz			  : std_logic;	
signal Clk_200MHz			  : std_logic;
signal Clk_560MHz			  : std_logic;
signal SysClk				  : std_logic;   -- 160 Mhz
signal ResetHi         		  : std_logic;

-- Synchronous edge detectors of uC read and write strobes
signal WRDL 				  : std_logic_vector(1 downto 0);
signal RDDL 				  : std_logic_vector(1 downto 0);
signal uWRDL 				  : std_logic_vector(1 downto 0);
signal uRDDL 				  : std_logic_vector(1 downto 0);
signal AddrReg				  : std_logic_vector(11 downto 0);
signal uAddrReg				  : std_logic_vector(11 downto 0);	

-- AFE Interface logic signals
signal done		              : std_logic_vector(1 downto 0); 
signal warn		              : std_logic_vector(1 downto 0);
signal dout_AFE0		      : Array_8x14; 
signal dout_AFE1		      : Array_8x14;
signal SerdesRst			  : std_logic_vector(1 downto 0);


attribute mark_debug : string;
attribute mark_debug of uAddrReg: signal is "false";

signal AFE0FCLK             : std_logic; 
signal AFE1FCLK             : std_logic;
signal AFE0DATA             : std_logic; 
signal AFE1DATA             : std_logic; 
signal AFE0outCLK           : std_logic;

begin

ResetHi <= not CpldRst;

-- Global signals used to syncronize with the uC read/write requests
global_signals_160MHz : process(SysClk, CpldRst)
	begin 
	if CpldRst = '0' then
	WRDL 	<= "00";
	RDDL 	<= "00";
	AddrReg <= (others => '0'); 
	elsif rising_edge (SysClk) then
	-- Synchronous edge detectors for read and write strobes
	WRDL(0) <= not uCWR and not CpldCS;
	WRDL(1) <= WRDL(0);
	RDDL(0) <= not uCRD and not CpldCS;
	RDDL(1) <= RDDL(0);
		if RDDL = 1 or WRDL = 1 
		then AddrReg <= uCA;
		else AddrReg <= AddrReg;
		end if;
	end if;
end process;
	
global_signals_100MHz : process(Clk_100MHz, CpldRst)
	begin 
	if CpldRst = '0' then
	uWRDL 	<= "00"; 
	uRDDL 	<= "00";
	uAddrReg <= (others => '0');
	elsif rising_edge (Clk_100MHz) then
	-- Synchronous edge detectors for read and write strobes
	uWRDL(0) <= not uCWR and not CpldCS;
	uWRDL(1) <= uWRDL(0);	
	uRDDL(0) <= not uCRD and not CpldCS;
	uRDDL(1) <= uRDDL(0);
		if uRDDL = 1 or uWRDL = 1 
		then uAddrReg <= uCA;
		else uAddrReg <= uAddrReg;
		end if;
	end if;
end process;


OBUFDS_inst0: OBUFDS
generic map(IOSTANDARD=>"LVDS")
port map(I => Clk_80MHz, O => AFE0Clk_P, OB => AFE0Clk_N);

OBUFDS_inst1: OBUFDS
generic map(IOSTANDARD=>"LVDS")
port map(I => Clk_80MHz, O => AFE1Clk_P, OB => AFE1Clk_N); 

DEBUG_1 : IBUFDS
generic map (
	DIFF_TERM 	 => TRUE, -- Differential Termination
	IBUF_LOW_PWR => FALSE, -- Low power (TRUE) vs. performance (FALSE) setting for referenced I/O standards
	IOSTANDARD   => "LVDS")
port map (
	I  => AFE0FCLK_P, -- Diff_p buffer input (connect directly to top-level port)
	IB => AFE0FCLK_N, -- Diff_n buffer input (connect directly to top-level port)
	O  => AFE0FCLK);  -- Buffer output

DEBUG_2 : IBUFDS
generic map (
	DIFF_TERM 	 => TRUE, -- Differential Termination
	IBUF_LOW_PWR => FALSE, -- Low power (TRUE) vs. performance (FALSE) setting for referenced I/O standards
	IOSTANDARD   => "LVDS")
port map (
	I  => AFE1FCLK_P, -- Diff_p buffer input (connect directly to top-level port)
	IB => AFE1FCLK_N, -- Diff_n buffer input (connect directly to top-level port)
	O  => AFE1FCLK);  -- Buffer output

DEBUG_3 : IBUFDS
generic map (
	DIFF_TERM 	 => TRUE, -- Differential Termination
	IBUF_LOW_PWR => FALSE, -- Low power (TRUE) vs. performance (FALSE) setting for referenced I/O standards
	IOSTANDARD   => "LVDS")
port map (
	I  => AFE0Dat_P(0), -- Diff_p buffer input (connect directly to top-level port)
	IB => AFE0Dat_N(0), -- Diff_n buffer input (connect directly to top-level port)
	O  => AFE0DATA);  -- Buffer output

DEBUG_4 : IBUFDS
generic map (
	DIFF_TERM 	 => TRUE, -- Differential Termination
	IBUF_LOW_PWR => FALSE, -- Low power (TRUE) vs. performance (FALSE) setting for referenced I/O standards
	IOSTANDARD   => "LVDS")
port map (
	I  => AFE1Dat_P(0), -- Diff_p buffer input (connect directly to top-level port)
	IB => AFE1Dat_N(0), -- Diff_n buffer input (connect directly to top-level port)
	O  => AFE1DATA);  -- Buffer output

PLL :  PLL_0 
port map(
	clk_in1_p	=> VXO_P,
	clk_in1_n	=> VXO_N,
	resetn		=> CpldRst,

	Clk_100MHz	=> Clk_100MHz,
	Clk_200MHz	=> Clk_200MHz, 
	SysClk		=> SysClk,
	locked		=> open
);

HF_PLL : PLL_AFE 
port map(
	clk_in1		=> SysClk,
	resetn		=> CpldRst,

	Clk_80MHz	=> Clk_80MHz,
	Clk_560MHz	=> Clk_560MHz,
	locked		=> open
);


AFEControl : AFE_debug
port map(
    Clk_100MHz		=> Clk_100MHz,
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


------- DEBUG
DBG(1)	<= Clk_80MHz;
DBG(2)	<= SysClk;
DBG(3)	<= AFE0FCLK; 
DBG(4)	<= AFE1FCLK;
DBG(5)	<= AFE0DATA;
DBG(6)	<= AFE1DATA;
--DBG(7)	<= AFE0DATA;
--DBG(8)	<= AFE0FCLK;
-- DBG(9)	<= 


end behavioural;

