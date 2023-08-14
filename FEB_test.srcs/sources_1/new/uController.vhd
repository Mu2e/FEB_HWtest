----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Micol Rigatti 
-- 
-- Create Date: 08/03/2023 16:38:37 AM
-- Design Name: 
-- Module Name: uController_interface - Behavioral
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

entity uController_interface is
    port (
        Clk_100MHz			: in std_logic;
		ResetHi			    : in std_logic;
    -- Microcontroller strobes
        CpldRst				: in std_logic;
		CpldCS				: in std_logic;
    -- Microcontroller data and address buses	
        uCA 				: in std_logic_vector(11 downto 0);
        uCD 				: in std_logic_vector(15 downto 0);
    -- Geographic address pins
        GA 					: in std_logic_vector(1 downto 0);
    -- Synchronous edge detectors of uC read and write strobes
        uWRDL 				: in std_logic_vector(1 downto 0);
		uRDDL 				: in std_logic_vector(1 downto 0);
        uAddrReg 			: in std_logic_vector(11 downto 0);

        iCD                 : out std_logic_vector(15 downto 0);
    -- OUTPUT REGISTERS     
    -- ADC mux
        MuxSelReg           : in std_logic_vector(2 downto 0);
        MuxadReg            : in std_logic_vector(1 downto 0);
	-- Trigger
		FlashEn  			: in std_logic; 	         
		PulseSel 			: in std_logic;
		LEDSrc				: in std_logic;
		TurnOnTime  		: in std_logic_vector (8 downto 0);
		TurnOffTime 		: in std_logic_vector (8 downto 0);
		LEDTime	   			: in std_logic_vector (8 downto 0);
		TmgSrcSel			: in std_logic; 
		SlfTrgEn 			: in std_logic;
		uBunch   			: in std_logic_vector(31 downto 0);
		TrgSrc		        : in std_logic;
	-- LVDS logic
		FMTxBuff_full		: in std_logic;
		FMTxBuff_empty		: in std_logic;
	-- AFE Logic
		AFEPDn				: in std_logic_vector(1 downto 0);
		dout_afe0			: in Array_8x14;
		done				: in std_logic_vector(1 downto 0);
	-- DAC logic
		AlignReq            : in std_logic_vector (1 downto 0);
		AFERdReg            : in std_logic_vector (15 downto 0);
	-- AFE DataPath logic
		PipelineSet 		: in std_logic_vector (7 downto 0);
		MaskReg				: in Array_2x8;
		In_Seq_Stat 		: in Array_2x8x4;
		ControllerNo 		: in std_logic_vector (4 downto 0);
		PortNo 				: in std_logic_vector (4 downto 0);
		BeamOnLength 		: in std_logic_vector (11 downto 0);
		BeamOffLength 		: in std_logic_vector (11 downto 0);
		ADCSmplCntReg 		: in std_logic_vector (3 downto 0);
		Ped_Reg				: in Arrays_8x2x14;
		IntTrgThresh 		: in Arrays_8x2x14
	);
end uController_interface;

architecture Behavioral of uController_interface is

-- Make a test counter that increments with each read
signal TestCount : std_logic_vector (31 downto 0);
-- Uptime counter to check for un-anticipated resets
signal UpTimeCount : std_logic_vector (31 downto 0);
signal UpTimeStage : std_logic_vector (31 downto 0);
signal Counter1s   : std_logic_vector (27 downto 0);

-- AFE DEBUG signals 
signal AFE_DBG_wr_en 	   : std_logic;	
signal AFE_DBG_rd_en 	   : std_logic;
signal AFE_DBG_din 	   	   : std_logic_vector(15 downto 0);
signal AFE_DBG_dout 	   : std_logic_vector(15 downto 0);
signal AFE_DBG_full 	   : std_logic;
signal AFE_DBG_empty 	   : std_logic;
signal AFE_DBG_data_count  : std_logic_vector(10 downto 0);

constant AFEDBGAddr		   : AddrPtr  := "00" & X"AB";

begin    

TestCounter : process(Clk_100MHz, CpldRst)
begin 
if CpldRst = '0' then
    TestCount <= (others => '0');
elsif rising_edge (Clk_100MHz) then
-- Testcounter counter is writeable. For each read of the lower half, the entire
-- 32 bit counter increments
    if uWRDL = 1 and  uCA(11 downto 10) = GA and uCA(9 downto 0) = TestCounterHiAd then 
        TestCount <= uCD & TestCount(15 downto 0);
    elsif uWRDL = 1 and  uCA(11 downto 10) = GA and uCA(9 downto 0) = TestCounterLoAd then 
        TestCount <= TestCount(31 downto 16) & uCD;
    elsif uRDDL = 2 and uAddrReg(11 downto 10) = GA and uAddrReg(9 downto 0) = TestCounterLoAd then 
        TestCount <= TestCount + 1;
    else 
        TestCount <= TestCount;
    end if;
end if;
end process;


counters : process(Clk_100MHz, CpldRst)
begin 
if CpldRst = '0' then
	
	UpTimeStage 	<= (others => '0');
	UpTimeCount 	<= (others => '0');
	Counter1s       <= (others => '0');

elsif rising_edge (Clk_100MHz) then

	-- 1 second time base
	if	Counter1s = Count1s then 
	    Counter1s <= (others => '0');
	else
	    Counter1s <= Counter1s + 1; 
	end if;

	-- Register for staging uptime count.
	if CpldCS = '1' then 
		UpTimeStage <= UpTimeCount;
	else 
		UpTimeStage <= UpTimeStage;
	end if;

	-- Uptime in seconds since th last FPGA configure
	if	Counter1s = Count1s then 
		UpTimeCount <= UpTimeCount + 1;
	else 
		UpTimeCount <= UpTimeCount;
	end if;

end if;
end process;

-- AFE DEBUG FIFO
AFE_DEBUG : SCFIFO_1Kx16
port map (
	rst 		=> ResetHi,
	clk 		=> Clk_100MHz,
	wr_en 		=> AFE_DBG_wr_en, 	   
	rd_en 		=> AFE_DBG_rd_en, 	   
	din 		=> AFE_DBG_din, 	   
    dout		=> AFE_DBG_dout, 	   
    empty 		=> AFE_DBG_empty, 	   
	full 		=> AFE_DBG_full, 	   
	data_count  => AFE_DBG_data_count 
);

AFE_DBG_din <= "00" & dout_afe0(0);

AFE_FIFO_DEBUG : process(Clk_100MHz, CpldRst)
begin 
if CpldRst = '0' then
	
	AFE_DBG_wr_en 	<= '0';
	AFE_DBG_rd_en 	<= '0';
	--AFE_DBG_din     <= (others => '0');

elsif rising_edge (Clk_100MHz) then


	if AFE_DBG_full = '0' and done(0) = '1' then 
	    AFE_DBG_wr_en <= '1';
	else
	    AFE_DBG_wr_en <= '0';
	end if;

	if uRDDL = 2 and uAddrReg(11 downto 10) = GA and uAddrReg(9 downto 0) = AFEDBGAddr then 
	
		AFE_DBG_rd_en <= '1'; 
	else 
		AFE_DBG_rd_en <= '0';

   end if;

end if;
end process;




with uCA(9 downto 0) select

iCD <= 	 X"000" & "00" & AFEPDn when CSRRegAddr,
		 X"000" & "00" & AlignReq when SlipCtrlAd,
		 AFE_DBG_dout when AFEDBGAddr, 
		-- X"0" & '0' & SlipCntReg(1)
		--	& X"0" & '0' & SlipCntReg(0) when SlipCntRegAd,
		-- X"00" & WidthReg when GateAddr,
		-- DRAMRdBuffOut when PageFIFOAddr,
		-- X"0" & '0' & DRAMRdBuffWdsUsed when PageFIFOWdsAd,
		-- X"0" & Read_Seq_Stat & X"0" & '0' &  DDRWrtSeqStat when WriteSeqStatAd,
		X"00" & PipelineSet when PipeLineAddr,
		X"00" & "000" & MuxSelReg & MuxadReg when MuxCtrlAd,
		MaskReg(1) & MaskReg(0) when InputMaskAddr,
		-- In_Seq_Stat(1)(7 downto 0) & In_Seq_Stat(0)(7 downto 0) when InseqStatAd, --TODO: fix this 
		X"000" & '0' & LEDSrc & PulseSel & FlashEn when FlashCtrlAddr,
		UpTimeStage(31 downto 16) when UpTimeRegAddrHi,
		UpTimeStage(15 downto 0) when UpTimeRegAddrLo,
		TestCount(31 downto 16) when TestCounterHiAd,
		TestCount(15 downto 0) when TestCounterLoAd,
		X"000" & "00" & FMTxBuff_full & FMTxBuff_empty when LVDSTxFIFOStatAd,
		X"0" & BeamOnLength when BeamOnLengthAd,
		X"0" & BeamOffLength when BeamOffLengthAd,
		"0000000" & TurnOnTime when OnTimeAddr,
		"0000000" & TurnOffTime when OffTimeAddr,
 		"0000000" & LEDTime when LEDTimeAddr,
		-- "00" & SDWrtAd(29 downto 16) when SDRamWrtPtrHiAd,
		-- SDWrtAd(15 downto 0) when SDRamWrtPtrLoAd,
		-- "00" & SDRdAD(29 downto 16) when SDRamRdPtrHiAd,
		-- SDRdAD(15 downto 0) when SDRamRdPtrLoAd,
		-- DDRRd_Mux(7 downto 0) & DDRRd_Mux(15 downto 8) when SDRamSwapPort,
		-- DDRRd_Mux when SDRamPortAd,
		AFERdReg when AFERdDataAd,
		-- '0' & DDR_Rd_Cnt & '0' & SDwr_count when DDRCountAddr,
		-- X"0" & '0' & SDrd_empty & SDrd_full & SDcmd_empty(1) & SDcmd_full(1) 
		-- & SDwr_underrun & SDwr_empty & SDwr_full & SDcmd_empty(0) & SDcmd_full(0) 
		-- & SDCalDn & SD_RstO when DDRStatAddr,
		-- HistInterval when HistIntvalAd,
		-- X"00" & '0' & HistEnReq(1) & HistEnReq(0) & HistMode & '0' & HistChan when HistCtrlAd,
 		-- X"0" & std_logic_vector(Hist_Offset_Reg) when HistOfstAd,
		-- X"0" & '0' & HistAddrb(0) when HistPtrAd0,
		-- X"0" & '0' & HistAddrb(1) when HistPtrAd1,
		-- Hist_Outb(0) when HistRd0Ad,
		-- Hist_Outb(1) when HistRd1Ad,
		GA & "00" & X"001" when DebugVersionAd,
		"00" & std_logic_vector(Ped_Reg(0)(0)) when PedRegAddr(0)(0),
		"00" & std_logic_vector(Ped_Reg(0)(1)) when PedRegAddr(0)(1),
		"00" & std_logic_vector(Ped_Reg(0)(2)) when PedRegAddr(0)(2),
		"00" & std_logic_vector(Ped_Reg(0)(3)) when PedRegAddr(0)(3),
		"00" & std_logic_vector(Ped_Reg(0)(4)) when PedRegAddr(0)(4),
		"00" & std_logic_vector(Ped_Reg(0)(5)) when PedRegAddr(0)(5),
		"00" & std_logic_vector(Ped_Reg(0)(6)) when PedRegAddr(0)(6),
		"00" & std_logic_vector(Ped_Reg(0)(7)) when PedRegAddr(0)(7),
		"00" & std_logic_vector(Ped_Reg(1)(0)) when PedRegAddr(1)(0),
		"00" & std_logic_vector(Ped_Reg(1)(1)) when PedRegAddr(1)(1),
		"00" & std_logic_vector(Ped_Reg(1)(2)) when PedRegAddr(1)(2),
		"00" & std_logic_vector(Ped_Reg(1)(3)) when PedRegAddr(1)(3),
		"00" & std_logic_vector(Ped_Reg(1)(4)) when PedRegAddr(1)(4),
		"00" & std_logic_vector(Ped_Reg(1)(5)) when PedRegAddr(1)(5),
		"00" & std_logic_vector(Ped_Reg(1)(6)) when PedRegAddr(1)(6),
		"00" & std_logic_vector(Ped_Reg(1)(7)) when PedRegAddr(1)(7),
		"00" & std_logic_vector(IntTrgThresh(0)(0)) when ThreshRegAddr(0)(0),
		"00" & std_logic_vector(IntTrgThresh(0)(1)) when ThreshRegAddr(0)(1),
		"00" & std_logic_vector(IntTrgThresh(0)(2)) when ThreshRegAddr(0)(2),
		"00" & std_logic_vector(IntTrgThresh(0)(3)) when ThreshRegAddr(0)(3),
		"00" & std_logic_vector(IntTrgThresh(0)(4)) when ThreshRegAddr(0)(4),
		"00" & std_logic_vector(IntTrgThresh(0)(5)) when ThreshRegAddr(0)(5),
		"00" & std_logic_vector(IntTrgThresh(0)(6)) when ThreshRegAddr(0)(6),
		"00" & std_logic_vector(IntTrgThresh(0)(7)) when ThreshRegAddr(0)(7),
		"00" & std_logic_vector(IntTrgThresh(1)(0)) when ThreshRegAddr(1)(0),
		"00" & std_logic_vector(IntTrgThresh(1)(1)) when ThreshRegAddr(1)(1),
		"00" & std_logic_vector(IntTrgThresh(1)(2)) when ThreshRegAddr(1)(2),
		"00" & std_logic_vector(IntTrgThresh(1)(3)) when ThreshRegAddr(1)(3),
		"00" & std_logic_vector(IntTrgThresh(1)(4)) when ThreshRegAddr(1)(4),
		"00" & std_logic_vector(IntTrgThresh(1)(5)) when ThreshRegAddr(1)(5),
		"00" & std_logic_vector(IntTrgThresh(1)(6)) when ThreshRegAddr(1)(6),
		"00" & std_logic_vector(IntTrgThresh(1)(7)) when ThreshRegAddr(1)(7),
		X"000" & "00" & TrgSrc & '0' when TrigCtrlAddr,
		X"000" & ADCSmplCntReg when ADCSmplCntrAd,
		X"000" &"00" & SlfTrgEn & TmgSrcSel when IntTrgEnAddr,
		"000" & ControllerNo & "000" & PortNo when FEBAddresRegAd,
		-- "00" & FRDat(0) & "00" & FRDat2(0) when FRDat0RegAd,
		-- "00" & FRDat(1) & "00" & FRDat2(1) when FRDat1RegAd,
		uBunch(15 downto  0)        when uBLoAd,
		uBunch(31 downto 16)        when uBHiAd,
		-- uBunchBuffOut(15 downto  0) when uBBuffLoAd,
		-- uBunchBuffOut(31 downto 16) when uBBuffHiAd,
		-- DDRAddrOut(15 downto  0)    when uBBuffAdLoAd,
		-- DDRAddrOut(31 downto 16)    when uBBuffAdHiAd,
		X"0000" when others;

end Behavioral;