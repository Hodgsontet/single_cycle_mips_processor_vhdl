-- Vhdl test bench created from schematic E:\csc343proj\DataPathWIthControlla\splittercheck.sch - Sun May 15 22:51:31 2022
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
ENTITY splittercheck_splittercheck_sch_tb IS
END splittercheck_splittercheck_sch_tb;
ARCHITECTURE behavioral OF splittercheck_splittercheck_sch_tb IS 

   COMPONENT splittercheck
   PORT( instruction	:	IN	STD_LOGIC_VECTOR (31 DOWNTO 0); 
          opcode	:	OUT	STD_LOGIC_VECTOR (5 DOWNTO 0); 
          RS	:	OUT	STD_LOGIC_VECTOR (4 DOWNTO 0); 
          RT	:	OUT	STD_LOGIC_VECTOR (4 DOWNTO 0); 
          imidiate	:	OUT	STD_LOGIC_VECTOR (15 DOWNTO 0));
   END COMPONENT;

   SIGNAL instruction	:	STD_LOGIC_VECTOR (31 DOWNTO 0);
   SIGNAL opcode	:	STD_LOGIC_VECTOR (5 DOWNTO 0);
   SIGNAL RS	:	STD_LOGIC_VECTOR (4 DOWNTO 0);
   SIGNAL RT	:	STD_LOGIC_VECTOR (4 DOWNTO 0);
   SIGNAL imidiate	:	STD_LOGIC_VECTOR (15 DOWNTO 0);

BEGIN

   UUT: splittercheck PORT MAP(
		instruction => instruction, 
		opcode => opcode, 
		RS => RS, 
		RT => RT, 
		imidiate => imidiate
   );

-- *** Test Bench - User Defined Section ***
   tb : PROCESS
   BEGIN
      WAIT for 10ns;
		instruction <= X"8e300000";
		
   END PROCESS;
-- *** End Test Bench - User Defined Section ***

END;
