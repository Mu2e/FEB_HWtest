
------------------------------ FM Deserializer ----------------------------
-- Receives an FM serial stream at 1/8 the clock rate. 
-- e.g. A 200MHz clock (rxclock) decodes 25MHz FM serial data
-- A preamble of two 1.5 bit periods (like Mil-1553) appended to the FM 
-- serial stream is expected. The done signal is synchronized to sysclk

LIBRARY ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use IEEE.numeric_std.all;
Library UNISIM;
use UNISIM.vcomponents.all;

use work.Proj_Def.all;

entity FM_Rx is
generic (Pwidth : positive);
port(
	SysClk		: in std_logic;
	RxClk		: in std_logic;
	reset 		: in std_logic;
	Rx_In 		: in RxInRec;
	data 		: buffer std_logic_vector(Pwidth-1 downto 0 );
	Rx_Out 		: buffer RxOutRec
);
end FM_Rx;

architecture behavioural_Rx of FM_Rx is

Type FMRx is (RxIdle,RxStrt,RxShift,ParityRx);
Signal Rx_State : FMRx;
-- Registers for FM decoder
-- Shift register, bit width counter
signal RxBitWdth : std_logic_vector (3 downto 0);
-- Edge detector for incoming FM data
signal RxDl : std_logic_vector (1 downto 0);
-- Transmitted FM data, running parity bit
signal RxParity,Rx_NRZ : std_logic;
signal RxBtCnt_sig : integer range 0 to 23;
begin

FM_Decode : process(RxClk, reset)

-- Frame bit counter
variable RxBtCnt : integer range 0 to Pwidth-1;
begin
 if reset = '1' then 

	Rx_State 	<= RxIdle; 
	RxDl 		<= "00"; 
	RxParity 	<= '0'; 
	Rx_Out.Parity_Err <= '0';
	data 		<= (others => '0'); 
	RxBtCnt 	:= 0; 
	Rx_NRZ 		<= '0'; 
	RxBitWdth	<= "0000";
	RxBtCnt_sig <= 0; 
elsif rising_edge(RxClk) then

-- Synchronous edge detector for input
RxDl(0) <= Rx_In.FM;
RxDl(1) <= RxDl(0);

-- Reset sampling counter with every clock transition while decoder is idle.
-- Otherwise reset only once per bit period
if (RxDl(1) = '1' xor RxDl(0) = '1') and (RxBitWdth > "0100" or Rx_State = RxIdle)
  then RxBitWdth <= "0000";
elsif RxBitWdth /= "1111" and 
	not((RxDl(1) = '1' xor RxDl(0) = '1') and (RxBitWdth > "0100" or Rx_State = RxIdle))
  then RxBitWdth <= RxBitWdth + 1;
else RxBitWdth <= RxBitWdth;
end if;

-- RxIdle,RxStrt,RxShift,ParityRx 
Case Rx_State is
    When RxIdle =>
      if RxBitWdth = 8 then 
		Rx_State <= RxStrt;
      else 
		Rx_State <= RxIdle;
      end if;
    When RxStrt =>
     if RxBitWdth = 8 then 
		Rx_State <= RxShift;
	  elsif ((RxDl(1) = '1' xor RxDl(0) = '1') and RxBitWdth < 8)
		  or RxBitWdth = 15 then 
		Rx_State <= RxIdle;
      else 
		Rx_State <= RxStrt;
     end if;
    When RxShift =>
      if RxBtCnt = 0 and RxBitWdth = 6 then 
		Rx_State <= ParityRx;
	   elsif RxBitWdth = 15 then 
		Rx_State <= RxIdle;
      else 
		Rx_State <= RxShift;
      end if;
     When ParityRx =>
      if RxBitWdth = 6 or RxBitWdth = 15 then 
		Rx_State <= RxIdle;
     else 
		Rx_State <= ParityRx;
      end if;
end case;

-- Serial data from FM is 1 if transition is in the middle of the bit period,
-- 0 if it is at the end 
if Rx_NRZ = '1' and (RxDl(1) = '1' xor RxDl(0) = '1') and RxBitWdth > 4
then Rx_NRZ <= '0';
elsif  Rx_NRZ = '0' and (RxDl(1) = '1' xor RxDl(0) = '1') and RxBitWdth <= 4
then Rx_NRZ <= '1';
else Rx_NRZ <= Rx_NRZ;
end if;

-- Serial data frame is "width" bits long
if Rx_State = RxStrt and RxBitWdth = 8 then 
	RxBtCnt := (Pwidth-1);
	RxBtCnt_sig <= 23;
elsif Rx_State = RxIdle then 
	RxBtCnt := 0;
	RxBtCnt_sig <= 0;
elsif Rx_State = RxShift and RxBitWdth = 6 and RxBtCnt /= 0 then 
	RxBtCnt := RxBtCnt - 1;
	RxBtCnt_sig <= RxBtCnt_sig -1;
else 
	RxBtCnt := RxBtCnt;
	RxBtCnt_sig <= RxBtCnt_sig;
end if;

-- Shift register
if Rx_State = RxShift and RxBitWdth = 6  
then data <= (data(Pwidth-2 downto 0) & Rx_NRZ);
else data <= data;
end if;

-- Parity bit toggles for each zero bit 
if  (Rx_State = RxShift and RxBitWdth = 6 and Rx_NRZ = '0')
 or (RxParity = '1' and Rx_State = RxStrt)
then RxParity <= not RxParity;
else RxParity <= RxParity;
end if;

-- If transmitted parity doesn't match the running parity, parity error 
if (Rx_Out.Parity_Err = '1' and Rx_In.Clr_Err = '1')
or (Rx_Out.Parity_Err = '0' and (Rx_NRZ = '1' xor RxParity = '0') and Rx_State = ParityRx
                 and (RxDl(1) = '1' xor RxDl(0) = '1') and RxBitWdth = "0110")
then Rx_Out.Parity_Err <= not Rx_Out.Parity_Err;
else Rx_Out.Parity_Err <= Rx_Out.Parity_Err;
end if;

-- Hold Rx done high for one sysclck period.
if Rx_State = ParityRx and RxBitWdth = 6 then Rx_Out.Done <= '1';
else Rx_Out.Done <= '0';
end if;

end if; -- rising edge

end process FM_Decode;

end behavioural_Rx; -- of Serial_Rx
