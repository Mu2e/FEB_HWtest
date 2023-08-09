LIBRARY ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use IEEE.numeric_std.all;
Library UNISIM;
use UNISIM.vcomponents.all;

use work.Proj_Def.all;
use work.Debug_ILA.all;

entity Trigger is
  Port (
  	SysClk				: in std_logic; -- 160 MHz
	ResetHi  			: in std_logic;
-- Signals for other logic
	TrigReq				: buffer std_logic;
	SlfTrgEn 			: buffer std_logic;
	BeamOn 				: buffer std_logic;
	uBunch   			: buffer std_logic_vector(31 downto 0);
	uBunchWrt			: buffer std_logic;
	GPO			 		: out std_logic;
-- Microcontroller strobes
	CpldRst				: in std_logic;
	CpldCS				: in std_logic;
	uCRd				: in std_logic;
	uCWr 				: in std_logic;
-- Microcontroller data and address buses	
	uCA 				: in std_logic_vector(11 downto 0);
	uCD 				: in std_logic_vector(15 downto 0);
-- Geographic address pins
	GA 					: in std_logic_vector(1 downto 0);
-- Synchronous edge detectors of uC read and write strobes
	WRDL 				: in std_logic_vector(1 downto 0);
-- LED/Flash Gate select line
	PulseSel 			: inout std_logic;
-- LED pulser/Flash Gate
	Pulse 				: out std_logic;
	LEDSrc				: out std_logic;
	GPI0 				: in std_logic;
-- uController status registers
	FlashEn  			: buffer std_logic;
	TurnOnTime  		: buffer std_logic_vector (8 downto 0);
	TurnOffTime 		: buffer std_logic_vector (8 downto 0);
	LEDTime	   			: buffer std_logic_vector (8 downto 0);
	TmgSrcSel			: buffer std_logic 

	);
end Trigger;

architecture Trigger_arch of Trigger is

signal RxIn     : RxInRec;
signal RxOut    : RxOutRec;
signal Rx1Dat   : std_logic_vector(23 downto 0);
signal Rx1DatReg: std_logic_vector(23 downto 0);
-- uC data bus
signal TrigType : std_logic_vector(11 downto 0);
-- Counter that determines the trig out pulse width
signal GPOCount : std_logic_vector(2 downto 0);
-- trigger logic signals

signal TrigReqD : std_logic; 

signal FlashGate: std_logic;
-- Timing interval counters
signal GateCounter : std_logic_vector (8 downto 0);

-- Self trigger signals
signal uBunchGuard : std_logic;

attribute DONT_TOUCH : string;

attribute mark_debug : string;
-- attribute mark_debug of TrigReq 		 : signal is "true";

constant FMSim : AddrPtr := "00" & X"78";
signal Rx1Dat20LSB : std_logic;



begin

RxIn.FM <= GPI0; 

-- FM Receiver for microbunch number
FMRx1 : FM_Rx 
generic map(Pwidth => 24)
port map(
	SysClk => SysClk, 
	RxClk  => SysClk, 
	reset  => ResetHi,
	Rx_In  => RxIn,
	Data   => Rx1Dat, 
	Rx_Out => RxOut
);


main : process(SysClk, CpldRst)
begin 
-- asynchronous reset/preset
if CpldRst = '0' then

	TrigReq 	<= '0';
	TrigReqD 	<= '0';
	GPOCount 	<= "000";
	GPO 		<= '0';
	SlfTrgEn 	<= '0';
	GateCounter <= '0' & X"00";
	TurnOnTime 	<= '0' & X"01";
	TurnOffTime <= '0' & X"70";  	
	LEDTime 	<= '0' & X"30"; 
	TmgSrcSel 	<= '0';
	FlashEn 	<= '0';
	PulseSel 	<= '0';
	LEDSrc 		<= '0'; 
	BeamOn 		<= '0';
	FlashGate 	<= '0';
	TrigType 	<= X"000"; 
	uBunchGuard <= '0';
	uBunch 		<= (others => '0');
	uBunchWrt 	<= '0'; 
	Rx1DatReg 	<= (others => '0');
	Rx1Dat20LSB <= '0';

elsif rising_edge (SysClk) then
 
if WRDL = 1 and uCA(9 downto 0) = FlashCtrlAddr then 
	-- Flash gate enable bit
	FlashEn <= uCD(0);
	-- Choose between LED and flashgate
	PulseSel <= uCD(1);
	-- Select source for LED flasher pulse
	LEDSrc <= uCD(2);
end if;

-- Register for determining the turn on time 
if WRDL = 1 and uCA(9 downto 0) = OnTimeAddr
then TurnOnTime <= uCD(8 downto 0);
else TurnOnTime <= TurnOnTime;
end if;

-- Register for determining the turn off time  
if WRDL = 1 and uCA(9 downto 0) = OffTimeAddr
then TurnOffTime <= uCD(8 downto 0);
else TurnOffTime <= TurnOffTime;
end if;

if WRDL = 1 and uCA(9 downto 0) = LEDTimeAddr
then LEDTime <= uCD(8 downto 0);
else LEDTime <= LEDTime;
end if;

-- Trigger control register bits
if WRDL = 1 and uCA(9 downto 0) = IntTrgEnAddr then
	TmgSrcSel <= uCD(0); 
	SlfTrgEn <= uCD(1);
else 
	SlfTrgEn <= SlfTrgEn;
	TmgSrcSel <= TmgSrcSel;
end if;
----------------------- Flash gate logic ----------------------

-- Counter for timing the flash gate. 270 counts at 159 MHz = 1.695 ns
if (GateCounter = 270 and TmgSrcSel = '1') 
	or	(SlfTrgEn = '1' and RxOut.Done = '1' and Rx1Dat(20) = '1') 
	or TmgSrcSel = '0' or FlashEn = '0' then 
		GateCounter <= (others => '0');
else 
		GateCounter <= GateCounter + 1;
end if;

if SlfTrgEn = '1' and RxOut.Done = '1' and Rx1Dat(20) = '1' then
	BeamOn <= '1';
elsif SlfTrgEn = '1' and RxOut.Done = '1' and Rx1Dat(20) = '0' then
	BeamOn <= '0';
--else 
--	BeamOn <= BeamOn;
end if;


-- "Turn on" in this case means reducing the SiPM voltage, "turn off"
-- means restoring to its nominal value
if GateCounter = TurnOnTime and FlashEn = '1' and PulseSel = '1' 
	then FlashGate <= '1';
elsif GateCounter = TurnOffTime 
	then FlashGate <= '0';
else FlashGate <= FlashGate;
end if;

if FlashEn = '1' and
     ((PulseSel = '0' and (GateCounter = LEDTime or GateCounter = LEDTime + 1))
   or (PulseSel = '1' and FlashGate = '1'))
then Pulse <= '1';
else Pulse <= '0';
end if;

------------------------------- Trigger Logic ----------------------------
-- Trig out width counter
if GPOCount = 0 and TrigReq = '1' then 
	GPOCount <= "111";
elsif GPOCount /= 0 then 
	GPOCount <= GPOCount - 1;
else 
	GPOCount <= GPOCount;
end if;

-- Trig Out or SpillGate on the GPO LEMO.
if TrigReq = '1' then 
	GPO <= '1';
elsif GPOCount = 1 then 
	GPO <= '0';
--else GPO <= GPO;
end if;

-- Buff reset will clear the FM receiver parity error (if any)
if WRDL = 1 and uCD(7) = '1' 
	and ((uCA(11 downto 10) = GA and uCA(9 downto 0) = CSRRegAddr) 
											or uCA(9 downto 0) = CSRBroadCastAd)
then RxIn.Clr_Err <= '1';
else RxIn.Clr_Err <= '0';
end if;

-- Latch the trigger type
-- If internally generated use these bits
-- if externally generated use the trigger type field from the trigger message
if RxOut.Done = '1' 
then TrigType <=  X"00" & Rx1Dat(23 downto 20);
else TrigType <= TrigType;
end if;

if RxOut.Done = '1' and Rx1Dat(21) = '1' and Rx1Dat(19 downto 0) = X"00000" and uBunchGuard = '0'
then uBunch(31 downto 20) <= uBunch(31 downto 20) + 1;
	 uBunch(19 downto 0) <= (others => '0');
	 uBunchGuard <= '1';
elsif RxOut.Done = '1' and Rx1Dat(21) = '1' and Rx1Dat(19 downto 0) /= 0 
then uBunch <= uBunch(31 downto 20) & Rx1Dat(19 downto 0); 
	 uBunchGuard <= '0';
elsif RxOut.Done = '1' and Rx1Dat(21) = '0'
then uBunch <= X"000" & Rx1Dat(19 downto 0); 
	 uBunchGuard <= '0';
else uBunch <= uBunch; 
	 uBunchGuard <= uBunchGuard;
end if;

-- Write uBunch number at the uBunch beginning
if RxOut.Done = '1' and SlfTrgEn = '1' then
	uBunchWrt <= '1';
else 
	uBunchWrt <= '0';
end if;

if RxOut.Done = '1' then 
	Rx1DatReg <= Rx1Dat;
else 
	Rx1DatReg <= Rx1DatReg;
end if;


if SlfTrgEn = '1' and ((GateCounter = TurnOnTime and TmgSrcSel = '1')
   or (RxOut.Done = '1' and TmgSrcSel = '0')) then 
	TrigReq <= '1';
elsif TrigReqD = '1' then 
	TrigReq <= '0'; 
end if;
	
TrigReqD <= TrigReq;

end if;
end process;

-- =========================================================================
-- ===========================     ILA    ==================================
-- =========================================================================

generateILA: if false generate

	Trigger_ila_inst: Trigger_ila 
	port map(
	clk    		=> SysClk,
	probe0(0) 	=> TrigReq,
    probe1(0) 	=> SlfTrgEn,
    probe2(0) 	=> BeamOn,
    probe3(0) 	=> uBunchGuard,    
    probe4 		=> uBunch,   
    probe5(0) 	=> uBunchWrt,
	probe6 		=> Rx1Dat,
	probe7(0) 	=> RxOut.Done
);

end GENERATE; 

end Trigger_arch;


-- Rx1DatReg mi pare inutile 

