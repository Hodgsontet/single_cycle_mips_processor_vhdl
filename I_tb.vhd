-- Vhdl test bench created from schematic E:\csc343proj\DataPathWIthControlla\IPath.sch - Sun May 15 22:17:52 2022
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
          instruction_30	:	IN	STD_LOGIC_VECTOR (31 DOWNTO 0); 
          execute	:	IN	STD_LOGIC; 
          writeback	:	IN	STD_LOGIC; 
          fetchEnable	:	IN	STD_LOGIC; 
          decodeEnable	:	IN	STD_LOGIC);
   END COMPONENT;

   SIGNAL aluoutput	:	STD_LOGIC_VECTOR (31 DOWNTO 0);
   SIGNAL ramdataout	:	STD_LOGIC_VECTOR (31 DOWNTO 0);
   SIGNAL instruction_30	:	STD_LOGIC_VECTOR (31 DOWNTO 0);
   SIGNAL execute	:	STD_LOGIC;
   SIGNAL writeback	:	STD_LOGIC;
   SIGNAL fetchEnable	:	STD_LOGIC;
   SIGNAL decodeEnable	:	STD_LOGIC;

BEGIN

   UUT: IPath PORT MAP(
		aluoutput => aluoutput, 
		ramdataout => ramdataout, 
		instruction_30 => instruction_30, 
		execute => execute, 
		writeback => writeback, 
		fetchEnable => fetchEnable, 
		decodeEnable => decodeEnable
   );

-- *** Test Bench - User Defined Section ***
   tb : PROCESS
   BEGIN
	wait for 100 ns;
	 instruction_30 <= X"8e300000";
	 wait for 100 ns;
	  fetchEnable <= '1';
	 
	  execute <='1';
	  
	  decodeEnable <= '1';
	  
		writeback <= '1';
	  
     
   END PROCESS;
	
-- *** End Test Bench - User Defined Section ***

END;
