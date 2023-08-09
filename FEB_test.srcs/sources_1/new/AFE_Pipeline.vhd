LIBRARY ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use IEEE.numeric_std.all;
Library UNISIM;
use UNISIM.vcomponents.all;

use work.Proj_Def.all;

entity AFE_Pipeline is
  Port (
	Clk_80MHz			: in std_logic; 
-- Data output from the deserializer for AFE0 and AFE1 synchronized to 80 MHz clock
    din_AFE0			: in Array_8x14; 
    din_AFE1			: in Array_8x14;
	dout_AFE0			: out Array_8x14; 
    dout_AFE1			: out Array_8x14;
    done				: in std_logic_vector(1 downto 0); -- status of automatic alignment FSM
-- Pipeline signals
	PipelineSet 		: in std_logic_vector (7 downto 0);	
-- Microcontroller strobes
	CpldRst				: in std_logic
	);
end AFE_Pipeline;

architecture Behavioral of AFE_Pipeline is

signal din_AFE			: Array_2x8x14;   -- 2 AFE x 8 channels x 14 bits
signal dout_AFE			: Array_2x8x14;   -- 2 AFE x 8 channels x 14 bits
-- Pipeline : AFE_DP_Pipeline Signals
signal PipelineWrtAdd 	: Array_2x8;
signal PipelineRdAdd 	: Array_2x8;
signal PipelineWrtEn	: std_logic_vector(1 downto 0);

begin

din_AFE(0)	 <= din_AFE0;
din_AFE(1)   <= din_AFE1;
dout_AFE0	 <= dout_AFE(0);
dout_AFE1    <= dout_AFE(1);


Gen_Two_AFEs : for i in 0 to 1 generate

Pipeline : AFE_DP_Pipeline
  PORT MAP (
    clka  => Clk_80MHz,
    wea   => PipelineWrtEn(i downto i),
    addra => PipelineWrtAdd(i),

    dina(111 downto 98) => din_AFE(i)(7), 
	dina(97 downto 84)  => din_AFE(i)(6),
    dina(83 downto 70)  => din_AFE(i)(5), 
	dina(69 downto 56)  => din_AFE(i)(4),
    dina(55 downto 42)  => din_AFE(i)(3), 
	dina(41 downto 28)  => din_AFE(i)(2),
    dina(27 downto 14)  => din_AFE(i)(1), 
	dina(13 downto 0)   => din_AFE(i)(0),
		
    clkb => Clk_80MHz,    
	addrb => PipelineRdAdd(i),
    doutb(111 downto 98) => dout_AFE(i)(7), 
	doutb(97 downto 84)  => dout_AFE(i)(6),
    doutb(83 downto 70)  => dout_AFE(i)(5), 
	doutb(69 downto 56)  => dout_AFE(i)(4),
    doutb(55 downto 42)  => dout_AFE(i)(3), 
	doutb(41 downto 28)  => dout_AFE(i)(2),
    doutb(27 downto 14)  => dout_AFE(i)(1), 
	doutb(13 downto 0)   => dout_AFE(i)(0)
   );
   
Gen_Eight_Chans : for k in 0 to 7 generate
Eight_Chans : process (Clk_80MHz, CpldRst)
begin
if CpldRst = '0' then 
	
	PipelineWrtEn(i) <= '0';
	PipelineWrtAdd(i) <= X"08";
	PipelineRdAdd(i) <= (others => '0');	
	
elsif rising_edge (Clk_80MHz) then

if done(i) = '1'
then PipelineWrtEn(i) <= '1';
else PipelineWrtEn(i) <= '0';
end if;

-- Read and write addresses for the pipeline delay
if PipelineWrtEn(i) = '1' and PipelineRdAdd(i) = X"FF" then 
	PipelineRdAdd(i) <= (others => '0');
	PipelineWrtAdd(i) <= PipelineSet;
  elsif PipelineWrtEn(i) = '1' and PipelineRdAdd(i) /= X"FF" then 
		  PipelineWrtAdd(i) <= PipelineWrtAdd(i) + 1;
		  PipelineRdAdd(i)  <= PipelineRdAdd(i) + 1;
	else PipelineWrtAdd(i) <= PipelineWrtAdd(i);
		  PipelineRdAdd(i) <= PipelineRdAdd(i);
 end if;


end if;
end process;
end generate;  
end generate;

end Behavioral;