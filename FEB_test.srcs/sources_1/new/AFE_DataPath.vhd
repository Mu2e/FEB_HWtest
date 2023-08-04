----------------------------------------------------------------------------------
-- Company: FNAL
-- Engineer: Micol Rigatti <mrigatti@fnal.gov> 
-- 
-- Create Date: 09/12/2022 12:12:09 PM
-- Design Name: 
-- Module Name: AFE_DataPath - Behavioral
-- Project Name: CRV FEB
-- Target Devices: xc7s50fgga484-2
-- Tool Versions: 2021.2
-- Description: 
-- 
----------------------------------------------------------------------------------

--============ DATA FORMAT ===================
-- -------------------------------------------
-- | Channel (16 bit)                        | 
-- -------------------------------------------
-- | N sample (4 bit) timestamp (12 bit)     |
-- -------------------------------------------
-- | ADC sample [N_sample times: 16-bits of  |
-- | ADC sample, the highest 4 bits are zero |
-- | b0000 + 12-bit-ADC-value]               |
-- -------------------------------------------
 

LIBRARY ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use IEEE.numeric_std.all;
Library UNISIM;
use UNISIM.vcomponents.all;

use work.Proj_Def.all;

entity AFE_DataPath is
  Port (
	Clk_80MHz			: in std_logic; 
	SysClk				: in std_logic; -- 160 MHz
	ResetHi				: in std_logic;
-- Signals from Trigger Logic
	TrigReq				: in std_logic;
	BeamOn				: in std_logic;
-- Signals for EventBuilder
	MaskReg				: buffer Array_2x8;
	BufferRdAdd			: in Array_2x8x10;
	BufferOut 			: out Array_2x8x16;
	startEVB			: out Array_2x8;
-- Data output from the deserializer for AFE0 and AFE1 synchronized to 80 MHz clock
    din_AFE0			: in Array_8x14; 
    din_AFE1			: in Array_8x14;
    done				: in std_logic_vector(1 downto 0); -- status of automatic alignment FSM
	SerdesRst			: out std_logic_vector(1 downto 0);
-- Histogram signals
	Diff_Reg			: inout Arrays_8x2x14;
	GateWidth	    	: inout Array_2x12;
	GateReq 			: inout std_logic_vector (1 downto 0);
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
-- Global signals
	WRDL 				: in std_logic_vector(1 downto 0)

	);
end AFE_DataPath;

architecture Behavioral of AFE_DataPath is

signal AsyncRst			: std_logic;

-- Pipeline signals 
signal din_AFE			: Array_2x8x14;   -- 2 AFE x 8 channels x 14 bits
signal dout_AFE			: Array_2x8x14;   -- 2 AFE x 8 channels x 14 bits
-- AFEBuff : DPRAM_1Kx16 Signals
signal BufferIn 		: Array_2x8x16;   -- 2 AFE x 8 channels x 16 bits
signal BufferWE			: Array_2x8;	  -- 2 AFE x 8 channels
signal BufferWrtAdd		: Array_2x8x10;   -- 2 AFE x 8 channels: address 10 bits for 1024 depth of RAM

Type Input_Seq_FSM is (Idle,Increment,WrtChanNo,WrtTimeStamp,WrtHits,
						WrtHitWdCnt,LdNxtWrtAd);
Type In_Seq_Array is Array(0 to 7) of Input_Seq_FSM;						
Type In_Seq_Array_2x8 is Array(0 to 1) of In_Seq_Array;
signal Input_Seqs : In_Seq_Array_2x8;						
signal In_Seq_Stat : Array_2x8x4;


signal ADCSmplCntr 		: Array_2x8x4;
signal InWdCnt 			: Array_2x8x10;
signal uBunchOffset 	: Array_2x12;
signal SlfTrgEdge 		: Array_2x8x2;
signal ADCSmplGate		: std_logic_vector (1 downto 0);

signal iWrtDL 			: Array_2x2;

-- Input buffer (aka AFE buffer) memory control signals
signal WrtCrrntWdCntAd 	: Array_2x8x10;
signal WrtNxtWdCntAd 	: Array_2x8x10;

-- Self trigger signals
signal Ped_Reg			: Arrays_8x2x14;
signal Pad_Avg_Count 	: Array_2x5;
signal Avg_Req 			: std_logic_vector(1 downto 0);
signal Ped_Avg 			: Arrays_8x2x16;
signal Avg_En 			: Array_2x8;
signal IntTrgThresh 	: Arrays_8x2x14;

-- Signals from uC
signal	ControllerNo 		: std_logic_vector (4 downto 0);
signal	PortNo 				: std_logic_vector (4 downto 0);
signal	BeamOnLength 		: std_logic_vector (11 downto 0);
signal	BeamOffLength 		: std_logic_vector (11 downto 0);
signal	ADCSmplCntReg 		: std_logic_vector (3 downto 0);

-- Pipeline signals
signal PipelineSet 			: std_logic_vector (7 downto 0);	
	
-- attribute mark_debug : string;
-- attribute mark_debug of AsyncRst 		 : signal is "true";
-- attribute mark_debug of din_AFE 	 	 : signal is "true";
-- attribute mark_debug of dout_AFE		 : signal is "true";
-- attribute mark_debug of BufferIn 		 : signal is "true";
-- attribute mark_debug of BufferWE		 : signal is "true";
-- attribute mark_debug of BufferRdAdd 	 : signal is "true";
-- attribute mark_debug of BufferOut		 : signal is "true";
-- 
-- attribute mark_debug of BufferWrtAdd	 : signal is "true";
-- attribute mark_debug of Input_Seqs 		 : signal is "true";
-- 
-- attribute mark_debug of ADCSmplCntr		 : signal is "true";
-- attribute mark_debug of InWdCnt	 		 : signal is "true";
-- attribute mark_debug of uBunchOffset 	 : signal is "true";
-- attribute mark_debug of SlfTrgEdge   	 : signal is "true";
-- attribute mark_debug of ADCSmplGate		 : signal is "true";
-- 
-- attribute mark_debug of iWrtDL 		 	 : signal is "true";
-- attribute mark_debug of WrtCrrntWdCntAd  : signal is "true";
-- attribute mark_debug of WrtNxtWdCntAd    : signal is "true";
-- attribute mark_debug of Ped_Reg  	 	 : signal is "true";
-- attribute mark_debug of Pad_Avg_Count  	 : signal is "true";
-- attribute mark_debug of Avg_Req  	 	 : signal is "true";
-- attribute mark_debug of Ped_Avg  	 	 : signal is "true";
-- attribute mark_debug of Avg_En 		 	 : signal is "true";
-- attribute mark_debug of IntTrgThresh 	 : signal is "true";
-- 
-- attribute mark_debug of ControllerNo 	 : signal is "true";
-- attribute mark_debug of PortNo 			 : signal is "true";
-- attribute mark_debug of BeamOnLength  	 : signal is "true";
-- attribute mark_debug of BeamOffLength 	 : signal is "true";
-- attribute mark_debug of ADCSmplCntReg  	 : signal is "true";
-- attribute mark_debug of PipelineSet		 : signal is "true";
-- attribute mark_debug of GateWidth		 : signal is "true";
-- attribute mark_debug of Diff_Reg		 : signal is "true";

begin

AFE_Pipeline_inst: AFE_Pipeline
port map(
	Clk_80MHz	 => Clk_80MHz,
    din_AFE0	 => din_AFE0,
    din_AFE1	 => din_AFE1,
	dout_AFE0	 => dout_AFE(0),
    dout_AFE1	 => dout_AFE(1),
    done		 => done,
	PipelineSet  => PipelineSet,
	CpldRst		 => CpldRst
);

din_AFE(0)	 <= din_AFE0;
din_AFE(1)   <= din_AFE1;

AsyncRst <= '1' when ResetHi = '1' or (uCWr = '0' and CpldCS = '0' and uCD(5) = '1' 
					 and ((uCA(11 downto 10) = GA and uCA(9 downto 0) = CSRRegAddr)
					 or uCA(9 downto 0) =  CSRBroadCastAd)) else '0';
					 
	
uC_registers : process (SysClk, CpldRst) -- Originally 100 MHz
begin 
	if CpldRst = '0' then
		ADCSmplCntReg 		<= X"8"; 
		ControllerNo 		<= "00000"; 
		PortNo 				<= "00000"; 
		BeamOnLength		<= X"050"; 
		BeamOffLength 		<= X"700";
		PipelineSet			<= X"04";
	elsif rising_edge (SysClk) then -- Originally 100 MHz
	
	-- Specifiy the number of ADC samples per hit
	if WRDL = 1 and uCA(9 downto 0) = ADCSmplCntrAd 
	then ADCSmplCntReg <= uCD(3 downto 0);
	else ADCSmplCntReg <= ADCSmplCntReg;
	end if;
	
	-- Register for defining the geographical address of the FEB
	if WRDL = 1 and uCA(9 downto 0) =  FEBAddresRegAd then 
		ControllerNo <= uCD(12 downto 8); 
		PortNo 		 <= uCD(4 downto 0);
	else
		ControllerNo <= ControllerNo;
		PortNo 		 <= PortNo;
	end if;
	
	-- Register for determining the live gate lengths
	if WRDL = 1 and uCA(9 downto 0) = BeamOnLengthAd
	then BeamOnLength <= uCD(11 downto 0);
	else BeamOnLength <= BeamOnLength;
	end if;
	
	if WRDL = 1 and uCA(9 downto 0) = BeamOffLengthAd
	then BeamOffLength <= uCD(11 downto 0);
	else BeamOffLength <= BeamOffLength;
	end if;
	
	-- Pipeline delay setting 
	if WRDL = 1 and uCA(9 downto 0) = PipeLineAddr 
	then PipelineSet <= uCD(7 downto 0);
	else PipelineSet <= PipelineSet;
	end if;
	
	end if;
end process;

					 
Gen_Two_AFEs : for i in 0 to 1 generate		
Two_AFEs : process (Clk_80MHz, CpldRst)
begin
if CpldRst = '0' then 
	SerdesRst(i) 		  <= '1';
	Avg_Req(i) 			  <= '0';
	ADCSmplGate(i) 		  <= '0';
	GateReq(i) 			  <= '0';
	uBunchOffset(i) 	  <= (others => '0');
	Pad_Avg_Count(i) 	  <= (others => '0');
	MaskReg(i) 			  <= X"FF";
	iWrtDL(i) 			  <= "00";
	GateWidth(i) 		  <= (others => '0');
	
elsif rising_edge (Clk_80MHz) then

-- Synchronous edge detector for uC write strobe w.r.t. deserializer output clock
iWrtDL(i)(0) <= not CpldCS and not uCWR;
iWrtDL(i)(1) <= iWrtDL(i)(0);

-- Reset for the input deserializer
if CpldCS = '0' and uCWR = '0' and uCD(2) = '1' 
   and ((uCA(11 downto 10) = GA and uCA = CSRRegAddr)
	or uCA(9 downto 0) = CSRBroadCastAd)
 then SerdesRst(i) <= '1';
 else SerdesRst(i) <= '0';
end if;

if iWrtDL(i) = 1 and uCD(8) = '1' and
	((uCA(11 downto 10) = GA and uCA(9 downto 0) = CSRRegAddr)
	or uCA(9 downto 0) = CSRBroadCastAd)
then Avg_Req(i) <= '1';
elsif Pad_Avg_Count(i) /= 0 
then Avg_Req(i) <= '0';
end if;

if Pad_Avg_Count(i) = 0 and Avg_Req(i) = '1'
then Pad_Avg_Count(i) <= "10001";
elsif Pad_Avg_Count(i) /= 0 
then Pad_Avg_Count(i) <= Pad_Avg_Count(i) - 1;
else Pad_Avg_Count(i) <= Pad_Avg_Count(i);
end if;

-- Channel mask register.
if iWrtDL(i) = 1 and uCA(11 downto 10) = GA and uCA(9 downto 0) = InputMaskAddr
then MaskReg(i) <= uCD(8*i+7 downto 8*i); 
else MaskReg(i) <= MaskReg(i);
end if;

-- Use this counter to append time since microbunch start to the ADC data
if TrigReq = '1' and GateWidth(i) = 0 
then uBunchOffset(i) <= (others => '0');
elsif GateWidth(i) /= 0
then uBunchOffset(i) <= uBunchOffset(i) + 1;
else uBunchOffset(i) <= uBunchOffset(i);
end if;

-- Hold Gate request high until the next complete ADC sample is available
if GateReq(i) = '0' and GateWidth(i) = 0 and TrigReq = '1'
then GateReq(i) <= '1'; 
elsif GateReq(i) = '1' and GateWidth(i) /= 0
then GateReq(i) <= '0';
else GateReq(i) <= GateReq(i);
end if;

-- Synchronize the live gate counter with the frame signal
if AsyncRst = '1' 
then GateWidth(i) <= (others => '0');
elsif GateWidth(i) = 0 and GateReq(i) = '1' and BeamOn = '1'
then GateWidth(i) <= BeamOnLength;
elsif GateWidth(i) = 0 and GateReq(i) = '1' and BeamOn = '0'
then GateWidth(i) <= BeamOffLength;
 elsif GateWidth(i) /= 0
then GateWidth(i) <= GateWidth(i) - 1;
else GateWidth(i) <= GateWidth(i);
end if;

if GateWidth(i) = 0 and GateReq(i) = '1'
then ADCSmplGate(i) <= '1';
elsif AsyncRst = '1' or (GateWidth(i) = X"000" & (ADCSmplCntReg + 2))
then ADCSmplGate(i) <= '0';
else ADCSmplGate(i) <= ADCSmplGate(i);
end if;

end if;
end process;
		 
Gen_Eight_Chans : for k in 0 to 7 generate

AFEBuff : DPRAM_1Kx16
  PORT MAP ( 
	clka  => Clk_80MHz, 
	wea   => BufferWE(i)(k downto k), 
	addra => BufferWrtAdd(i)(k),	
    dina  => BufferIn(i)(k),	
	
	clkb  => SysClk, -- 160 MHz
	addrb => BufferRdAdd(i)(k),
	doutb => BufferOut(i)(k)
);

Eight_Chans : process (Clk_80MHz, CpldRst)
begin
if CpldRst = '0' then 
		
	BufferWE(i)(k)		  <= '0'; 
	BufferWrtAdd(i)(k)	  <= (others => '0'); 
	WrtCrrntWdCntAd(i)(k) <= (others => '0');
	WrtNxtWdCntAd(i)(k)   <= (others => '0'); 
	
	Input_Seqs(i)(k) 	  <= Idle;
	In_Seq_Stat(i)(k) 	  <= (others => '0');
	InWdCnt(i)(k) 		  <= (others => '0');
	ADCSmplCntr(i)(k) 	  <= "0000";
	SlfTrgEdge(i)(k) 	  <= "00";
	
	Diff_Reg(i)(k) 		  <= (others => '0');
	Ped_Reg(i)(k) 		  <= (others => '0');
	Ped_Avg(i)(k) 		  <= (others => '0');
	Avg_En(i)(k) 		  <= '0';
	IntTrgThresh(i)(k) 	  <= "00000000001100"; -- X"00C"
	startEVB(i)(k)		  <= '0';
	
elsif rising_edge (Clk_80MHz) then
---------------------------------------------------------------------
----------------- Pedestal registers, self trigger ------------------
---------------------------------------------------------------------

-- Subtract off the pedestal before applying the threshold
Diff_Reg(i)(k) <= signed(din_AFE(i)(k)) - Ped_Reg(i)(k);
SlfTrgEdge(i)(k)(1) <= SlfTrgEdge(i)(k)(0);

-- Pedestal registers
if iWrtDL(i) = 1 and uCA(11 downto 10) = GA and uCA(9 downto 0) = PedRegAddr(i)(k)
then Ped_Reg(i)(k) <= "00" & signed(uCD(11 downto 0));
elsif Pad_Avg_Count(i) = 1 
then Ped_Reg(i)(k) <= Ped_Avg(i)(k)(15 downto 2);
else Ped_Reg(i)(k) <= Ped_Reg(i)(k);
end if;

if Pad_Avg_Count(i) /= 0 
then Avg_En(i)(k) <= '1';
elsif Pad_Avg_Count(i) = 0 
then Avg_En(i)(k) <= '0';
else Avg_En(i)(k) <= Avg_En(i)(k);
end if;
 
-- Pedestal averaging 
if Avg_En(i)(k) = '0' 
then Ped_Avg(i)(k) <= (others => '0');
elsif Avg_En(i)(k) = '1'
then Ped_Avg(i)(k) <= Ped_Avg(i)(k) + signed(din_AFE(i)(k));
else Ped_Avg(i)(k) <= Ped_Avg(i)(k);
end if;

-- Self trigger threshold registers
if iWrtDL(i) = 1 and uCA(11 downto 10) = GA and uCA(9 downto 0) = ThreshRegAddr(i)(k)
then IntTrgThresh(i)(k) <= "00" & signed(uCD(11 downto 0));
else IntTrgThresh(i)(k) <= IntTrgThresh(i)(k);
end if;

-- Self trigger synchronous edge detector
if ADCSmplGate(i) = '1' and Diff_Reg(i)(k) > IntTrgThresh(i)(k) 
then SlfTrgEdge(i)(k)(0) <= '1';
elsif Diff_Reg(i)(k) <= IntTrgThresh(i)(k)
then SlfTrgEdge(i)(k)(0) <= '0';
else SlfTrgEdge(i)(k)(0) <= SlfTrgEdge(i)(k)(0);
end if;


-- =========================================================================
-- ================================== FSM ==================================
-- =========================================================================
-- FSM to build the Data Packet 
-- Input Sequencer (i: 0->1, k: 0->7)
-- (Idle,Increment,WrtChanNo,WrtTimeStamp,WrtHits,WrtHitWdCnt,LdNxtWrtAd);
case Input_Seqs(i)(k) is
	When Idle =>
	 if (GateReq(i) = '1' and done(i) = '1')
	  then Input_Seqs(i)(k) <= Increment;
	 else  Input_Seqs(i)(k) <= Idle;
	  end if;
	When Increment => 
	Input_Seqs(i)(k) <= WrtChanNo;
	When WrtChanNo =>
	 if GateWidth(i) = 0
	  then Input_Seqs(i)(k) <= WrtHitWdCnt;
	 elsif SlfTrgEdge(i)(k) = 1
	  then Input_Seqs(i)(k) <= WrtTimeStamp;
	 else Input_Seqs(i)(k) <= WrtChanNo;
	 end if;
	When WrtTimeStamp => 
	Input_Seqs(i)(k) <= WrtHits;
	When WrtHits =>
	 if ADCSmplCntr(i)(k) = 1 
	  then Input_Seqs(i)(k) <= WrtChanNo;
	 elsif GateWidth(i) = 0 
	  then Input_Seqs(i)(k) <= WrtHitWdCnt;
	 else  Input_Seqs(i)(k) <= WrtHits;
	 end if;
	When WrtHitWdCnt => 
	Input_Seqs(i)(k) <= LdNxtWrtAd;
	When LdNxtWrtAd => 
	Input_Seqs(i)(k) <= Idle;
end case;


-- Set BufferWE 
if (Input_Seqs(i)(k) = WrtHits or 
    (Input_Seqs(i)(k) = WrtChanNo and SlfTrgEdge(i)(k) = 1) or
    Input_Seqs(i)(k) = WrtTimeStamp or
    Input_Seqs(i)(k) = WrtHitWdCnt)
    and MaskReg(i)(k) = '1' then 
		BufferWE(i)(k) <= '1';
else 
		BufferWE(i)(k) <= '0';
end if;


--============ DATA FORMAT ===================
-- -------------------------------------------
-- | Channel (16 bit)                        | 
-- -------------------------------------------
-- | N sample (4 bit) timestamp (12 bit)     |
-- -------------------------------------------
-- | ADC sample [N_sample times: 16-bits of  |
-- | ADC sample, the highest 4 bits are zero |
-- | b0000 + 12-bit-ADC-value]               |
-- -------------------------------------------

-- Channel (16 bits) = ControllerNo (5 bits) + Port Number (5 bits) +
-- geo address (2 bits of which FPGA on a FEB) + channel (4 bits)

if Input_Seqs(i)(k) = Idle 
then
	startEVB(i)(k)	  <= '0';
	In_Seq_Stat(i)(k) <= x"0";
	InWdCnt(i)(k) <= (others => '0');
	BufferIn(i)(k) <= "00" & dout_AFE(i)(k);
elsif Input_Seqs(i)(k) = Increment 
then
	startEVB(i)(k)	  <= '0'; 
	WrtCrrntWdCntAd(i)(k) <= BufferWrtAdd(i)(k); -- Store present write pointer so a leading word count can be stored at the end of the microbunch
	In_Seq_Stat(i)(k) <= x"1";
	BufferIn(i)(k) <= "00" & dout_AFE(i)(k);
elsif Input_Seqs(i)(k) = WrtChanNo 
then
	startEVB(i)(k)	  <= '0'; 	
	In_Seq_Stat(i)(k) <= x"2";
	ADCSmplCntr(i)(k) <= ADCSmplCntReg;	
	WrtCrrntWdCntAd(i)(k) <= WrtCrrntWdCntAd(i)(k);
	if SlfTrgEdge(i)(k) = 1
		then InWdCnt(i)(k) <= InWdCnt(i)(k) + 1;			  -- Increment Event word counter
			 BufferIn(i)(k) <= ControllerNo & PortNo & GA & ChanArray(8*i+k);
			 BufferWrtAdd(i)(k) <= BufferWrtAdd(i)(k) + 1; -- Increment Writing Address
	end if;
elsif Input_Seqs(i)(k) = WrtTimeStamp 
then
	startEVB(i)(k)	  <= '0'; 		
	In_Seq_Stat(i)(k) <= x"3";
	BufferWrtAdd(i)(k) <= BufferWrtAdd(i)(k) + 1; -- Increment Writing Address
	InWdCnt(i)(k) <= InWdCnt(i)(k) + 1;			  -- Increment Event word counter
	BufferIn(i)(k) <= ADCSmplCntReg & uBunchOffset(i);
elsif Input_Seqs(i)(k) = WrtHitWdCnt 
then
	startEVB(i)(k)	  <= '0'; 
	In_Seq_Stat(i)(k) <= x"4";		
	WrtNxtWdCntAd(i)(k) <= BufferWrtAdd(i)(k) + 1; -- After writing the leading word count the pointer needs to go to the end of the event
	BufferWrtAdd(i)(k) <= WrtCrrntWdCntAd(i)(k);
	BufferIn(i)(k) <= X"0" & "00" & InWdCnt(i)(k);
elsif Input_Seqs(i)(k) = WrtHits 
then
	startEVB(i)(k)	  <= '0';
	In_Seq_Stat(i)(k) <= x"5";
	BufferWrtAdd(i)(k) <= BufferWrtAdd(i)(k) + 1; -- Increment Writing Address
	ADCSmplCntr(i)(k) <= ADCSmplCntr(i)(k) - 1;	  -- Decrement ADC Sample Counter
	InWdCnt(i)(k) <= InWdCnt(i)(k) + 1;			  -- Increment Event word counter
	BufferIn(i)(k) <= "00" & dout_AFE(i)(k);
elsif Input_Seqs(i)(k) = LdNxtWrtAd 
then 
	startEVB(i)(k)	  <= '1';
	In_Seq_Stat(i)(k) <= x"6";
	BufferWrtAdd(i)(k) <= WrtNxtWdCntAd(i)(k);
else 
	startEVB(i)(k)	  <= '0';
	In_Seq_Stat(i)(k) <= x"7";
	BufferIn(i)(k) <= "00" & dout_AFE(i)(k);
	WrtCrrntWdCntAd(i)(k) <= WrtCrrntWdCntAd(i)(k);
end if;


-- =========================================================================
-- =========================== END OF FSM ==================================
-- =========================================================================



end if;
 
end process;

end generate;
end generate;

-- =========================================================================
-- ===========================     ILA    ==================================
-- =========================================================================
generateILA0: if true generate

	AFE_DataPath_ila_inst0: AFE_DataPath_ila0
	port map(
	clk    		=> SysClk, 	
	probe0	 	=> BufferIn(0)(0), -- 16 bits
    probe1(0) 	=> BufferWE(0)(0), 	-- 1 bit
    probe2	 	=> BufferWrtAdd(0)(0), 		-- 10 bits
    probe3	 	=> BufferRdAdd(0)(0),  -- 10 bits
    probe4		=> WrtCrrntWdCntAd(0)(0), 	-- 10 bits
    probe5	 	=> WrtNxtWdCntAd(0)(0), -- 10 bits
	probe6		=> ADCSmplCntr(0)(0), -- 4 bits 
	probe7  	=> In_Seq_Stat(0)(0), -- 4 bits
    probe8	 	=> InWdCnt(0)(0), -- 10 bits
	probe9		=> SlfTrgEdge(0)(0), -- 2 bits
	probe10	 	=> GateWidth(0), -- 12 bits 
	probe11	 	=> din_AFE(0)(0), -- 14 bits
    probe12	 	=> dout_AFE(0)(0) -- 14 bits
);

end GENERATE; 


generateILA1: if false generate

	AFE_DataPath_ila_inst1: AFE_DataPath_ila1
	port map(
	clk    		=> SysClk,
	probe0	 	=> ControllerNo,	-- 5 bits
    probe1	 	=> PortNo, 		 	-- 5 bits
    probe2	 	=> BeamOnLength,  	-- 12 bits
    probe3	 	=> BeamOffLength, 	-- 12 bits 
    probe4		=> ADCSmplCntReg, 	-- 4 bits 
    probe5	 	=> PipelineSet	 	-- 8 bits 
);

end GENERATE; 

generateILA2: if false generate

	AFE_DataPath_ila_inst2: AFE_DataPath_ila2
	port map(
	clk    		=> SysClk,
	probe0	 	=> std_logic_vector(Ped_Reg(0)(0)),	 -- 14 bits
    probe1	 	=> Pad_Avg_Count(0), -- 5 bits
    probe2(0) 	=> Avg_Req(0),  	 -- 1 bit
    probe3	 	=> std_logic_vector(Ped_Avg(0)(0)), 	 -- 16 bits 
    probe4		=> Avg_En(0) 		 -- 8 bits 

);
end generate;

generateILA3: if false generate

	AFE_DataPath_ila_inst3: AFE_DataPath_ila3
	port map(
	clk    		=> SysClk, 	
	probe0	 	=> GateWidth(0), -- 12 bits
    probe1(0) 	=> ADCSmplGate(0), 	-- 1 bit
    probe2(0) 	=> GateReq(0), 		-- 1 bit
    probe3	 	=> uBunchOffset(0), -- 12 bits
    probe4		=> std_logic_vector(Diff_Reg(0)(0)),	-- 14 bits
    probe5	 	=> MaskReg(0) 		-- 8 bits

);

end generate;


end Behavioral;

