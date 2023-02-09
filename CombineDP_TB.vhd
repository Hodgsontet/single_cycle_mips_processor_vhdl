--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   20:46:21 05/13/2022
-- Design Name:   
-- Module Name:   E:/csc343proj/DataPathWIthControlla/CombineDP_TB.vhd
-- Project Name:  DataPathWIthControlla
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: CombineDP
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
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY CombineDP_TB IS
END CombineDP_TB;
 
ARCHITECTURE behavior OF CombineDP_TB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT CombineDP
    PORT(
         ENABLE : IN  std_logic;
         Instruction : IN  std_logic_vector(31 downto 0);
         r1 : OUT  std_logic_vector(31 downto 0);
         r2 : OUT  std_logic_vector(31 downto 0);
         r3_wr : OUT  std_logic_vector(31 downto 0);
         nul : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal ENABLE : std_logic := '0';
   signal Instruction : std_logic_vector(31 downto 0) := (others => '0');

 	--Outputs
   signal r1 : std_logic_vector(31 downto 0);
   signal r2 : std_logic_vector(31 downto 0);
   signal r3_wr : std_logic_vector(31 downto 0);
   signal nul : std_logic;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: CombineDP PORT MAP (
          ENABLE => ENABLE,
          Instruction => Instruction,
          r1 => r1,
          r2 => r2,
          r3_wr => r3_wr,
          nul => nul
        );

   -- Clock process definitions
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	
     Enable<= '0'; 
	 Instruction <= X"00221820";
		 wait for 100 ns;
		 Enable<= '1'; 
	 Instruction <= X"00221820";
      -- insert stimulus here 

      wait;
   end process;

END;
