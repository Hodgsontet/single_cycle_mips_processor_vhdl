-- Vhdl test bench created from schematic E:\csc343proj\DataPathWIthControlla\IPath.sch - Sun May 15 22:15:11 2022
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
   PORT( aluoutput	:	OUT	STD_LOGIC_VECTOR (31 DOWNTO 0); 
          ramdataout	:	OUT	STD_LOGIC_VECTOR (31 DOWNTO 0); 
          XLXN_7	:	IN	STD_LOGIC; 
          instruction_30	:	IN	STD_LOGIC_VECTOR (31 DOWNTO 0));
   END COMPONENT;

   SIGNAL aluoutput	:	STD_LOGIC_VECTOR (31 DOWNTO 0);
   SIGNAL ramdataout	:	STD_LOGIC_VECTOR (31 DOWNTO 0);
   SIGNAL XLXN_7	:	STD_LOGIC;
   SIGNAL instruction_30	:	STD_LOGIC_VECTOR (31 DOWNTO 0);

BEGIN

   UUT: IPath PORT MAP(
		aluoutput => aluoutput, 
		ramdataout => ramdataout, 
		XLXN_7 => XLXN_7, 
		instruction_30 => instruction_30
   );

-- *** Test Bench - User Defined Section ***
   tb : PROCESS
   BEGIN
      WAIT; -- will wait forever
   END PROCESS;
-- *** End Test Bench - User Defined Section ***

END;
