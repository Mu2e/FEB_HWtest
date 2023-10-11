----------------------------------------------------------------------------------
-- Company: FNAL
-- Engineer: Micol Rigatti <mrigatti@fnal.gov>
-- 
-- Create Date: 09/09/2022 09:05:03 AM
-- Design Name: AFE_Interface.vhd
-- Module Name: AFE_Interface - Behavioral
-- Project Name: CRV FEB
-- Target Devices: xc7s50fgga484-2
-- Tool Versions: 2021.2
-- Description: Based on the project of Jamieson Olsen <jamieson@fnal.gov> 
 
----------------------------------------------------------------------------------

LIBRARY ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use IEEE.numeric_std.all;
Library UNISIM;
use UNISIM.vcomponents.all;

use work.Proj_Def.all;
use work.Debug_ILA.all;

-- The 7series FPGAs ISERDESE2 modules when in DDR mode and cascaded together, 
-- only support 10 and 14 bit transmission modes. The AFE chip used on the CRV 
-- FEB board is AFE5807ZCF and it supports 12 and 14 bit transmission mode.
-- In this configuration ISERDESE2 and the AFE chips are set in 14 bit mode. 


entity AFE_Interface is
port(
	-- AFE Input clocks
	AFE0Clk_P, AFE0Clk_N    : out std_logic; -- Copy of 80MHz master clock sent to AFE chips
	AFE1Clk_P, AFE1Clk_N    : out std_logic;
	-- AFE Data lines
	AFE0Dat_P, AFE0Dat_N    : in std_logic_vector(7 downto 0); -- LVDS pairs from an AFE chip (8 channels)
	AFE1Dat_P, AFE1Dat_N    : in std_logic_vector(7 downto 0);
	-- AFE clock, framing lines
	AFEDCLK_P, AFEDCLK_N    : in std_logic_vector(1 downto 0); -- Unused in this design 
	AFE0FCLK_P, AFE0FCLK_N  : in std_logic; -- LVDS pairs of the Frame Clock
	AFE1FCLK_P, AFE1FCLK_N  : in std_logic; -- LVDS pairs of the Frame Clock
	-- AFE serial control lines
	AFEPDn 				    : buffer std_logic_vector(1 downto 0);
	AFECS 				    : buffer std_logic_vector(1 downto 0);
	AFERst 				    : buffer std_logic;
	AFESClk			  	    : buffer std_logic;
	AFESDI			  	    : out std_logic;
	AFESDO 				    : in std_logic;			    
    -- FPGA interface       
    Clk_80MHz			    : in  std_logic; 	-- Master clock 80MHz
    Clk_100MHz			    : in  std_logic; 	-- uController clock 
    Clk_560MHz			    : in  std_logic; 	-- 7 x Master clock = 560MHz
    Clk_200MHz			    : in  std_logic; 	-- 200 MHz refclk for the IDELAY2
    reset				    : in  std_logic;
    done				    : out std_logic_vector(1 downto 0); -- status of automatic alignment FSM
    warn				    : out std_logic_vector(1 downto 0); -- pulse to indicate an error was seen in the FCLK pattern
    dout_afe0				: out Array_8x14; -- data synchronized to clock
    dout_afe1				: out Array_8x14;  -- data synchronized to clock
    -- Microcontroller strobes
	CpldRst					: in std_logic;
	CpldCS					: in std_logic;
	uCWr 					: in std_logic;
-- Microcontroller data and address buses	
	uCA 					: in std_logic_vector(11 downto 0);
	uCD 					: in std_logic_vector(15 downto 0);        
-- Geographic address pins
	GA 						: in std_logic_vector(1 downto 0);
-- Synchronous edge detectors of uC read and write strobes
	uWRDL 					: in std_logic_vector(1 downto 0)						    	
	
  );
end AFE_Interface;

architecture AFE_Interface_Architecture of AFE_Interface is
------------------------
-- SLOW CONTROL (SPI) --
------------------------
component spi_master is
generic(
    slaves  : INTEGER := 2;  --number of spi slaves
    d_width : INTEGER := 24); --data bus width
port(
    clock   : in std_logic;                             --system clock
    reset_n : in std_logic;                             --asynchronous reset
    enable  : in std_logic;                             --initiate transaction
    cpol    : in std_logic;                             --spi clock polarity
    cpha    : in std_logic;                             --spi clock phase
    cont    : in std_logic;                             --continuous mode command
    clk_div : in integer;                               --system clock cycles per 1/2 period of sclk
    addr    : in integer;                               --address of slave
    tx_data : in std_logic_vector(d_width-1 downto 0);  --data to transmit
    miso    : in std_logic;                             --master in, slave out
    sclk    : buffer std_logic;                             --spi clock
    ss_n    : buffer std_logic_vector(slaves-1 downto 0);   --slave select
    mosi    : out std_logic;                             --master out, slave in
    busy    : out std_logic;                             --busy / data ready signal
    rx_data : out std_logic_vector(d_width-1 downto 0)   --data received
); 
end component;

signal spi_enable   : std_logic;
signal spi_busy     : std_logic;
signal spi_tx_data  : std_logic_vector(23 downto 0);
signal spi_rx_data  : std_logic_vector(23 downto 0);
signal spi_addr_AFE : integer;


Type AFE_spi_FSM is (ResetState, Idle, Init, SoftReset, EnOutput, testPattern, serDataRate, ADCresolution, 
                    waitSPI1, waitSPI2, waitSPI3, waitSPI4, waitSPI5, waitSPI6, waitSPI7, waitSPI8);
signal prev_state, AFE_spi : AFE_spi_FSM;
signal AFE_spi_Stat : std_logic_vector(3 downto 0);
-- DEBUG signals
signal B_in	 			  : std_logic_vector(4 downto 0);	
signal B_out 	 		  : std_logic_vector(4 downto 0);	
signal startwrite         : std_logic;
signal startread          : std_logic;
signal resetFSM           : std_logic;
signal AFEpower0          : std_logic;
signal AFEpower1          : std_logic;
signal AFEreset           : std_logic;
----------------------------
-- END SLOW CONTROL (SPI) --
----------------------------

component auto_afe
port(
    afe_p: in std_logic_vector(8 downto 0);
    afe_n: in std_logic_vector(8 downto 0);
    clock:   in  std_logic;  -- master clock 
    clock7x: in  std_logic;  -- 7 x master clock
    reset:   in  std_logic;
    done:    out std_logic;
    warn:    out std_logic;
    dout:    out Array_8x14
  );
end component;


signal ClkOut_80MHz			: std_logic;
signal rst_reg			 	: std_logic_vector(15 downto 0);
signal idelayctrl_rst_reg	: std_logic;
signal afe0_p, afe0_n	    : std_logic_vector(8 downto 0);
signal afe1_p, afe1_n		: std_logic_vector(8 downto 0);	

begin

--    -- Forward the 80MHz Master clock to the 2 AFEs
--    ODDR_inst: ODDR --Dedicated Dual Data Rate (DDR) Output Register
--	generic map( DDR_CLK_EDGE => "OPPOSITE_EDGE" )
--	-- OPPOSITE_EDGE mode The data transmit interface uses classic DDR methodology. 
--	-- Given a data and clock at pin D1-2 and C respectively, D1 is sampled at every 
--	-- positive edge of clock C and D2 is sampled at every negative edge of clock C. 
--	-- Q changes every clock edge.
--    port map(
--        Q => ClkOut_80MHz, 
--        C => Clk_80MHz,
--        CE => '1',
--        D1 => '1',
--        D2 => '0',
--        R  => '0',
--        S  => '0');

    OBUFDS_inst0: OBUFDS
        generic map(IOSTANDARD=>"LVDS")
        port map(I => Clk_80MHz, O => AFE0Clk_P, OB => AFE0Clk_N);

    OBUFDS_inst1: OBUFDS
        generic map(IOSTANDARD=>"LVDS")
        port map(I => Clk_80MHz, O => AFE1Clk_P, OB => AFE1Clk_N);

-- The AFE chips are running with an 80MHz clock and they are in 14 bit mode
-- therefore the data rate per LVDS pair is 1.120Gbps and the data bit width 
-- is 892ps. 
-- Due to routing and clock buffer delay inside the FPGA grid, DCLK (the x7 clock
-- sampling data) must be repositioned for capturing data and frame signals. This is 
-- achieved by inserting and IDELAY on the data and frame line.
-- In the FPGA the IDELAY is clocked with a 200MHz refclk, therefore
-- each IDELAY tap is a delay of 78ps. Thus the data bit width in IDELAY taps
-- is 892ps/78ps = 11.4.... lets call it 12. The automatic alignment FSM needs
-- to know this number when it is hunting for the center of the bit.

	-- Make the special reset pulse for the IDELAYCTRL module. needs to be 59.28ns minimum
    rst_proc: process(Clk_200MHz)
    begin
        if rising_edge(Clk_200MHz) then -- sampling @ 200MHz
            rst_reg <= rst_reg(14 downto 0) & reset;
            if (rst_reg = X"0000") then
                idelayctrl_rst_reg <= '0';
            else
                idelayctrl_rst_reg <= '1';  -- high for 80ns
            end if;
        end if;
    end process rst_proc;
    
    -- This controller is required for calibrating IDELAY elements
    IDELAYCTRL_inst: IDELAYCTRL
        port map(
            REFCLK => Clk_200MHz,
            RST    => idelayctrl_rst_reg, -- minimum pulse width is 60ns! MUST pulse this before using idelay!
            RDY    => open);

    -- Make 2 automatic AFE modules
	
	afe0_p <= AFE0FCLK_P & AFE0Dat_P;  
	afe0_n <= AFE0FCLK_N & AFE0Dat_N;
	afe1_p <= AFE1FCLK_P & AFE1Dat_P; 
	afe1_n <= AFE1FCLK_N & AFE1Dat_N;
	
    afe0_inst: auto_afe
    port map(
        afe_p   => afe0_p,
        afe_n   => afe0_n,
        clock   => Clk_80MHz,
        clock7x => Clk_560MHz,
        reset   => reset,
        done    => done(0),
        warn    => warn(0),
        dout    => dout_afe0
    );

    afe1_inst: auto_afe
    port map(
        afe_p   => afe1_p,
        afe_n   => afe1_n,
        clock   => Clk_80MHz,
        clock7x => Clk_560MHz,
        reset   => reset,
        done    => done(1),
        warn    => warn(1),
        dout    => dout_afe1
    );


-- SLOW CONTROL (SPI)
startwrite  <= B_out(0);
--AFEreset    <= B_out(1);
resetFSM    <= '0'; -- B_out(2);
--AFEpower0   <= B_out(3);
--AFEpower1   <= B_out(4);

AFEspi : spi_master
port map(
  clock     => Clk_100MHz, 
  reset_n   => CpldRst, 
  enable    => spi_enable, 
  cpol      => '0',
  cpha      => '0',
  cont      => '0',
  clk_div   => 5, -- 10 MHz
  addr      => spi_addr_AFE,
  tx_data   => spi_tx_data,
  miso      => AFESDO,         
  sclk      => AFESClk,  
  ss_n      => AFECS, 
  mosi      => AFESDI, 
  busy      => spi_busy,
  rx_data   => spi_rx_data
  ); 


state_memory : process (Clk_100MHz, CpldRst)
begin 
    if CpldRst = '0' then
        prev_state 		<= ResetState;
    elsif rising_edge (Clk_100MHz) then
        prev_state		<= AFE_spi;
    end if; 
end process; 

transition_table: process(Clk_100MHz, prev_state)
begin
    case prev_state is
    when ResetState =>
            AFE_spi 			<= Idle;
    when Idle =>
        if startwrite = '1' then
            AFE_spi 			<= Init;
        elsif resetFSM = '1' then
            AFE_spi             <= ResetState;
        else 
            AFE_spi 			<= Idle;
        end if;		
    when Init => 
        if startwrite = '0' then
            AFE_spi 			<= SoftReset;
        elsif resetFSM = '1' then
            AFE_spi             <= ResetState;
        else 
            AFE_spi 			<= Init;
        end if;	
    when SoftReset => -- Soft ResetState 
        if spi_busy = '1' then
            AFE_spi 			<= SoftReset;
        elsif resetFSM = '1' then
            AFE_spi             <= ResetState;
        else 
            AFE_spi 			<= waitSPI1;
        end if;	
    when waitSPI1 => 
            AFE_spi 			<= waitSPI2;	
    when waitSPI2 => 
        if spi_busy = '1' then
            AFE_spi 			<= waitSPI2;
        elsif resetFSM = '1' then
            AFE_spi             <= ResetState;
        else 
            AFE_spi 			<= EnOutput;
        end if;	
    when EnOutput =>  
        if spi_busy = '1' then
            AFE_spi 			<= EnOutput;
        elsif resetFSM = '1' then
            AFE_spi             <= ResetState;
        else 
            AFE_spi 			<= waitSPI3;
        end if;
    when waitSPI3 => 
            AFE_spi 			<= waitSPI4;	
    when waitSPI4 => 
        if spi_busy = '1' then
            AFE_spi 			<= waitSPI4;
        elsif resetFSM = '1' then
            AFE_spi             <= ResetState;
        else 
            AFE_spi 			<= testPattern;
        end if;		
    when testPattern =>  
        if spi_busy = '1' then
            AFE_spi 			<= testPattern;
        elsif resetFSM = '1' then
            AFE_spi             <= ResetState;
        else 
            AFE_spi 			<= waitSPI5;
        end if;	
    when waitSPI5 => 
        AFE_spi 			<= waitSPI6;	
    when waitSPI6 => 
    if spi_busy = '1' then
        AFE_spi 			<= waitSPI6;
    elsif resetFSM = '1' then
        AFE_spi             <= ResetState;
    else 
        AFE_spi 			<= serDataRate;
    end if;
    when serDataRate =>  
        if spi_busy = '1' then
            AFE_spi 			<= serDataRate;
        elsif resetFSM = '1' then
            AFE_spi             <= ResetState;
        else 
            AFE_spi 			<= waitSPI7;
        end if;	
    when waitSPI7 => 
        AFE_spi 			<= waitSPI8;	
    when waitSPI8 => 
    if spi_busy = '1' then
        AFE_spi 			<= waitSPI8;
    elsif resetFSM = '1' then
        AFE_spi             <= ResetState;
    else 
        AFE_spi 			<= ADCresolution;
    end if;
    when ADCresolution =>  
        if spi_busy = '1' then
            AFE_spi 			<= ADCresolution;
        elsif resetFSM = '1' then
            AFE_spi             <= ResetState;
        else 
            AFE_spi 			<= Idle;
        end if;	


    when others =>
            AFE_spi 			<= Idle;
    end case;
end process;


output_table : process(Clk_100MHz, prev_state)
begin
if rising_edge(Clk_100MHz) then
    -- Default value of the output 
        AFE_spi_Stat    <= X"0";
        spi_addr_AFE    <= 0;
    case prev_state is
        when ResetState =>  
        AFE_spi_Stat 	<= X"0";
        spi_enable      <= '0';
        spi_tx_data     <= (others => '0');

        when Idle =>
        AFE_spi_Stat 	<= X"1";
        spi_enable      <= '0';

        when Init =>
        AFE_spi_Stat 	<= X"2";
        spi_enable      <= '0';

        when SoftReset =>
        AFE_spi_Stat 	<= X"2";
        spi_enable      <= '1';
        spi_tx_data     <= X"00" & X"0003"; -- address 0 data b'11 = Resets the device and self-clears the bit to '0' and enables readout of register at SDOUT Pin

        when EnOutput =>
        AFE_spi_Stat 	<= X"3";
        spi_enable      <= '1';
        spi_tx_data     <= X"01" & X"0000"; -- address 1 data b'0 

        when testPattern =>
        AFE_spi_Stat 	<= X"4";
        spi_enable      <= '1';
        spi_tx_data     <= X"02" & X"A000"; -- address 2 data TOGGLE pattern

        when serDataRate =>
        AFE_spi_Stat 	<= X"5";
        spi_enable      <= '1';
        spi_tx_data     <= X"03" & X"6000"; -- address 3 data x14 data rate

        when ADCresolution =>
        AFE_spi_Stat 	<= X"6";
        spi_enable      <= '1';
        spi_tx_data     <= X"04" & X"0002"; -- address 4 data ADC Resolution 14 bit


        when waitSPI1 =>
        spi_enable      <= '0';
        spi_tx_data <= (others => '0');

        when waitSPI2 =>
        spi_enable      <= '0';
        spi_tx_data <= (others => '0');

        when waitSPI3 =>
        spi_enable      <= '0';
        spi_tx_data <= (others => '0');

        when waitSPI4 =>
        spi_enable      <= '0';
        spi_tx_data <= (others => '0');

        when waitSPI5 =>
        spi_enable      <= '0';
        spi_tx_data <= (others => '0');

        when waitSPI6 =>
        spi_enable      <= '0';
        spi_tx_data <= (others => '0');

        when waitSPI7 =>
        spi_enable      <= '0';
        spi_tx_data <= (others => '0');

        when waitSPI8 =>
        spi_enable      <= '0';
        spi_tx_data <= (others => '0');

        when others =>
            
        end case;
end if;
end process;

AFEControl : process(Clk_100MHz, CpldRst)
begin 
    if CpldRst = '0' then 

        AFEPDn      <= "11"; 
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

    end if;
end process;
-- END SLOW CONTROL (SPI)


generateILA0: if false generate
    AFE_ILA0: DAC_ila_0 
    port map(
    clk    		=> Clk_100MHz,
    probe0  	=> AFEPDn,       -- std_logic_vector(1 downto 0)      
    probe1  	=> AFECS,        -- std_logic_vector(1 downto 0)       
    probe2(0) 	=> AFERst,       -- std_logic    
    probe3(0) 	=> AFESClk,      -- std_logic        
    probe4(0) 	=> '0',          -- std_logic
    probe5(0) 	=> '0',          -- std_logic
    probe6   	=>  x"0000"      -- std_logic_vector (15 downto 0)
    );
    
end GENERATE; 
    
generateILA1: if true generate

    AFE_ILA1: DAC_ila_1
    port map(
    clk    		=> Clk_100MHz,
    probe0(0)  	=> spi_enable,     -- std_logic      
    probe1(0)  	=> spi_busy,       -- std_logic       
    probe2   	=> spi_tx_data,    -- std_logic_vector(23 downto 0);    
    probe3   	=> spi_rx_data,    -- std_logic_vector(23 downto 0);     
    probe4      => AFE_spi_Stat    -- std_logic_vector(3 downto 0);   
    );

end GENERATE; 

buttons: vio_0
port map(
	clk				=> Clk_100MHz,         
	probe_in0		=> B_in(0 downto 0),   
    probe_in1		=> B_in(1 downto 1),   
    probe_in2		=> B_in(2 downto 2),   
    probe_in3		=> B_in(3 downto 3),   
    probe_in4		=> B_in(4 downto 4),   
	probe_out0		=> B_out(0 downto 0), 
    probe_out1      => B_out(1 downto 1), 
    probe_out2      => B_out(2 downto 2), 
    probe_out3      => B_out(3 downto 3), 
    probe_out4      => B_out(4 downto 4)
); 





end AFE_Interface_Architecture;
