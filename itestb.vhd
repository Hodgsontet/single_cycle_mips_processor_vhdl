--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   16:45:19 05/15/2022
-- Design Name:   
-- Module Name:   E:/csc343proj/DataPathWIthControlla/itestb.vhd
-- Project Name:  DataPathWIthControlla
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: ITYPEDatapath
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
 
ENTITY itestb IS
END itestb;
 
ARCHITECTURE behavior OF itestb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT ITYPEDatapath
    PORT(
         ENABLE : IN  std_logic;
         instruction : IN  std_logic_vector(31 downto 0);
         ramWriteBack : OUT  std_logic_vector(31 downto 0);
         ramLocationCalculated : OUT  std_logic_vector(31 downto 0);
         DatagoingInRam : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
  

   --Inputs
   signal ENABLE : std_logic := '0';
   signal instruction : std_logic_vector(31 downto 0);

 	--Outputs
   signal ramWriteBack : std_logic_vector(31 downto 0);
   signal ramLocationCalculated : std_logic_vector(31 downto 0);
   signal DatagoingInRam : std_logic_vector(31 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: ITYPEDatapath PORT MAP (
          ENABLE => ENABLE,
          instruction => instruction,
          ramWriteBack => ramWriteBack,
          ramLocationCalculated => ramLocationCalculated,
          DatagoingInRam => DatagoingInRam
        );

   -- Clock process definitions
   
 

  -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	
     ENABLE<= '0'; 
	 instruction <= X"8e300000";
		 wait for 100 ns;
		 ENABLE<= '1'; 
	 instruction <= X"8e300000";
      -- insert stimulus here 

      wait;
   end process;

END;
