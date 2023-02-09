-- Vhdl test bench created from schematic E:\csc343proj\DataPathWIthControlla\branch_jump_check.sch - Mon May 16 11:46:39 2022
--
-- Notes: 
-- 1) This testbench template has been automatically generated using types
-- std_logic and std_logic_vector for the ports of the unit under test.
-- Xilinx recommends that these types always be used for the top-level
-- I/O of a design in order to guarantee that the testbench will bind
-- correctly to the timing (post-route) simulation model.
-- 2) To use this template as your testbench, change the filename to any
-- name of your choice with the extension .vhd, and use the "Source->Add"
-- menu in Project Navigator to import the testbench. Then
-- edit the user defined section below, adding code to generate the 
-- stimulus for your design.
--
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
LIBRARY UNISIM;
USE UNISIM.Vcomponents.ALL;
ENTITY branch_jump_check_branch_jump_check_sch_tb IS
END branch_jump_check_branch_jump_check_sch_tb;
ARCHITECTURE behavioral OF branch_jump_check_branch_jump_check_sch_tb IS 

   COMPONENT branch_jump_check
   PORT( pc_update	:	IN	STD_LOGIC; 
          PC_IN	:	IN	STD_LOGIC_VECTOR (31 DOWNTO 0); 
          branch_offset	:	IN	STD_LOGIC_VECTOR (31 DOWNTO 0); 
          branchOutput	:	OUT	STD_LOGIC_VECTOR (31 DOWNTO 0); 
          Pseudoaddress	:	IN	STD_LOGIC_VECTOR (25 DOWNTO 0); 
          jump_or_not	:	IN	STD_LOGIC; 
          finalAddress	:	OUT	STD_LOGIC_VECTOR (31 DOWNTO 0); 
          Branch_or_not	:	IN	STD_LOGIC);
   END COMPONENT;

   SIGNAL pc_update	:	STD_LOGIC;
   SIGNAL PC_IN	:	STD_LOGIC_VECTOR (31 DOWNTO 0);
   SIGNAL branch_offset	:	STD_LOGIC_VECTOR (31 DOWNTO 0);
   SIGNAL branchOutput	:	STD_LOGIC_VECTOR (31 DOWNTO 0);
   SIGNAL Pseudoaddress	:	STD_LOGIC_VECTOR (25 DOWNTO 0);
   SIGNAL jump_or_not	:	STD_LOGIC;
   SIGNAL finalAddress	:	STD_LOGIC_VECTOR (31 DOWNTO 0);
   SIGNAL Branch_or_not	:	STD_LOGIC;

BEGIN

   UUT: branch_jump_check PORT MAP(
		pc_update => pc_update, 
		PC_IN => PC_IN, 
		branch_offset => branch_offset, 
		branchOutput => branchOutput, 
		Pseudoaddress => Pseudoaddress, 
		jump_or_not => jump_or_not, 
		finalAddress => finalAddress, 
		Branch_or_not => Branch_or_not
   );

-- *** Test Bench - User Defined Section ***
   tb : PROCESS
   BEGIN
      pc_update <= '1';
	  PC_IN <= X"00013894";
	  WAIT for 10ns ;
	   Pseudoaddress  <= "00000000000100111000100000";
		WAIT for 30ns ;
		
		branch_offset<=  X"00000002";
		
      jump_or_not <= '1';	
		Branch_or_not<= '0';
   END PROCESS;
-- *** End Test Bench - User Defined Section ***

END;
