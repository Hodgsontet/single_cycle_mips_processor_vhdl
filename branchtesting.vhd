--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   11:48:26 05/16/2022
-- Design Name:   
-- Module Name:   E:/csc343proj/DataPathWIthControlla/branchtesting.vhd
-- Project Name:  DataPathWIthControlla
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Branch_address
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
 
ENTITY branchtesting IS
END branchtesting;
 
ARCHITECTURE behavior OF branchtesting IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Branch_address
    PORT(
         offset : IN  std_logic_vector(31 downto 0);
         inc_pcVal : IN  std_logic_vector(31 downto 0);
         BranchAddress : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal offset : std_logic_vector(31 downto 0) := (others => '0');
   signal inc_pcVal : std_logic_vector(31 downto 0) := (others => '0');

 	--Outputs
   signal BranchAddress : std_logic_vector(31 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Branch_address PORT MAP (
          offset => offset,
          inc_pcVal => inc_pcVal,
          BranchAddress => BranchAddress
        );

   -- Clock process definitions
  
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	
       offset <= X"00000002";
		 inc_pcVal <= X"00013890";
     

      -- insert stimulus here 

      wait;
   end process;

END;
