----------------------------------------------------------------------------------
-- Company: FNAL
-- Engineer: Micol Rigatti <mrigatti@fnal.gov>
-- 
-- Create Date: 11/23/2022 09:05:03 AM
-- Design Name: 
-- Module Name: 
-- Project Name: CRV FEB
-- Target Devices: xc7s50fgga484-2
-- Tool Versions: 2021.2
-- Description: 

----------------------------------------------------------------------------------

LIBRARY ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use IEEE.numeric_std.all;
Library UNISIM;
use UNISIM.vcomponents.all;

use work.Proj_Def.all;



entity Histogram is
port(
	Clk_80MHz	 			: in std_logic;
	Clk_100MHz	 			: in std_logic;	
	ResetHi	 				: in std_logic;
	-- Microcontroller strobes
	CpldRst					: in std_logic;
	-- Microcontroller data and address buses
	uCA 					: in std_logic_vector(11 downto 0);
	uCD 					: in std_logic_vector(15 downto 0);
	-- Geographic address pins
	GA 						: in std_logic_vector(1 downto 0);

	uAddrReg 				: in std_logic_vector(11 downto 0);	
	Diff_Reg				: inout Arrays_8x2x14;
	GateWidth	    		: in Array_2x12;
	GateReq 				: in std_logic_vector (1 downto 0);	
	uWRDL 					: in std_logic_vector(1 downto 0);
	uRDDL 					: in std_logic_vector(1 downto 0)
  );
end Histogram;

architecture behavioural of Histogram is


-- Histogrammer signals
signal HistGateCnt0 : std_logic_vector(15 downto 0);
signal HistGateCnt1 : std_logic_vector(15 downto 0);
signal HistInterval : std_logic_vector(15 downto 0);
signal HistChan 	: std_logic_vector(2 downto 0);
signal HistMode 	: std_logic;
signal Triplet 		: Arrays_2x3x14;
signal HistWidth	: Array_2x8;
signal WidthReg 	: std_logic_vector (7 downto 0);

-- signal HistEn : std_logic_vector(1 downto 0);
signal HistInit 	: std_logic_vector(1 downto 0);
signal HistEnReq 	: std_logic_vector(1 downto 0);
signal HistTimer 	: Array_2x2;
signal HistEnDl 	: Array_2x2;
signal HistEn	 	: std_logic_vector(1 downto 0);

Type Wen_Array is Array(0 to 1) of std_logic_vector(0 downto 0);
signal Hist_wena : Wen_Array;
signal Hist_wenb : Wen_Array;
signal HistAdaReg: Array_2x10;
signal HistAddra : Array_2x10;
signal HistAddrb : Array_2x11;
signal Hist_Data : Array_2x32;
signal Hist_Outa : Array_2x32;
signal Hist_Datb : Array_2x16;
signal Hist_Outb : Array_2x16;
signal Hist_Offset_Reg : signed(13 downto 0);

-- Timing interval counters
signal Counter1ms  : std_logic_vector (17 downto 0); 


begin

GenOnePerAFE : for i in 0 to 1 generate
-- 1024 x 32 Ram - 1/2 of the usable ADC range
Hist : Hist_Ram
port map (
	rsta  => ResetHi,
	rstb  => ResetHi,
	clka  => Clk_80MHz,
	clkb  => Clk_100MHz,
    wea   => Hist_wena(i),
	web   => Hist_wenb(i),
	addra => HistAddra(i), 
	addrb => HistAddrb(i),
    dina  => Hist_Data(i), 
	douta => Hist_Outa(i),
	dinb  => Hist_Datb(i), 
	doutb => Hist_Outb(i)
);
end generate;

uCregisters : process (Clk_100MHz, CpldRst)
begin 
if CpldRst = '0' then

	Hist_wenb 	<= (others => "0"); 
	HistAddrb 	<= (others => (others => '0')); 
	Hist_Datb 	<= (others => (others => '0'));  
	Hist_Offset_Reg <= "00" & X"FF6";
	Counter1ms 	<= (others => '0');
	
	WidthReg 	<= X"10";
	HistEnReq 	<= "00"; 
	HistInterval <= X"0800"; 
	HistMode 	<= '0'; 
	HistChan 	<= "000"; 
	HistEn		<= "00"; 
	HistGateCnt0 <= (others => '0');	
	HistGateCnt1 <= (others => '0'); 
	
	
elsif rising_edge (Clk_100MHz) then 
-------------------------- Histogram Control Registers ------------------
-- Specify the histogrammer accumulation interval
if uWRDL = 1 and uCA(11 downto 10) = GA and uCA(9 downto 0) = HistIntvalAd 
then HistInterval <= uCD(15 downto 0); 
else HistInterval <= HistInterval;
end if;

--Specify histogrammer offset
if uWRDL = 1 and uCA(11 downto 10) = GA and uCA(9 downto 0) = HistOfstAd
then Hist_Offset_Reg <= "00" & signed(uCD(11 downto 0));
else Hist_Offset_Reg <= Hist_Offset_Reg;
end if;

-- Specify which of the eight AFE channels to histogramm, whether or not to use an external gate
if uWRDL = 1 and ((uCA(11 downto 10) = GA and uCA(9 downto 0) = HistCtrlAd)
					  or uCA( 9 downto 0) = HistCtrlBroadCastAd)
 then HistChan <= uCD(2 downto 0);
		HistMode <= uCD(4);
else HistChan <= HistChan;
		HistMode <= HistMode;
end if; 

-- Gate width - determines the number of ADC sample per trigger and uCA(11 downto 10) = GA 
if uWRDL = 1 and uCA(9 downto 0) = GateAddr 
then WidthReg <= uCD(7 downto 0);
else WidthReg <= WidthReg;
end if;

-- Histogrammer enable logic

-- latch the request from the uC until the next 1ms count
 if HistEnReq(0) = '0' and uWRDL = 1 and uCA(11 downto 10) = GA 
	and uCA(9 downto 0) = HistCtrlAd and uCD(5) = '1'  
then HistEnReq(0) <= '1';
elsif HistEnReq(0) = '1' and HistGateCnt0 = 1 and Counter1ms = Count1ms
then HistEnReq(0) <= '0';
else HistEnReq(0) <=  HistEnReq(0);
end if;

-- Histogrammer accumulation timers
if HistEn(0) = '0' and HistGateCnt0 = 0 and HistEnReq(0) = '1' and Counter1ms = Count1ms
then HistGateCnt0 <= HistInterval;
elsif HistGateCnt0 /= 0 and Counter1ms = Count1ms 
then HistGateCnt0 <= HistGateCnt0 - 1;
else HistGateCnt0 <= HistGateCnt0;
end if;

-- Latch the histogram enable request from the uC until the next 1ms count
if HistEn(0) = '0' and HistGateCnt0 = 0 and HistEnReq(0) = '1' and Counter1ms = Count1ms
then HistEn(0) <= '1';
elsif HistEn(0) = '1' and HistGateCnt0 = 1 and Counter1ms = Count1ms 
then  HistEn(0) <= '0';
else  HistEn(0) <=  HistEn(0);
end if;

-- Define the histogrammer accumulation time
if HistEnReq(1) = '0' and uWRDL = 1 and uCA(11 downto 10) = GA 
	and uCA(9 downto 0) = HistCtrlAd and uCD(6) = '1'
then HistEnReq(1) <= '1';
elsif HistEnReq(1) = '1' and HistGateCnt1 = 1 and Counter1ms = Count1ms
then HistEnReq(1) <= '0';
else HistEnReq(1) <=  HistEnReq(1);
end if;

if HistEn(1) = '0' and HistGateCnt1 = 0 and HistEnReq(1) = '1' and Counter1ms = Count1ms
then HistGateCnt1 <= HistInterval;
elsif HistGateCnt1 /= 0 and Counter1ms = Count1ms 
then HistGateCnt1 <= HistGateCnt1 - 1;
else HistGateCnt1 <= HistGateCnt1;
end if;

if HistEn(1) = '0' and HistGateCnt1 = 0 and HistEnReq(1) = '1' and Counter1ms = Count1ms
then HistEn(1) <= '1';
elsif HistEn(1) = '1' and HistGateCnt1 = 1 and Counter1ms = Count1ms 
then  HistEn(1) <= '0';
else  HistEn(1) <=  HistEn(1);
end if;

-- Histogram memory pointers
if uWRDL = 1 and uCA(11 downto 10) = GA and uCA(9 downto 0) = HistPtrAd0 
	then HistAddrb(0) <= uCD(10 downto 0);
elsif (uRDDL = 2 or uWRDL = 2) and uAddrReg(11 downto 10) = GA and uAddrReg(9 downto 0) = HistRd0Ad  
	then HistAddrb(0) <= HistAddrb(0) + 1;
else HistAddrb(0) <= HistAddrb(0);
end if;

-- Diagnostic writes to the Hist Ram 0
if uWRDL = 1 and uCA(11 downto 10) = GA and uCA(9 downto 0) = HistRd0Ad 
then Hist_wenb(0) <= "1";
else Hist_wenb(0) <= "0";
end if;
-- Allow a write to Data Port B to use the memory for other purposes
Hist_Datb(0) <= uCD;

if uWRDL = 1 and uCA(11 downto 10) = GA and uCA(9 downto 0) = HistPtrAd1 
	then HistAddrb(1) <= uCD(10 downto 0);
elsif (uRDDL = 2 or uWRDL = 2) and uAddrReg(11 downto 10) = GA and uAddrReg(9 downto 0) = HistRd1Ad
	then HistAddrb(1) <= HistAddrb(1) + 1;
else HistAddrb(1) <= HistAddrb(1);
end if;

-- Diagnostic writes to the Hist Ram 1
if uWRDL = 1 and uCA(11 downto 10) = GA and uCA(9 downto 0) = HistRd1Ad 
then Hist_wenb(1) <= "1";
else Hist_wenb(1) <= "0";
end if;
-- Allow a write to Data Port B to use the memory for other purposes
Hist_Datb(0) <= uCD;



end if;
end process uCregisters;

Hist_Two_AFEs : for i in 0 to 1 generate
histogram_gen : process (Clk_80MHz, CpldRst)

begin

 if CpldRst = '0' then 
	
	Triplet(i) <= (others => "00" & X"000");
	HistTimer(i) <= "00"; 
	HistEnDl(i) <= "00";  
	Hist_wena(i) <= "0"; 
	HistAddra(i) <= (others => '0');	
	HistAdaReg(i) <= (others => '0');
    Hist_Data(i) <= (others => '0'); 
	HistInit(i) <= '0';
	HistWidth(i) <= (others => '0'); 

elsif rising_edge (Clk_80MHz) then

------------------------ Histogramming logic ----------------------------
-- First stage of the triplet register used for peak finding
case HistChan is
	When "000" => Triplet(i)(0) <= Diff_Reg(i)(0) - Hist_Offset_Reg;
	When "001" => Triplet(i)(0) <= Diff_Reg(i)(1) - Hist_Offset_Reg;
	When "010" => Triplet(i)(0) <= Diff_Reg(i)(2) - Hist_Offset_Reg;
	When "011" => Triplet(i)(0) <= Diff_Reg(i)(3) - Hist_Offset_Reg;
	When "100" => Triplet(i)(0) <= Diff_Reg(i)(4) - Hist_Offset_Reg;
	When "101" => Triplet(i)(0) <= Diff_Reg(i)(5) - Hist_Offset_Reg;
	When "110" => Triplet(i)(0) <= Diff_Reg(i)(6) - Hist_Offset_Reg;
	When "111" => Triplet(i)(0) <= Diff_Reg(i)(7) - Hist_Offset_Reg;
	When others =>  Triplet(i)(0) <= Triplet(i)(0);
 end case;

-- Second and third triplet registers
Triplet(i)(1) <= Triplet(i)(0);
Triplet(i)(2) <= Triplet(i)(1);

-- Counter used for enabling the histogrammer for a specific time associated 
-- with a trigger
if GateWidth(i) = 0  and GateReq(i) = '1' and HistWidth(i) = 0 
  then HistWidth(i) <= WidthReg;
elsif HistWidth(i) /= 0 
	then HistWidth(i) <= HistWidth(i) - 1;
else HistWidth(i) <= HistWidth(i);
end if;

-- Use these FFs to cross the clock boundary between sysclk and serdes clk
HistEnDl(i)(0) <= HistEn(i);
HistEnDl(i)(1) <= HistEnDl(i)(0);

-- Clear the histogram before beginning a new accumulation
if HistInit(i) = '0' and HistEnDl(i) = 1 
then HistInit(i) <= '1';
elsif HistInit(i) = '1' and HistAddra(i) = "11" & X"FF" 
then HistInit(i) <= '0';
else HistInit(i) <= HistInit(i);
end if;

-- Histogram read, increment, write. Go through some contortions to make it 
-- appear big endian when reading out..
if HistEnDl(i) = 1 or HistInit(i) = '1' 
then Hist_Data(i) <= (others => '0');
else
 if Hist_Outa(i)(31 downto 16) = X"FFFF" 
	then Hist_Data(i) <= Hist_Outa(i) + X"00010001";
 else Hist_Data(i) <= Hist_Outa(i) + X"00010000";
 end if;
end if;

-- If a peak is found, update the count for the correspnding bin.
-- Histogram write timer
if HistInit(i) = '0' and HistEnDl(i)(1) = '1' and HistTimer(i) = 0
					  and (HistWidth(i) /= 0 or HistMode = '0')
					  and Triplet(i)(1) > Triplet(i)(0) 
					  and Triplet(i)(1) > Triplet(i)(2)
then HistTimer(i) <= "01";
elsif HistTimer(i) /= 0
then HistTimer(i) <=  HistTimer(i) + 1;
end if;

-- Histogram memory address logic
if HistEnDl(i) = 1 
	then HistAddra(i) <= (others => '0');
elsif HistInit(i) = '1' 
	then HistAddra(i) <= HistAddra(i) + 1;
elsif HistInit(i) = '0' and HistEnDl(i)(1) = '1' and HistTimer(i) = 0
					  and (HistWidth(i) /= 0 or HistMode = '0')
					  and (Triplet(i)(1) > Triplet(i)(0)) 
					  and (Triplet(i)(1) > Triplet(i)(2))
then
   if Triplet(i)(1) > X"3FF" then HistAddra(i) <= "11" & X"FF";
elsif Triplet(i)(1) < X"000" then HistAddra(i) <= "00" & X"00";
 else HistAddra(i) <= std_logic_vector(Triplet(i)(1)(9 downto 0));
end if;
elsif HistTimer(i) = 2 then HistAddra(i) <= HistAdaReg(i);
else HistAddra(i) <= HistAddra(i);
end if;

if HistTimer(i) = 1 then HistAdaReg(i) <= HistAddra(i);
else HistAdaReg(i) <= HistAdaReg(i);
end if;

-- Histogram memory write strobe
if HistInit(i) = '1' or HistTimer(i) = 3 then Hist_wena(i) <= "1";
else Hist_wena(i) <= "0";
end if;

-----------------------------------------------------------------------------
end if;
end process histogram_gen;
end generate;

end behavioural;