----------------------------------------------------------------------------------
-- Company: IRAP - Athena X-IFU
-- Engineer: Noémie Rolland
-- 
-- Create Date:    12:01:32 09/28/2020 
-- Design Name: 
-- Module Name:    div_freq_RS - Behavioral 
-- Project Name: FAS_project
-- Target Devices: 
-- Tool versions: 
-- Description: Frequence divider, it generates a o_tick_RS every 200ns. With a counter, it 
-- divides the master clock (100 MHz) in 20o obtain a clk at 5 MHz.
--
-- Dependencies: 
--
-- Revision: V1
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity div_freq_RS is
    Port ( i_clk : in  STD_LOGIC; --master clock at 100 MHz
           i_rst : in  STD_LOGIC; --reset
           o_tick_RS_re : out  STD_LOGIC); -- output signal, clock at 5 MHz
end div_freq_RS;

architecture Behavioral of div_freq_RS is

signal cmp_int : unsigned(4 downto 0):="00000"; --intern counter

begin

div_freq_RS : process(i_clk,i_rst) -- the process is sensitive to the i_clk and the i_rst signals
	begin
	if (i_rst='1') then -- if reset is enable
		cmp_int <= "00000"; -- the counter is equal to 0
	else 
		if (rising_edge(i_clk)) then -- if we detect  rising edge of the clk
			cmp_int <= cmp_int +1; -- the counter is incremented
			if (cmp_int < "10011") then -- while we have not detected 20 rising edge (counter=19 because it starts at 0) of the master clk (20 x 10ns = 200ns)
				o_tick_RS_re <= '0'; -- o_tick_RS_re goes to 0
			else -- if we detected 20 rising edge of the clk
				o_tick_RS_re <= '1'; -- o_tick_RS_re goes to 1
				cmp_int <= "00000"; -- reset the counter to 0
			end if;
		end if;
	end if;
	end process;


end Behavioral;

