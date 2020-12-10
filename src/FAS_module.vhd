----------------------------------------------------------------------------------
-- Company: IRAP
-- Engineer: Noémie Rolland
-- 
-- Create Date:    11:31:37 10/09/2020 
-- Design Name: 
-- Module Name:    FAS_module - Behavioral 
-- Project Name:  FAS_project
-- Target Devices: 
-- Tool versions: 
-- Description: This module is the structural modeling of the other modules. 
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

entity FAS_module is
    Port ( i_clk : in  STD_LOGIC; -- clk of the module 100 MHz
           i_rst : in  STD_LOGIC; -- reset
           o_RS : out  STD_LOGIC_VECTOR (8 downto 0); -- output signal, each bit is a row
           o_CS : out  STD_LOGIC_VECTOR (3 downto 0)); -- output signal, each bit is a cluster
end FAS_module;

architecture Behavioral of FAS_module is

    COMPONENT div_freq_RS
    PORT(
         i_clk : IN  std_logic;
         i_rst : IN  std_logic;
         o_tick_RS_re : OUT  std_logic
        );
    END COMPONENT;
	 
	 COMPONENT row_select
    PORT(
         i_tick_RS_re : IN  std_logic;
         i_rst : IN  std_logic;
         o_RS : OUT  std_logic_vector(8 downto 0)
        );
    END COMPONENT;
	 
	 COMPONENT cluster_select
    PORT(
         i_RS0 : IN  std_logic;
         i_rst : IN  std_logic;
         o_CS : OUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;

signal tick_int : STD_LOGIC; -- intern signal, clk 5 MHz
signal RS_int : STD_LOGIC_VECTOR (8 downto 0); -- intern signal, each bit is a row

begin

    u0: div_freq_RS PORT MAP (
          i_clk => i_clk,
          i_rst => i_rst,
          o_tick_RS_re => tick_int -- the port o_tick_RS_re get the tick_int signal out
        );
		  
	 u1: row_select PORT MAP (
          i_tick_RS_re => tick_int, -- the port i_tick_RS_re takes the tick_int 
          i_rst => i_rst,
          o_RS => RS_int -- the port o_RS get the RS_int signal out
        );

    u2: cluster_select PORT MAP (
          i_RS0 => RS_int(0), -- the port i_RS0 takes the first bit of the RS_int signal
          i_rst => i_rst,
          o_CS => o_CS
        );		  
		  
o_RS <= RS_int; -- o_RS takes the value of RS_int

end Behavioral;

