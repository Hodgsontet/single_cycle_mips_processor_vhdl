--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   18:46:37 05/15/2022
-- Design Name:   
-- Module Name:   E:/csc343proj/DataPathWIthControlla/ramtest.vhd
-- Project Name:  DataPathWIthControlla
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: aluRamAccess
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
 
ENTITY ramtest IS
END ramtest;
 
ARCHITECTURE behavior OF ramtest IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT aluRamAccess
    PORT(
         EN : IN  std_logic;
         WEN : IN  std_logic;
         aluc : IN  std_logic_vector(3 downto 0);
         A : IN  std_logic_vector(31 downto 0);
         B : IN  std_logic_vector(31 downto 0);
         memDataIn : IN  std_logic_vector(31 downto 0);
         res : OUT  std_logic_vector(31 downto 0);
         memres : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal EN : std_logic := '0';
   signal WEN : std_logic := '0';
   signal aluc : std_logic_vector(3 downto 0) := (others => '0');
   signal A : std_logic_vector(31 downto 0) := (others => '0');
   signal B : std_logic_vector(31 downto 0) := (others => '0');
   signal memDataIn : std_logic_vector(31 downto 0) := (others => '0');

 	--Outputs
   signal res : std_logic_vector(31 downto 0);
   signal memres : std_logic_vector(31 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: aluRamAccess PORT MAP (
          EN => EN,
          WEN => WEN,
          aluc => aluc,
          A => A,
          B => B,
          memDataIn => memDataIn,
          res => res,
          memres => memres
        );

   
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	
     EN<= '1';
	  WEN <= '0';
	  aluc <= "0001";
	  A<= X"00000000";
	  B<= X"00002004";
     

      -- insert stimulus here 

      wait;
   end process;

END;
