-- Vhdl test bench created from schematic E:\csc343proj\DataPathWIthControlla\Ram_test.sch - Mon May 16 00:05:29 2022
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
ENTITY Ram_test_Ram_test_sch_tb IS
END Ram_test_Ram_test_sch_tb;
ARCHITECTURE behavioral OF Ram_test_Ram_test_sch_tb IS 

   COMPONENT Ram_test
   PORT( enable	:	IN	STD_LOGIC; 
          inputaddr	:	IN	STD_LOGIC_VECTOR (31 DOWNTO 0); 
          XLXN_4	:	IN	STD_LOGIC_VECTOR (31 DOWNTO 0); 
          write	:	IN	STD_LOGIC; 
          ramout	:	OUT	STD_LOGIC_VECTOR (31 DOWNTO 0));
   END COMPONENT;

   SIGNAL enable	:	STD_LOGIC;
   SIGNAL inputaddr	:	STD_LOGIC_VECTOR (31 DOWNTO 0);
   SIGNAL XLXN_4	:	STD_LOGIC_VECTOR (31 DOWNTO 0);
   SIGNAL write	:	STD_LOGIC;
   SIGNAL ramout	:	STD_LOGIC_VECTOR (31 DOWNTO 0);

BEGIN

   UUT: Ram_test PORT MAP(
		enable => enable, 
		inputaddr => inputaddr, 
		XLXN_4 => XLXN_4, 
		write => write, 
		ramout => ramout
   );

-- *** Test Bench - User Defined Section ***
   tb : PROCESS
   BEGIN
      WAIT for 10ns ; -- will wait forever
		enable <= '1';
		 		write <='0';
		inputaddr<=X"00002000";
   END PROCESS;
-- *** End Test Bench - User Defined Section ***

END;
