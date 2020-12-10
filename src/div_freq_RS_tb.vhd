--------------------------------------------------------------------------------
-- Company: IRAP - Athena X-IFU
-- Engineer: Noémie Rolland
--
-- Create Date:   12:11:24 09/28/2020
-- Design Name:   
-- Module Name:   C:/Users/ATHENA_X-IFU/Documents/Noemie2020/row_adressing/row_adressing/div_freq_RS_tb.vhd
-- Project Name:  row_adressing
-- Target Device:  
-- Tool versions:  
-- Description: Frequence divider, it generates a o_tick_RS_re every 200ns. With a counter, it 
-- divides the master clock (100 MHz) in 20o obtain a clk at 5 MHz.
-- 
-- VHDL Test Bench Created by ISE for module: div_freq_RS
-- 
-- Dependencies:
-- 
-- Revision:V1
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
 
ENTITY div_freq_RS_tb IS
END div_freq_RS_tb;
 
ARCHITECTURE behavior OF div_freq_RS_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT div_freq_RS
    PORT(
         i_clk : IN  std_logic;
         i_rst : IN  std_logic;
         o_tick_RS_re : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal i_clk : std_logic := '0';
   signal i_rst : std_logic := '0';

 	--Outputs
   signal o_tick_RS_re : std_logic;

   -- Clock period definitions
   constant i_clk_period : time := 10 ns; --period of the clk
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: div_freq_RS PORT MAP (
          i_clk => i_clk,
          i_rst => i_rst,
          o_tick_RS_re => o_tick_RS_re
        );

   -- Clock process definitions
   i_clk_process :process
   begin
		i_clk <= '0';
		wait for i_clk_period/2;
		i_clk <= '1';
		wait for i_clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.      
		wait for 100 ns;	
		i_rst <= '1';

      wait for i_clk_period*10;
		i_rst <= '0';      
		-- insert stimulus here 

      wait;
   end process;

END;
