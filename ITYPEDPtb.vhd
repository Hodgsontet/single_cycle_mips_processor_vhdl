--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   15:41:08 05/15/2022
-- Design Name:   
-- Module Name:   E:/csc343proj/DataPathWIthControlla/ITYPEDPtb.vhd
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
 
ENTITY ITYPEDPtb IS
END ITYPEDPtb;
 
ARCHITECTURE behavior OF ITYPEDPtb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT ITYPEDatapath
    PORT(
         regENABLE : IN  std_logic;
         regWriteEnable : IN  std_logic;
         ramENABLE : IN  std_logic;
         aluENABLE : IN  std_logic;
         decENABLE : IN  std_logic;
         instruction : IN  std_logic_vector(31 downto 0);
         ramWriteBack : OUT  std_logic_vector(31 downto 0);
         ramLocationCalculated : OUT  std_logic_vector(31 downto 0);
         DatagoingInRam : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal regENABLE : std_logic := '0';
   signal regWriteEnable : std_logic := '0';
   signal ramENABLE : std_logic := '0';
   signal aluENABLE : std_logic := '0';
   signal decENABLE : std_logic := '0';
   signal instruction : std_logic_vector(31 downto 0) := (others => '0');

 	--Outputs
   signal ramWriteBack : std_logic_vector(31 downto 0);
   signal ramLocationCalculated : std_logic_vector(31 downto 0);
   signal DatagoingInRam : std_logic_vector(31 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
  
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: ITYPEDatapath PORT MAP (
          regENABLE => regENABLE,
          regWriteEnable => regWriteEnable,
          ramENABLE => ramENABLE,
          aluENABLE => aluENABLE,
          decENABLE => decENABLE,
          instruction => instruction,
          ramWriteBack => ramWriteBack,
          ramLocationCalculated => ramLocationCalculated,
          DatagoingInRam => DatagoingInRam
        );

  
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

         regENABLE <= '1';
         ramENABLE<= '1';
         aluENABLE <= '1';
         decENABLE <= '1';
         instruction <= X"8e300000";

      -- insert stimulus here 

      wait;
   end process;

END;
