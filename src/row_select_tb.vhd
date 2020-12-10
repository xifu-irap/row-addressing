--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   11:34:27 12/04/2020
-- Design Name:   
-- Module Name:   C:/Users/ATHENA_X-IFU/Documents/Noemie2020/solution_registre_simple/row-addressing/src/row_select_tb.vhd
-- Project Name:  project_row_addressing
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: row_select
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY row_select_tb IS
END row_select_tb;
 
ARCHITECTURE behavior OF row_select_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT row_select
    PORT(
         i_tick_RS_re : IN  std_logic;
         i_rst : IN  std_logic;
         o_RS : OUT  std_logic_vector(8 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal i_tick_RS_re : std_logic := '0';
   signal i_rst : std_logic := '0';

 	--Outputs
   signal o_RS : std_logic_vector(8 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   constant i_tick_RS_re_period : time := 200 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: row_select PORT MAP (
          i_tick_RS_re => i_tick_RS_re,
          i_rst => i_rst,
          o_RS => o_RS
        );

   -- Clock process definitions
   i_tick_RS_re_process :process
   begin
		i_tick_RS_re <= '0';
		wait for i_tick_RS_re_period/2;
		i_tick_RS_re <= '1';
		wait for i_tick_RS_re_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	
		i_rst <= '1';
      wait for i_tick_RS_re_period/2;
		i_rst <= '0';
      -- insert stimulus here 

      wait;
   end process;

END;
