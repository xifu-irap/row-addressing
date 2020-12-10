----------------------------------------------------------------------------------
-- Company: IRAP
-- Engineer: Noémie Rolland
-- 
-- Create Date:    10:47:37 10/09/2020 
-- Design Name: 
-- Module Name:    row_select - Behavioral 
-- Project Name: FAS_project
-- Target Devices: 
-- Tool versions: 
-- Description: This module enables and disables each row one by one every 200 ns by rotation.
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

entity row_select is
    Port ( i_tick_RS_re : in  STD_LOGIC; -- clk of this entity at 5 MHz
           i_rst : in  STD_LOGIC; -- reset
           o_RS : out  STD_LOGIC_VECTOR (8 downto 0)); -- output signal, each bit is a row, o_RS(0) is the first row
end row_select;

architecture Behavioral of row_select is

signal RS_int: STD_LOGIC_VECTOR (8 downto 0); -- intern signal, each bit is a row, RS_int(0) is the first row

begin

    row_select : process (i_tick_RS_re, i_rst) -- the process is sensitive to the i_tick_RS_re and the i_rst signals
	 begin
	     if (i_rst = '1') then -- if reset is enable
	         RS_int <= "000000001"; -- only the last row is enable
	     elsif (rising_edge(i_tick_RS_re)) then -- if we detect a rising edge of i_tick_RS_re (every 200ns)
	         RS_int <= RS_int(7 downto 0) & RS_int(8); -- the value of RS_int rotate to the left to enable the next row and disable the current row
	     end if;
	 end process;
o_RS <= RS_int; --o_RS takes the value of RS_int
end Behavioral;

