----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Micol Rigatti 
-- 
-- Create Date: 08/03/2023 17:22:45 
-- Design Name: 
-- Module Name: DAC - Behavioral
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

entity DAC is
    port (
        Clk_100MHz			: in std_logic;
        ResetHi			    : in std_logic;
    -- Microcontroller strobes
        CpldRst				: in std_logic;
        CpldCS				: in std_logic;
        uCWr 				: in std_logic;
    -- Microcontroller data and address buses	
        uCA 				: in std_logic_vector(11 downto 0);
        uCD 				: in std_logic_vector(15 downto 0);        
    -- Geographic address pins
        GA 					: in std_logic_vector(1 downto 0);
    -- Synchronous edge detectors of uC read and write strobes
        uWRDL 				: in std_logic_vector(1 downto 0);
	-- Serial DAC control lines
	    DACCS 				: buffer std_logic_vector(2 downto 0);
	    DACClk 				: buffer std_logic;
	    DACDat 				: buffer std_logic;
	    DACLd 				: buffer std_logic;
    -- AFE serial control lines
	    AFEPDn 				 : buffer std_logic_vector(1 downto 0);
	    AFECS 				 : buffer std_logic_vector(1 downto 0);
	    AFERst 				 : buffer std_logic;
	    AFESClk, AFESDI  	 : buffer std_logic;
	    AFESDO 				 : in std_logic;
    -- uController status registers
        AlignReq             : buffer std_logic_vector (1 downto 0)
    );
end DAC;

architecture Behavioral of DAC is

-- DAC control signals
signal BiasActual           : Array_2x12;
signal BiasTarget           : Array_2x12;
signal RampGate             : std_logic_vector (1 downto 0);
signal ClkDiv               : std_logic_vector (2 downto 0);
signal BitCount             : std_logic_vector (4 downto 0);
signal DACShift             : std_logic_vector (23 downto 0);
signal AFERdReg             : std_logic_vector (15 downto 0);

Type  Serializer_FSM is (Idle,Shift,ClearSync,SetLoad);
Signal Octal_Shift : Serializer_FSM;

Type OD_WriteState is (Idle, SetAFESel0, WrtAFE0, SetAFESel1, WrtAFE1); 
signal OD_Write : OD_WriteState;

-- Signals for aligning RxOutClks
Type AlignSeq_Type is (Idle,SendPDn,SendPEn,SendRst,WaitFR,CheckFR,RstCntr);
signal AlignSeq : AlignSeq_Type;
signal uSecCounter          : std_logic_vector (8 downto 0);
signal AFESel               : std_logic_vector (1 downto 0);

-- Octal DAC buffer FIFO control signals
signal ODFifoRdReq          : std_logic;
signal ODFifoWrReq          : std_logic;
signal ODFifoEmpty          : std_logic;
signal ODFifoData           : std_logic_vector (27 downto 0);
signal ODFifoOut            : std_logic_vector (27 downto 0);

signal Dev_Sel              : std_logic;
-- Octal DAC shadow RAM signals
signal ShadowWrt            : std_logic_vector (0 downto 0);
signal ShadowOut            : std_logic_vector (15 downto 0);
signal SClkDL               : std_logic_vector (2 downto 0); 


-- Timing interval counters
signal Counter1us  : std_logic_vector (7 downto 0);
signal Counter10us : std_logic_vector (10 downto 0);
signal Counter1ms  : std_logic_vector (17 downto 0); 
signal Count100ms  : std_logic_vector (6 downto 0);


begin 

-- FIFO for queueing serial data destined for AFEs and DACs
CmdFifo : Cmd_FIFO
port map (
    clk     => Clk_100MHz, 
    rst     => ResetHi,
    wr_en   => ODFifoWrReq,
    rd_en   => ODFifoRdReq,
    din     => ODFifoData,
    dout    => ODFifoOut,
    empty   => ODFifoEmpty
);
-- Ram for storing DAC values for readback
ShadowRam : DAC_Ram
port map (
    clka    => Clk_100MHz,
    wea     => ShadowWrt,
    addra   => uCA(7 downto 0),
    dina    => uCD,
    douta   => ShadowOut
);

counters : process(Clk_100MHz, CpldRst)
begin 
    if CpldRst = '0' then 
        
        Counter1us      <= (others => '0');
        Counter10us     <= (others => '0'); 
        Counter1ms      <= (others => '0');
        uSecCounter     <= (others => '0');

    elsif rising_edge (Clk_100MHz) then  
        -- 1us time base
        if Counter1us = Count1us then 
            Counter1us <= X"00";
        else 
            Counter1us <= Counter1us + 1;
        end if;       
        -- 10us time base
        if Counter10us = Count10us then 
            Counter10us <= (others => '0');            
        else 
            Counter10us <= Counter10us + 1;
        end if;
        -- 1ms time base
        if Counter1ms = Count1ms then 
            Counter1ms <= (others => '0');
        else 
            Counter1ms <= Counter1ms + 1;
        end if;

        -- Time base for alignment sequence
        if AlignSeq /= Idle and AlignSeq /= RstCntr
            and Counter1us = Count1us and uSecCounter /= 335 then
         
            uSecCounter <= uSecCounter + 1;

        elsif AlignSeq = Idle or AlignSeq = RstCntr
            or (Counter1us = Count1us and uSecCounter = 335) then
            
            uSecCounter <= (others => '0');
        else
            uSecCounter <= uSecCounter;
        end if;

    end if;
end process;

-- Writing a 0 disables the alignment -> force quit alignment
Alignment : process(Clk_100MHz, CpldRst)
begin 
    if CpldRst = '0' then
        
        AlignReq            <= "00";

    elsif rising_edge (Clk_100MHz) then 

        if uWRDL = 1 and uCD(0) = '1' and AFEPDn(0) = '0'
		    and ((uCA(11 downto 10) = GA and uCA(9 downto 0) = SlipCtrlAd)
			or uCA(9 downto 0) = BrdCstAlgnReqAd) then 
	        
            AlignReq(0) <= '1'; 

        elsif uWRDL = 1 and uCD(0) = '0' and ((uCA(11 downto 10) = GA and uCA(9 downto 0) = SlipCtrlAd)
                                                      or uCA(9 downto 0) = BrdCstAlgnReqAd) then
            AlignReq(0) <= '0'; 
        
        end if;

        if uWRDL = 1 and uCD(1) = '1' and AFEPDn(1) = '0'
		and ((uCA(11 downto 10) = GA and uCA(9 downto 0) = SlipCtrlAd)
			or uCA(9 downto 0) = BrdCstAlgnReqAd) then
	  
            AlignReq(1) <= '1'; 
	
        elsif uWRDL = 1 and uCD(1) = '0' and ((uCA(11 downto 10) = GA and uCA(9 downto 0) = SlipCtrlAd)
													or uCA(9 downto 0) = BrdCstAlgnReqAd) then 
	        AlignReq(1) <= '0'; 
                                                       
        end if;
    end if;
end process;



DAC_process : process(Clk_100MHz, CpldRst)
begin 
    if CpldRst = '0' then 
        DACCS       <= "111"; 
        DACClk      <= '1'; 
        DACDat      <= '0'; 
        DACLd       <= '1';

        RampGate    <= "00";
        BiasTarget  <= (others => X"000"); 
        BiasActual  <= (others => X"000"); 
        DACShift    <= (others => '0');
        ClkDiv      <= (others => '0');  
        BitCount    <= "00000";


        Octal_Shift <= Idle; 
        OD_Write    <= Idle;

        Dev_Sel     <= '0'; 

        ODFifoWrReq <= '0';
        ODFifoRdReq <= '0'; 
        ODFifoData  <= (others => '0');
        ShadowWrt   <= "0";

        AFERdReg    <= (others => '0');

    elsif rising_edge (Clk_100MHz) then 

-------------- Serializer for Bias Trim, Bias Bus, VGain DACs, AFE setup registers -------------
-- Clock runs at 159 MHz, serial data bit period is SysClk div 8
ClkDiv <= ClkDiv + 1;
-- Store DAC, AFE setup data in a buffer, so that multiple writes can be 
-- done without waiting for DAC data to be serialized
-- Bias voltage ramping logic
-- Write the bias target registers

if uWRDL = 1 and uCA(11 downto 10) = GA and uCA(9 downto 0) = ("00" & X"44") then 
    BiasTarget(0) <= uCD(11 downto 0);
else 
    BiasTarget(0) <= BiasTarget(0);
end if;

if uWRDL = 1 and uCA(11 downto 10) = GA and uCA(9 downto 0) = ("00" & X"45") then 
    BiasTarget(1) <= uCD(11 downto 0);
else 
    BiasTarget(1) <= BiasTarget(1);
end if;

-- If the present bias value and the target bias value differ, bring the
-- present bias value closer to the target by one count every millisecond.
-- Uee the rampgate signal to force one write when the actual = the target.
for i in 0 to 1 loop
    if BiasTarget(i) /= BiasActual(i) then 
        RampGate(i) <= '1';
    elsif BiasTarget(i) = BiasActual(i) and ODFifoWrReq = '1' then 
        RampGate(i) <= '0';
    else RampGate(i) <= RampGate(i);
    end if;

    if BiasTarget(i) /= BiasActual(i) and Counter1ms = 4 then
        if BiasTarget(i) < BiasActual(i) then 
            BiasActual(i) <= BiasActual(i) - 1;
        elsif BiasTarget(i) > BiasActual(i) then 
            BiasActual(i) <= BiasActual(i) + 1;
        end if;
    end if;
end loop;


-- (Idle,SendPDn,SendPEn,SendRst,WaitFR,CheckFR,ChkSlipCnt,SendSlipReq);
case AlignSeq is
	when Idle => 
	 if AlignReq /= 0 and Counter1us = Count1us	then 
        
        AlignSeq <= SendPDn;
	 else 
        AlignSeq <= Idle;
	 end if;

	when SendPDn => 
	  if Counter1us = Count1us and uSecCounter = 335 then 
		
            AlignSeq <= SendPEn;
	  elsif AlignReq = 0 then
	    
            AlignSeq <= Idle;
	   else 
            AlignSeq <= SendPDn;
	  end if;

	when SendPEn =>
	  if Counter1us = Count1us and uSecCounter = 335 then 
		
            AlignSeq <= SendRst;
	  elsif AlignReq = 0 then
	    
            AlignSeq <= Idle;
	   else 
            AlignSeq <= SendPEn;
	  end if;

	when SendRst =>
--		if Counter1us = Count1us and uSecCounter = 335 then 
--		    
--            AlignSeq <= WaitFR;
--	  elsif 
        if AlignReq = 0 then
	    
            AlignSeq <= Idle;
		else 
            AlignSeq <= SendRst;
		end if;
--	when WaitFR => --Debug(3 downto 1) <= "100";
--	  --if Counter1us = Count1us and uSecCounter(3 downto 0) = X"F" then
--     if Counter1us = Count1us and uSecCounter = 300 then	  
--	    AlignSeq <= CheckFR;       
--	   elsif AlignReq = 0 then
--	    AlignSeq <= Idle;
--	  else AlignSeq <= WaitFR;
--	 end if;
--	when CheckFR => --Debug(3 downto 1) <= "101";
--	   if Counter1us = Count1us and uSecCounter = 300
--	   --if Counter1us = Count1us and uSecCounter(3 downto 0) = X"F"
--		  then
--			  if (AlignReq(0) = '1' and FR_OK(0) = '1') 
--		     or (AlignReq(1) = '1' and FR_OK(1) = '1')
--			  or AlignReq = 0 then 
--			   AlignSeq <= Idle; 
--			  else 
--			   AlignSeq <= RstCntr;
--			 end if;
--		 end if;
--	 when RstCntr => --Debug(3 downto 1) <= "110";
--			 if Counter1us = Count1us then
--			  AlignSeq <= SendPDn;
--	      else 
--			  AlignSeq <= RstCntr;
--		  end if;
	when others =>
            AlignSeq <= Idle; 
 end Case;



-- This state machine controls the order of AFE writes to the command FIFO
-- Timer requirement enables the OD write strobe for one clock cycle
--(Idle, SetAFESel0, WrtAFE0, SetAFESel1, WrtAFE1);
case OD_Write is
	when Idle =>
		if (AlignSeq = SendPdn or AlignSeq = SendPEn)
			and Counter1us = 1 and uSecCounter = 0 then
			if AlignReq(0) = '1' then
				OD_Write <= SetAFESel0; 
			elsif AlignReq = 2 then
				OD_Write <= SetAFESel1;
			end if;
		else
			OD_Write <= Idle; 
		end if;
	when SetAFESel0 => 
            OD_Write <= WrtAFE0;
	when WrtAFE0 =>
		if AlignReq(1) = '1' then
			OD_Write <= SetAFESel1; 
		else 
            OD_Write <= Idle;
		end if;
	when SetAFESel1 => 
            OD_Write <= WrtAFE1; 
	when WrtAFE1 => 
            OD_Write <= Idle; 
end case;


-- Write the updated actual value to the bias DAC
if RampGate(0) = '1' and Counter1ms = Count1ms then
	ODFifoData <= X"0440" & BiasActual(0);
elsif RampGate(1) = '1' and Counter1ms = 1 then
	ODFifoData <= X"0450" & BiasActual(1);
-- Clock adjustment, enabling and disabling LVDS output for each ultrasound
elsif AlignSeq = SendPDn and (OD_Write = SetAFESel0 or OD_Write = WrtAFE0) then
	ODFifoData <= X"101" & X"0002"; 
elsif AlignSeq = SendPDn and (OD_Write = SetAFESel1 or OD_Write = WrtAFE1) then
	ODFifoData <= X"201" & X"0002"; 
elsif AlignSeq = SendPEn and (OD_Write = SetAFESel0 or OD_Write = WrtAFE0) then
	ODFifoData <= X"101" & X"0000"; 
elsif AlignSeq = SendPEn and (OD_Write = SetAFESel1 or OD_Write = WrtAFE1) then
	ODFifoData <= X"201" & X"0000"; 
else ODFifoData <= ("00" & uCA(9 downto 0) & uCD);
end if;

if (RampGate(0) = '1' and Counter1ms = Count1ms)
    or (RampGate(1) = '1' and Counter1ms = 1)
    or ((AlignSeq = SendPDn or AlignSeq = SendPEn) and 
     (OD_Write = SetAFESel0 or OD_Write = WrtAFE0 or OD_Write = SetAFESel1 or OD_Write = WrtAFE1))
    or	(uWRDL = 1 and uCA(11 downto 10) = GA
    and ((uCA(9 downto 0) >= DatArray0Min and uCA(9 downto 0) <= CtrlArray2Max
	and uCA(9 downto 0) /= ("00" & X"44") and uCA(9 downto 0) /= ("00" & X"45"))
	or (uCA(9 downto 0) >= AFE0ArrayMin and uCA(9 downto 0) <= AFE0ArrayMax)
	or (uCA(9 downto 0) >= AFE1ArrayMin and uCA(9 downto 0) <= AFE1ArrayMax)))
then 
    ODFifoWrReq <= '1';
else 
    ODFifoWrReq <= '0';
end if;

-- If data is going to the DACs, shadow it in ram
if uWRDL = 1 and uCA(11 downto 10) = GA 
    and uCA(9 downto 0) >= DatArray0Min and uCA(9 downto 0) <= CtrlArray2Max
then 
    ShadowWrt <= "1";
else 
    ShadowWrt <= "0";
end if;

-- Distinguish between DACs and AFEs
if ODFifoEmpty = '0' and ClkDiv = 0 and DacLd = '1' and Octal_Shift = Idle 
           and ODFifoOut(27 downto 16) >= DatArray0Min and ODFifoOut(27 downto 16) <= CtrlArray2Max
then 
    Dev_Sel <= '1';
elsif ODFifoEmpty = '0' and ClkDiv = 0 and DacLd = '1' and Octal_Shift = Idle 
           and ((ODFifoOut(27 downto 16) >= AFE0ArrayMin and ODFifoOut(27 downto 16) <=AFE0ArrayMax)
				 or (ODFifoOut(27 downto 16) >= AFE1ArrayMin and ODFifoOut(27 downto 16) <=AFE1ArrayMax))
then 
    Dev_Sel <= '0';
end if;


--(Idle,Shift,ClearSync,SetLoad);
Case Octal_Shift is
    When Idle => 	
            if ODFifoEmpty = '0' and ClkDiv = 0 and DacLd = '1' then 
               Octal_Shift     <= Shift;
            else 
               Octal_Shift     <= Idle;
            end if;
     When Shift => 
            if BitCount = 1 and ClkDiv = 0 then 
                Octal_Shift    <= ClearSync;
            else 
                Octal_Shift    <= Shift;
            end if;
    When ClearSync => 
            if DacCS = 7 and Dev_Sel = '1' and ClkDiv = 0 and Dev_Sel = '1' then 
                Octal_Shift    <= SetLoad;
            elsif Dev_Sel = '0' and ClkDiv = 0 then 
                Octal_Shift    <= Idle;
            else 
                Octal_Shift    <= ClearSync;
            end if;
     When SetLoad => 
            if DacLd = '0' and ClkDiv = 0 then 
                Octal_Shift    <= Idle;
            else 
                Octal_Shift    <= SetLoad;
            end if;
     When others => 
                Octal_Shift    <= Idle;
end Case;

-- DAC output shift registter
if ODFifoRdReq = '1' and Dev_Sel = '1' and ODFifoOut(27 downto 16) < DatArray2Min then 
    
    DACShift <= X"00" & '0' & ODFifoOut(18 downto 16) & ODFifoOut(11 downto 0);
elsif ODFifoRdReq = '1' and Dev_Sel = '1' and ODFifoOut(27 downto 16) >= DatArray2Min 
                                                     and ODFifoOut(27 downto 16) < CtrlArray0Min  then 

    -- Remap the LED intensity channels
     Case ODFifoOut(18 downto 16) is 
      when "000" =>	DACShift <= X"001" & ODFifoOut(11 downto 0);
      when "001" =>	DACShift <= X"003" & ODFifoOut(11 downto 0);
      when "010" =>	DACShift <= X"000" & ODFifoOut(11 downto 0);
      when "011" =>	DACShift <= X"002" & ODFifoOut(11 downto 0);
      when others => DACShift <= X"00" & '0' & ODFifoOut(18 downto 16) & ODFifoOut(11 downto 0);
     end Case;

elsif ODFifoRdReq = '1' and Dev_Sel = '1' and ODFifoOut(27 downto 16) >= CtrlArray0Min then
    
    DACShift <= X"00" & '1' & ODFifoOut(14 downto 0);

elsif ODFifoRdReq = '1' and Dev_Sel = '0' then 

    DACShift <= ODFifoOut(23 downto 0);

elsif BitCount /= 0 and ClkDiv = 0 and Octal_Shift = Shift then 
    
    DACShift <= (DACShift(22 downto 0) & '0');
end if;

if Dev_Sel = '1' and Octal_Shift = Shift then 
    DacDat <= DACShift(15);
else 
    DacDat <= '0';
end if;


---- When one word has been serialized, read the buffer for the next word
if ODFifoEmpty = '0' and ClkDiv = 0 and DacLd = '1' and Octal_Shift = Idle then 
    ODFifoRdReq <= '1';
else
    ODFifoRdReq <= '0';
end if;

---- Serial bit counter
-- if destination is DAC, counter is 24
if ODFifoRdReq = '1' and BitCount = 0 and Dev_Sel = '0' then
    BitCount <= "11000";
-- if destination is AFE, counter is 16
elsif ODFifoRdReq = '1' and BitCount = 0 and Dev_Sel = '1' then
    BitCount <= "10000";
elsif BitCount /= 0 and Octal_Shift = Shift and ClkDiv = 0 then 
    BitCount <= BitCount - 1;
end if;

---- DAC clock
if Dev_Sel = '1' and BitCount /= 0 and Octal_Shift = Shift then 
    DacClk <= ClkDiv(2); 
else 
    DacClk <= '0';
end if;

---- DAC load 
if Octal_Shift = SetLoad and ClkDiv = 0 and Dev_Sel = '1' then 
    DacLd <= '0';
elsif Octal_Shift = Idle and ClkDiv = 0 then 
    DacLd <= '1';
else 
    DacLd <= DacLd;
end if;

---- Assert appropriate DAC chip select based on bits 22..19 of the FIFO output
if ODFifoRdReq = '1' and BitCount = 0 and Dev_Sel = '1' then 

    Case ODFifoOut(22 downto 19) is
        When X"6" => DacCS <= "110";
	    When X"7" => DacCS <= "101";
	    When X"8" => DacCS <= "011";
	    When X"9" => DacCS <= "110";
	    When X"A" => DacCS <= "101";
	    When X"B" => DacCS <= "011";
	    When others => DacCS <= "111";
    end case;

elsif ClkDiv = 0 and Octal_Shift = ClearSync then

    DacCS <= "111";

end if;



end if;
end process; 


AFEControl : process(Clk_100MHz, CpldRst)
begin 
    if CpldRst = '0' then 

        AFEPDn      <= "11"; 
        AFECS       <= "11"; 
        AFESDI      <= '0';
        AFESClk     <= '0'; 
        AFERst      <= '0';

    elsif rising_edge (Clk_100MHz) then  

    -- AFE power down control bits
    if uWRDL = 1 and ((uCA(11 downto 10) = GA and uCA(9 downto 0) = CSRRegAddr)
            or uCA(9 downto 0) = CSRBroadCastAd) then
        
        AFEPDn <= uCD(1 downto 0);
    else 
        AFEPDn <= AFEPDn;
    end if;
    
    -- AFE specific reset
    if uCWR = '0' and CpldCS = '0' and uCD(6) = '1'  
	    and ((uCA(11 downto 10) = GA and uCA(9 downto 0) = CSRRegAddr)
			or uCA(9 downto 0) = CSRBroadCastAd) then
        
        AFERst <= '1';
    else 
        AFERst <= '0';
    end if;


    -- Assert appropriate AFE chip select based on bits 25, 24 of the FIFO output
    if ODFifoRdReq = '1' and BitCount = 0 and Dev_Sel = '0' then 

        Case ODFifoOut(25 downto 24) is
            When "01" => AFECS <= "10";
    	    When "10" => AFECS <= "01";
    	    When others => AFECS <= "11";
        end case;

    elsif ClkDiv = 0 and Octal_Shift = ClearSync then 

        AFECS <= "11";

    end if;

    ---- AFE serial clock
    if Dev_Sel = '0' and BitCount /= 0 and Octal_Shift = Shift then 
        AFESClk <= ClkDiv(2); 
    else 
        AFESClk <= '0';
    end if;
    
    ---- AFE serial data
    if Dev_Sel = '0' and Octal_Shift = Shift then 
        AFESDI <= DACShift(23); 
    else 
        AFESDI <= '0';
    end if;
    
    -- Delayed copy of the serial clock for strobing in readback data
    SClkDL(0) <= AFESClk;
    SClkDL(1) <= SClkDL(0);
    SClkDL(2) <= SClkDL(1);
       
    -- Clock in any readback data
    if Dev_Sel = '0' and SClkDL = 6 then
        AFERdReg <= AFERdReg(14 downto 0) & AFESDO;
    end if;

    end if;
end process;




end Behavioral;