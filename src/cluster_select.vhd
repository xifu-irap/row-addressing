----------------------------------------------------------------------------------
-- Company: IRAP
-- Engineer: Noémie Rolland
-- 
-- Create Date:    11:14:54 10/09/2020 
-- Design Name: 
-- Module Name:    cluster_select - Behavioral 
-- Project Name: FAS_project
-- Target Devices: 
-- Tool versions: 
-- Description: This module enables and disables each cluster one by one every 1,8 us by rotation.
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
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity cluster_select is
    Port ( i_RS0 : in  STD_LOGIC; -- clk of this entity (556kHz)
           i_rst : in  STD_LOGIC; -- reset
           o_CS : out  STD_LOGIC_VECTOR (3 downto 0)); -- output signal, each bit is a cluster, o_CS(0) is the first cluster
end cluster_select;

architecture Behavioral of cluster_select is

signal CS_int : STD_LOGIC_VECTOR (3 downto 0); -- intern signal, each bit is a cluster, o_CS(0) is the first cluster

begin

    cluster_select : process (i_RS0,i_rst) -- the process is sensitive to i_RS0 and i_rst signals
	 begin
	     if (i_rst = '1') then -- if the reset is enable 
		      CS_int <= "0001"; -- only the first cluster is enable
		  elsif (rising_edge(i_RS0)) then -- if we detect a rising edge on the i_RS0 signal
		      CS_int <= CS_int(2 downto 0) & CS_int(3); -- the value of CS_int rotate to the left to enable the next cluster and disable the current cluster
		  end if;
	 end process;
o_CS <= CS_int; -- o_CS takes the value of CS_int
end Behavioral;

