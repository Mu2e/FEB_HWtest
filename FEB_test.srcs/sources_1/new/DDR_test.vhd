----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Micol Rigatti 
-- 
-- Create Date: 07/26/2023 11:13:37 AM
-- Design Name: 
-- Module Name: DDR_test - Behavioral
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

entity DDR_test is
    generic(
        -- DDR3L parameters
        DATA_WIDTH			: integer := 16;  -- 16 Both ARTY and FEB
        DDR3L_ADDR			: integer := 15;  -- 14: ARTY 15: FEB
        APP_ADDR			: integer := 29  -- 28: ARTY 29: FEB
    );
    port (
        Clk_100MHz			: in std_logic;
        Clk_200MHz			: in std_logic;
        SysClk				: in std_logic; -- 160 MHz
        ResetHi				: in std_logic;
    -- DDR3L pins
        DDR_DATA			: inout std_logic_vector(DATA_WIDTH-1 downto 0);
        DDR_ADDR			: out std_logic_vector(DDR3L_ADDR-1 downto 0);
        BA 					: out std_logic_vector(2 downto 0);
        DDR_CKE	 			: out std_logic_vector(0 downto 0);
        ODT 				: out std_logic_vector(0 downto 0);
        CS 					: out std_logic_vector(0 downto 0);
        DM 					: out std_logic_vector(1 downto 0);
        RAS,CAS				: out std_logic; 
        DDR_WE 				: out std_logic;
        DDR_CLKP,DDR_CLKN 	: out  std_logic_vector(0 downto 0);
        LDQS_P, LDQS_N 		: inout std_logic;
        UDQS_P, UDQS_N 		: inout std_logic;
        RESET_N				: out std_logic;
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
        AddrReg			  	: in std_logic_vector(11 downto 0);
        WRDL 				: in std_logic_vector(1 downto 0);
        RDDL				: in std_logic_vector(1 downto 0)
	-- Debug
        --DBG	 				: out std_logic_vector(9 downto 0)        
    );
end DDR_test;

architecture Behavioral of DDR_test is

-- Signals for the DDR3 Controller 
signal DDR3_addr          : std_logic_vector(28 downto 0); 
signal DDR3_cmd           : std_logic_vector(2 downto 0);
signal DDR3_en            : std_logic;

signal DDR3_wrt_data      : std_logic_vector(63 downto 0); 
signal DDR3_wrt_end       : std_logic;
signal DDR3_wrt_mask      : std_logic_vector(7 downto 0);
signal DDR3_wrt_en        : std_logic;

signal DDR3_rd_data       : std_logic_vector(63 downto 0);
signal DDR3_rd_data_end   : std_logic;
signal DDR3_rd_data_valid : std_logic;

signal DDR3_rdy           : std_logic;
signal DDR3_wrt_rdy       : std_logic;

signal app_sr_req         : std_logic;
signal app_ref_req        : std_logic;
signal app_zq_req         : std_logic;
signal app_sr_active      : std_logic;
signal app_ref_ack        : std_logic;
signal app_zq_ack         : std_logic;
signal Clk_50MHz          : std_logic; -- out from the MIG
signal DDR3_rst		      : std_logic; -- out from the MIG
signal init_calib_complete: std_logic;
signal device_temp        : std_logic_vector(11 downto 0);
signal sys_rst		      : std_logic; 
-- debug signals
signal ddr3_ila_wrpath    : std_logic_vector(390 downto 0);
signal ddr3_ila_rdpath    : std_logic_vector(1023 downto 0);
signal ddr3_ila_basic     : std_logic_vector(119 downto 0);
signal ddr3_vio_sync_out  : std_logic_vector(13 downto 0);
signal dbg_byte_sel       : std_logic_vector(1 downto 0);
signal dbg_sel_pi_incdec  : std_logic;
signal dbg_pi_f_inc       : std_logic;
signal dbg_pi_f_dec       : std_logic;
signal dbg_sel_po_incdec  : std_logic;
signal dbg_po_f_inc       : std_logic;
signal dbg_po_f_stg23_sel : std_logic;
signal dbg_po_f_dec       : std_logic;
signal dbg_pi_counter_read_val   : std_logic_vector(5 downto 0);
signal dbg_po_counter_read_val   : std_logic_vector(8 downto 0);
signal dbg_prbs_final_dqs_tap_cnt_r : std_logic_vector(107 downto 0);
signal dbg_prbs_first_edge_taps     : std_logic_vector(107 downto 0);
signal dbg_prbs_second_edge_taps    : std_logic_vector(107 downto 0);

Type DDR_FSM is (Reset, Idle, WaitReady, WaitReadyRd, PrepareData, WrtData, RdData, Pause);
signal DDR_FSM_state, DDR_Seq 	  : DDR_FSM;
signal DDRSeqStat 	 	  	  : std_logic_vector(3 downto 0);

-- Signals for DDR FSM
constant DDR_cmd_read 	  : std_logic_vector(2 downto 0) := b"001";
constant DDR_cmd_write 	  : std_logic_vector(2 downto 0) := b"000";
signal DDR3_Rd_addr       : std_logic_vector(27 downto 0); 
signal DDR_addr_bank 	  : std_logic_vector(2 downto 0);
signal DDR_addr_col 	  : std_logic_vector(9 downto 0);
signal DDR_addr_row 	  : std_logic_vector(13 downto 0);
signal done				  : std_logic;
signal success            : std_logic;
signal test_data          : std_logic_vector(63 downto 0); 
signal trig               : std_logic;

-- DEBUG signals
signal B_in	 			  : std_logic_vector(4 downto 0);	
signal B_out 	 		  : std_logic_vector(4 downto 0);	
signal startwrite         : std_logic;
signal startread          : std_logic;
signal resetFSM           : std_logic;

-- temperature 12 bit vector is the upper 12 bits of Q8.7 encoded temperature
-- 45C * 2^7 = 5760 = 0x1680 now take the upper 12 bits

constant device_temp_i: std_logic_vector(11 downto 0) := X"168";

begin
    
    
-- sys_rst <= '0', '1' after 100ns;
startwrite  <= B_out(0);
startread   <= B_out(1);
resetFSM    <= B_out(2);
sys_rst     <= B_out(4);

DDR_Controller : DDR3LController
port map(
    ddr3_dq       	  => DDR_DATA,
    ddr3_dqs_p(0)     => LDQS_P,
    ddr3_dqs_p(1)     => LDQS_N,
	ddr3_dqs_n(0)     => UDQS_P,
    ddr3_dqs_n(1)     => UDQS_N,
	ddr3_addr     	  => DDR_ADDR,
    ddr3_ba       	  => BA,
    ddr3_ras_n    	  => RAS,
    ddr3_cas_n    	  => CAS,
    ddr3_we_n     	  => DDR_WE,
    ddr3_reset_n  	  => RESET_N,
    ddr3_ck_p     	  => DDR_CLKP,
    ddr3_ck_n     	  => DDR_CLKN,
    ddr3_cke      	  => DDR_CKE,
    ddr3_cs_n     	  => CS,
    ddr3_dm       	  => DM,
    ddr3_odt      	  => ODT,
	
	
    app_addr          => DDR3_addr,   -- This input indicates the address for the current request.                      
    app_cmd           => DDR3_cmd,   -- This input selects the command for the current request.                      
    app_en            => DDR3_en,   -- This is the active-High strobe for the app_addr[], app_cmd[2:0], app_sz, and app_hi_pri inputs.           
    
	app_wdf_data      => DDR3_wrt_data,  -- This provides the data for write commands.           
    app_wdf_end       => DDR3_wrt_end, -- This active-High input indicates that the current clock cycle is the last cycle of input data on app_wdf_data[].            
    app_wdf_mask      => DDR3_wrt_mask,   -- This provides the mask for app_wdf_data[].         
    app_wdf_wren      => DDR3_wrt_en, -- This is the active-High strobe for app_wdf_data[].
	
    app_rd_data       => DDR3_rd_data, -- This provides the output data from read commands.             
    app_rd_data_end   => DDR3_rd_data_end, --  This active-High output indicates that the current clock cycle is the last cycle of output data on app_rd_data[]. This is valid only when app_rd_data_valid is active-High.     
    app_rd_data_valid => DDR3_rd_data_valid, -- This active-High output indicates that app_rd_data[] is valid.     
	
    app_rdy           => DDR3_rdy, -- This output indicates that the UI is ready to accept commands. If the signal is deasserted when app_en is enabled, the current app_cmd and app_addr must be retried until app_rdy is asserted.                  
    app_wdf_rdy       => DDR3_wrt_rdy,  -- This output indicates that the write data FIFO is ready to receive data. Write data is accepted when app_wdf_rdy = 1'b1 and app_wdf_wren = 1'b1.                 
    app_sr_req        => '0',   -- This input is reserved and should be tied to 0.              
    app_ref_req       => '0',   -- This active-High input requests that a refresh command be issued to the DRAM.               
    app_zq_req        => '0',   -- This active-High input requests that a ZQ calibration command be issued to the DRAM.               
    app_sr_active     => app_sr_active, -- This output is reserved.     
    app_ref_ack       => app_ref_ack, -- This active-High output indicates that the Memory Controller has sent the requested refresh command to the PHY interface.               
    app_zq_ack        => app_zq_ack,  -- This active-High output indicates that the Memory Controller has sent the requested ZQ calibration command to the PHY interface.              
    ui_clk            => Clk_50MHz,  -- This UI clock must be a half or quarter of the DRAM clock.      
    ui_clk_sync_rst   => DDR3_rst,  -- This is the active-High UI reset.         
    init_calib_complete => init_calib_complete,  -- PHY asserts init_calib_complete when calibration is finished.
	--device_temp_i	  => "000000000000",
    -- debug signals
--    ddr3_ila_wrpath   => ddr3_ila_wrpath,    
--    ddr3_ila_rdpath   => ddr3_ila_rdpath,    
--    ddr3_ila_basic    => ddr3_ila_basic,     
--    ddr3_vio_sync_out => ddr3_vio_sync_out,  
--    dbg_byte_sel      => dbg_byte_sel,       
--    dbg_sel_pi_incdec => dbg_sel_pi_incdec,  
--    dbg_pi_f_inc      => dbg_pi_f_inc,       
--    dbg_pi_f_dec      => dbg_pi_f_dec,       
--    dbg_sel_po_incdec => dbg_sel_po_incdec,  
--    dbg_po_f_inc      => dbg_po_f_inc,       
--    dbg_po_f_stg23_sel=> dbg_po_f_stg23_sel, 
--    dbg_po_f_dec      => dbg_po_f_dec,       
--    dbg_pi_counter_read_val   => dbg_pi_counter_read_val,
--    dbg_po_counter_read_val   => dbg_po_counter_read_val,
--    dbg_prbs_final_dqs_tap_cnt_r => dbg_prbs_final_dqs_tap_cnt_r,
--    dbg_prbs_first_edge_taps     => dbg_prbs_first_edge_taps,    
--    dbg_prbs_second_edge_taps    => dbg_prbs_second_edge_taps,   
    -- System Clock Ports
    sys_clk_i         => SysClk,
    -- Reference Clock Ports
    clk_ref_i         => Clk_200MHz,      
    device_temp       => device_temp, 
    device_temp_i     => device_temp_i, --The SYSMON leverages the Q fixed-point number format to provide a signed temperature value stored in the Celsius scale. Temperature information is stored in the 16 least significant bits of the register in a Q8.7 signed format. The Q8.7 format consists of a sign bit, 8 integer bits, and 7 fractional bits.
    sys_rst           => sys_rst     
);



-- DDR FSM: Read and Write
DDR_state_memory : process (Clk_50MHz, DDR3_rst)
begin 
    if CpldRst = '0' and (not DDR3_rst = '1') then -- DDR3_rst is active high 
		DDR_FSM_state 		<= Reset;
	elsif rising_edge (Clk_50MHz) then
		DDR_FSM_state		<= DDR_Seq;
	end if; 
end process; 

DDR_transition_table: process(DDR_FSM_state)
begin 
	case DDR_FSM_state is
	when Reset =>
			DDR_Seq 			<= Idle;
	when Idle =>
		if startwrite = '1' then -- Button 0 Write
			DDR_Seq 			<= WaitReady;
		elsif startread = '1' then -- Button 1 Read 
			DDR_Seq 			<= WaitReadyRd;
        elsif resetFSM = '1' then -- Button 2 Reset 
            DDR_Seq             <= Reset;
		else 
			DDR_Seq 			<= Idle;
		end if;		
	when WaitReady =>
		if DDR3_rdy = '1' then 
			DDR_Seq 			<= PrepareData;
        elsif resetFSM = '1' then -- Button 2 Reset 
            DDR_Seq             <= Reset;
		else 
			DDR_Seq 			<= WaitReady;
		end if;	
	when PrepareData =>
			DDR_Seq 			<= WrtData;
	when WrtData =>
		if DDR3_rdy = '0' then 
			DDR_Seq 			<= WaitReady;
		elsif done = '1' then 
			DDR_Seq 			<= Idle;
        elsif resetFSM = '1' then -- Button 2 Reset 
            DDR_Seq             <= Reset;
		else 
			DDR_Seq 			<= WrtData;
		end if;	
    when WaitReadyRd =>
		if DDR3_rdy = '1' then 
			DDR_Seq 			<= RdData;
        elsif resetFSM = '1' then -- Button 2 Reset 
            DDR_Seq             <= Reset;
		else 
			DDR_Seq 			<= WaitReady;
		end if;	
	when RdData =>
		if done = '1' then 
			DDR_Seq 			<= Idle;
        elsif resetFSM = '1' then -- Button 2 Reset 
            DDR_Seq             <= Reset;	
		else 
			DDR_Seq 			<= RdData;
		end if;


	when others =>
			DDR_Seq 			<= Idle;
	end case;
end process;


DDR_output_table : process(Clk_50MHz, DDR_FSM_state)
begin
if rising_edge(Clk_50MHz) then
	-- Default value of the output 
	case DDR_FSM_state is
		when Reset =>  
		DDRSeqStat	  	<= X"0";
		DDR3_cmd    	<= (others => '0');       
		DDR3_en     	<= '0';	       
		DDR3_addr   	<= (others => '0'); 
		DDR3_wrt_data	<= (others => '0'); 
        test_data   	<= (others => '0');
		DDR3_wrt_end 	<= '0';
		DDR3_wrt_mask	<= (others => '0'); 
		DDR3_wrt_en		<= '0';
		done			<= '0'; 
        success         <= '0';
        trig            <= '0';
		
		when Idle =>
		DDRSeqStat	  	<= X"1";
		DDR3_cmd    	<= (others => '0');       
		DDR3_en     	<= '0';	       
		DDR3_addr   	<= (others => '0');  
		DDR3_wrt_end 	<= '0';
		DDR3_wrt_mask	<= (others => '0'); 
        DDR3_wrt_data	<= (others => '0'); 
		DDR3_wrt_en		<= '0';
		done			<= '0'; 
        success         <= '0';
        trig            <= '0';

		when WaitReady => 
		DDRSeqStat	  	<= X"2";
		
		when PrepareData =>
		DDRSeqStat	  	<= X"3";
		
		when WrtData =>
		DDRSeqStat	  	<= X"4";

        trig            <= '1';		
		if DDR3_wrt_rdy = '1' then 
		DDR3_cmd		<= DDR_cmd_write;
		DDR3_en     	<= '1';
		DDR3_wrt_end 	<= '1';
		DDR3_wrt_mask	<= (others => '0'); 
		DDR3_wrt_en		<= '1';
		DDR3_wrt_data	<= DDR3_wrt_data + x"10";
		DDR3_addr		<= DDR3_addr + x"10";
		if DDR3_addr = b"000" & x"000100" then 
			done <= '1';
		end if; 
		end if; 
		
        when WaitReadyRd =>
		DDRSeqStat	  	<= X"7";


		when RdData =>
		DDRSeqStat	  	<= X"5";
        trig            <= '1';	
		DDR3_cmd		<= DDR_cmd_read;
		DDR3_en     	<= '1';
		DDR3_addr		<= DDR3_addr + x"10";

        test_data   	<= test_data + x"10";
        if DDR3_rd_data = test_data then 
            success <= '1';
        else 
            success <= '0';
        end if;
		if DDR3_addr = b"000" & x"000100" then 
			done <= '1';
		end if; 

		when others =>
		DDRSeqStat	  	<= X"6";
	
		end case;
end if;
end process;

--buttons: vio_0
--port map(
--	clk				=> SysClk,         
--	probe_in0		=> B_in(0 downto 0),   
--    probe_in1		=> B_in(1 downto 1),   
--    probe_in2		=> B_in(2 downto 2),   
--    probe_in3		=> B_in(3 downto 3),   
--    probe_in4		=> B_in(4 downto 4),   
--	probe_out0		=> B_out(0 downto 0), 
--    probe_out1      => B_out(1 downto 1), 
--    probe_out2      => B_out(2 downto 2), 
--    probe_out3      => B_out(3 downto 3), 
--    probe_out4      => B_out(4 downto 4)
--); 

generateILA0: if false generate
ila : DDR_ila_0 
port map(
	clk 		=> Clk_200MHz, 
	probe0 		=> DDR3_addr,         
    probe1 		=> DDR3_cmd,          
    probe2(0)	=> DDR3_en,           
    probe3 		=> DDR3_wrt_data,     
    probe4(0)	=> DDR3_wrt_end,      
    probe5 		=> DDR3_wrt_mask,     
    probe6(0)	=> DDR3_wrt_en,       
    probe7 		=> DDR3_rd_data,      
    probe8(0) 	=> startwrite, --DDR3_rd_data_end,  
    probe9(0) 	=> startread, --DDR3_rd_data_valid,
    probe10(0) 	=> DDR3_rdy,          
	probe11(0) 	=> DDR3_wrt_rdy,
	probe12	 	=> DDRSeqStat,
    probe13(0)	=> done,         
    probe14(0)  => resetFSM, --success,          
    probe15(0)	=> trig, 
    probe16  	=> test_data,
    probe17(0) 	=> init_calib_complete,
    probe18(0) 	=> sys_rst,
    probe19(0)  => DDR3_rst    
);  

end GENERATE; 

--testila : DDR_ila_1
--port map(
--	clk 		=> SysClk, 
--	probe0 (0)	=> done,         
--    probe1(0)   => success,          
--    probe2(0)	=> trig,           
--    probe3 		=> DDR3_addr,     
--    probe4  	=> DDR3_wrt_data,      
--    probe5 		=> DDR3_rd_data,     
--    probe6  	=> test_data,       
--    probe7 		=> DDRSeqStat
--);  


end Behavioral;
