--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   11:40:49 10/09/2020
-- Design Name:   
-- Module Name:   C:/Users/ATHENA_X-IFU/Documents/Noemie2020/FAS_project/src/FAS_module_tb.vhd
-- Project Name:  FAS_project
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: FAS_module
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
 
ENTITY FAS_module_tb IS
END FAS_module_tb;
 
ARCHITECTURE behavior OF FAS_module_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT FAS_module
    PORT(
         i_clk : IN  std_logic;
         i_rst : IN  std_logic;
         o_RS : OUT  std_logic_vector(8 downto 0);
         o_CS : OUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
    

    --Inputs
    signal i_clk : std_logic := '0';
    signal i_rst : std_logic := '0';

 	 --Outputs
    signal o_RS : std_logic_vector(8 downto 0);
    signal o_CS : std_logic_vector(3 downto 0);

    -- Clock period definitions
    constant i_clk_period : time := 10 ns;
 
BEGIN
 
	 -- Instantiate the Unit Under Test (UUT)
    uut: FAS_module PORT MAP (
          i_clk => i_clk,
          i_rst => i_rst,
          o_RS => o_RS,
          o_CS => o_CS
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
