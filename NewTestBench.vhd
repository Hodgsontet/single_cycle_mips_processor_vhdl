-- Vhdl test bench created from schematic E:\csc343proj\DataPathWIthControlla\IPath.sch - Mon May 16 14:58:37 2022
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
ENTITY IPath_IPath_sch_tb IS
END IPath_IPath_sch_tb;
ARCHITECTURE behavioral OF IPath_IPath_sch_tb IS 

   COMPONENT IPath
   PORT( pc_update	:	IN	STD_LOGIC; 
          branchOutput	:	OUT	STD_LOGIC_VECTOR (31 DOWNTO 0); 
          InstructionFetch	:	IN	STD_LOGIC; 
          Execute_ALU	:	IN	STD_LOGIC; 
          memory_access_RAM	:	IN	STD_LOGIC; 
          Decode	:	IN	STD_LOGIC; 
          initialPcVal	:	IN	STD_LOGIC_VECTOR (31 DOWNTO 0); 
          NextInstrcnADDR	:	OUT	STD_LOGIC_VECTOR (31 DOWNTO 0));
   END COMPONENT;

   SIGNAL pc_update	:	STD_LOGIC;
   SIGNAL branchOutput	:	STD_LOGIC_VECTOR (31 DOWNTO 0);
   SIGNAL InstructionFetch	:	STD_LOGIC;
   SIGNAL Execute_ALU	:	STD_LOGIC;
   SIGNAL memory_access_RAM	:	STD_LOGIC;
   SIGNAL Decode	:	STD_LOGIC;
   SIGNAL initialPcVal	:	STD_LOGIC_VECTOR (31 DOWNTO 0);
   SIGNAL NextInstrcnADDR	:	STD_LOGIC_VECTOR (31 DOWNTO 0);

BEGIN

   UUT: IPath PORT MAP(
		pc_update => pc_update, 
		branchOutput => branchOutput, 
		InstructionFetch => InstructionFetch, 
		Execute_ALU => Execute_ALU, 
		memory_access_RAM => memory_access_RAM, 
		Decode => Decode, 
		initialPcVal => initialPcVal, 
		NextInstrcnADDR => NextInstrcnADDR
   );

-- *** Test Bench - User Defined Section ***
   tb : PROCESS
   BEGIN
      
			
			
		  
          
   END PROCESS;
-- *** End Test Bench - User Defined Section ***

END;
