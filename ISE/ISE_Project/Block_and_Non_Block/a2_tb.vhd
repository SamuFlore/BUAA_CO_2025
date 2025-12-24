--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   09:07:09 09/10/2025
-- Design Name:   
-- Module Name:   E:/CO/ISE/ISE_Project/Block_and_Non_Block/a2_tb.vhd
-- Project Name:  Block_and_Non_Block
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: a2
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
 
ENTITY a2_tb IS
END a2_tb;
 
ARCHITECTURE behavior OF a2_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT a2
    PORT(
         clk : IN  std_logic;
         reset : IN  std_logic;
         a : IN  std_logic_vector(3 downto 0);
         b : IN  std_logic_vector(3 downto 0);
         ans1 : OUT  std_logic_vector(3 downto 0);
         ans2 : OUT  std_logic_vector(3 downto 0);
         ans3 : OUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal reset : std_logic := '0';
   signal a : std_logic_vector(3 downto 0) := (others => '0');
   signal b : std_logic_vector(3 downto 0) := (others => '0');

 	--Outputs
   signal ans1 : std_logic_vector(3 downto 0);
   signal ans2 : std_logic_vector(3 downto 0);
   signal ans3 : std_logic_vector(3 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: a2 PORT MAP (
          clk => clk,
          reset => reset,
          a => a,
          b => b,
          ans1 => ans1,
          ans2 => ans2,
          ans3 => ans3
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      wait for clk_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
