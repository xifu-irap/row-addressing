--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   11:19:48 10/09/2020
-- Design Name:   
-- Module Name:   C:/Users/ATHENA_X-IFU/Documents/Noemie2020/FAS_project/src/cluster_select_tb.vhd
-- Project Name:  FAS_project
-- Target Device:  
-- Tool versions:  
-- Description:This module enables and disables each cluster one by one every 1,8 us by rotation.
-- 
-- VHDL Test Bench Created by ISE for module: cluster_select
-- 
-- Dependencies:
-- 
-- Revision: V1
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
 
ENTITY cluster_select_tb IS
END cluster_select_tb;
 
ARCHITECTURE behavior OF cluster_select_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT cluster_select
    PORT(
         i_RS0 : IN  std_logic;
         i_rst : IN  std_logic;
         o_CS : OUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
    

    --Inputs
    signal i_RS0 : std_logic := '0';
    signal i_rst : std_logic := '0';

 	 --Outputs
    signal o_CS : std_logic_vector(3 downto 0);
    -- No clocks detected in port list. Replace <clock> below with 
    -- appropriate port name 
 
    constant i_RS0_period : time := 1800 ns; -- period of the clk
 
BEGIN
 
	 -- Instantiate the Unit Under Test (UUT)
    uut: cluster_select PORT MAP (
          i_RS0 => i_RS0,
          i_rst => i_rst,
          o_CS => o_CS
        );

    -- Clock process definitions
    i_RS0_process :process
    begin
		  i_RS0 <= '1'; -- the clk is equal to 1 during 200 ns
		  wait for i_RS0_period/9;
		  i_RS0 <= '0'; -- the clk is equal to 0 during 1600 ns
		  wait for 8*(i_RS0_period/9);
    end process;
 

    -- Stimulus process
    stim_proc: process
    begin		
        -- hold reset state for 100 ns.
        wait for 100 ns;	
        i_rst <= '1';
        wait for i_RS0_period/9;
        i_rst <= '0';
        -- insert stimulus here 

        wait;
    end process;

END;
