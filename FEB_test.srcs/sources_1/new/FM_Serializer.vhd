----------------------- FM Serializer  ------------------------

-- Transmits an FM serial stream at 1/4 the clock rate. 
-- A 100MHz clock encodes 25MHz FM serial data
-- In lieu of a start bit, a preamble of two 1.5 bit periods (like Mil-1553) 
-- is appended to the FM bit stream

LIBRARY ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use IEEE.numeric_std.all;
Library UNISIM;
use UNISIM.vcomponents.all;

use work.Proj_Def.all;


entity FM_Tx is
generic (Pwidth : positive);
port(
	clock		: in std_logic;
	reset		: in std_logic;
	Enable 		: in std_logic;
	Data 		: in std_logic_vector(Pwidth - 1 downto 0);
	Tx_Out 		: buffer TxOutRec
);
end FM_Tx;

architecture FM_Behavioural of FM_Tx is

-- Serializer state machine
Type FMTx is (TxIdle,TxStrtA,TxStrtB,ShftTx,ParityTx);
signal Tx_State : FMTx;

-- Shift register, bit width counter
signal TxShft : std_logic_vector (Pwidth-1 downto 0);
signal TxBitWdth : std_logic_vector (2 downto 0);
-- Transmitted FM data, running parity bit
signal Parity,Tx_Req : std_logic;
signal EnDL : std_logic_vector (1 downto 0);

begin

FM_Encode : process(clock, reset)
-- Frame bit counter
variable TxBtCnt : integer range 0 to Pwidth-1;

begin
 if reset = '1' then 

	Tx_State 	<= TxIdle; 
	Tx_Out.FM 	<= '0';
	Tx_Out.Done <= '0'; 
	Parity 		<= '0';
	TxShft 		<= (others => '0'); 
	Tx_Req 		<= '0';
	TxBitWdth 	<= "000"; 
	TxBtCnt 	:= 0;
	EnDL 		<= "00";

elsif rising_edge(clock) then

	EnDL(0) <= Enable;
	EnDL(1) <= EnDL(0);

	if Tx_Req = '0' and Tx_State = TxIdle and EnDL = 1 
	then Tx_Req <= '1';
	elsif  Tx_Req = '1' and Tx_State = TxStrtA 
	then Tx_Req <= '0';
	else Tx_Req <= Tx_Req;
	end if;

   Case TxBitWdth is
	When "000" => TxBitWdth <= "001"; 
	When "001" => if Tx_Req = '1' then TxBitWdth <= "000"; else TxBitWdth <= "010"; end if;
	When "010" => TxBitWdth <= "011";
	When "011" => if Tx_State = TxStrtA or Tx_State = TxStrtB
			  then TxBitWdth <= "100";
			  else TxBitWdth <= "000";
			  end if;
	When "100" => if Tx_State = TxStrtA or Tx_State = TxStrtB
			  then TxBitWdth <= "101";
			  else TxBitWdth <= "000";
			  end if;
	When others => TxBitWdth <= "000";
   end Case;

-- FMTx TxIdle,TxStrtA,TxStrtB,ShftTx,ParityTx
Case Tx_State is
-- Send data on start
        When TxIdle => 
	 	 if Tx_Req = '1' and (TxBitWdth = "001" or TxBitWdth = "011")
		  then Tx_State <= TxStrtA;
			else Tx_State <= TxIdle;
			end if;
		When TxStrtA =>
		 if TxBitWdth = "101" then Tx_State <= TxStrtB;
		  else Tx_State <= TxStrtA;
		 end if;
 		When TxStrtB =>
		 if TxBitWdth = "101" then Tx_State <= ShftTx;
		  else Tx_State <= TxStrtB;
		 end if;
          When ShftTx =>
         if TxBitWdth = "011" and TxBtCnt = 0 then Tx_State <= ParityTx;
         else Tx_State <= ShftTx;
         end if;
           When ParityTx =>
         if TxBitWdth = "011" then Tx_State <= TxIdle;
         else Tx_State <= ParityTx;
         end if;
end case;

-- Two transitions per bit period is a 1, one transition a 0
 -- default state is a string of 1's
if ((TxBitWdth = "001" or TxBitWdth = "011") and Tx_State = TxIdle)
		  or TxBitWdth = "101" 	-- Start bit is defined 1 1/2 bit periods
					-- Number of data FM transitions is ShiftOut register data dependent
          or (Tx_State = ShftTx and ((TxShft(Pwidth-1) = '1' and TxBitWdth = "001") or TxBitWdth = "011"))
					-- Number of parity FM transitions is parity bit dependent
          or (Tx_State = ParityTx and ((Parity = '0' and TxBitWdth = "001") or TxBitWdth = "011"))
then Tx_Out.FM <= not Tx_Out.FM;
else Tx_Out.FM <= Tx_Out.FM;
end if;

-- data frames are "width" bits long 
if Tx_State = TxStrtB and TxBitWdth = "101"
  then TxBtCnt := (Pwidth-1);
elsif Tx_State = TxIdle then TxBtCnt := 0;
elsif Tx_State = ShftTx and TxBitWdth = "011" and TxBtCnt /= 0
	then TxBtCnt := TxBtCnt-1;
else TxBtCnt := TxBtCnt;
end if;
-- Load shift register with data byte at the beginning of the transmit sequence
-- load condition
if Tx_State = TxIdle and EnDL = 1
  then TxShft <= Data;
-- Shift one bit left (MSB first) during data portion of frame
-- shift condition
elsif Tx_State = ShftTx and TxBitWdth = "011" 
	then TxShft <= (TxShft(Pwidth-2 downto 0) & '0');
else TxShft <= TxShft;
end if;

  if (Parity = '1' and Tx_State = TxIdle) -- reset parity at start
  or (Tx_State = ShftTx and TxBitWdth = "011" and TxShft(Pwidth-1) = '0')
-- Toggle parity bit with each shifted out "0"
then Parity <= not Parity;
else Parity <= Parity;
end if;

-- Indicate when a frame has been shifted out
if TxBitWdth = "011" and Tx_State = ParityTx then Tx_Out.Done <= '1';
else Tx_Out.Done <= '0';
end if;

end if; -- reset

end process FM_Encode;

end FM_behavioural; -- of Serial_Tx
