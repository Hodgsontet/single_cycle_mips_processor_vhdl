-- Vhdl test bench created from schematic E:\csc343proj\DataPathWIthControlla\IPath.sch - Mon May 16 15:45:19 2022
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
          ROM_Output	:	OUT	STD_LOGIC_VECTOR (31 DOWNTO 0); 
          branchOutput	:	OUT	STD_LOGIC_VECTOR (31 DOWNTO 0); 
          RegValA	:	OUT	STD_LOGIC_VECTOR (31 DOWNTO 0); 
          RegValB_RAMData	:	OUT	STD_LOGIC_VECTOR (31 DOWNTO 0); 
          signExtender	:	OUT	STD_LOGIC_VECTOR (31 DOWNTO 0); 
          RAMOut	:	OUT	STD_LOGIC_VECTOR (31 DOWNTO 0); 
          ALUOutput	:	OUT	STD_LOGIC_VECTOR (31 DOWNTO 0); 
          AluZeroFlg	:	OUT	STD_LOGIC; 
          InstructionFetch	:	IN	STD_LOGIC; 
          Execute_ALU	:	IN	STD_LOGIC; 
          memory_access_RAM	:	IN	STD_LOGIC; 
          Decode	:	IN	STD_LOGIC; 
          initialPcVal	:	IN	STD_LOGIC_VECTOR (31 DOWNTO 0); 
          NextInstrcnADDR	:	OUT	STD_LOGIC_VECTOR (31 DOWNTO 0); 
          registerRead	:	IN	STD_LOGIC);
   END COMPONENT;

   SIGNAL pc_update	:	STD_LOGIC;
   SIGNAL ROM_Output	:	STD_LOGIC_VECTOR (31 DOWNTO 0);
   SIGNAL branchOutput	:	STD_LOGIC_VECTOR (31 DOWNTO 0);
   SIGNAL RegValA	:	STD_LOGIC_VECTOR (31 DOWNTO 0);
   SIGNAL RegValB_RAMData	:	STD_LOGIC_VECTOR (31 DOWNTO 0);
   SIGNAL signExtender	:	STD_LOGIC_VECTOR (31 DOWNTO 0);
   SIGNAL RAMOut	:	STD_LOGIC_VECTOR (31 DOWNTO 0);
   SIGNAL ALUOutput	:	STD_LOGIC_VECTOR (31 DOWNTO 0);
   SIGNAL AluZeroFlg	:	STD_LOGIC;
   SIGNAL InstructionFetch	:	STD_LOGIC;
   SIGNAL Execute_ALU	:	STD_LOGIC;
   SIGNAL memory_access_RAM	:	STD_LOGIC;
   SIGNAL Decode	:	STD_LOGIC;
   SIGNAL initialPcVal	:	STD_LOGIC_VECTOR (31 DOWNTO 0);
   SIGNAL NextInstrcnADDR	:	STD_LOGIC_VECTOR (31 DOWNTO 0);
   SIGNAL registerRead	:	STD_LOGIC;

BEGIN

   UUT: IPath PORT MAP(
		pc_update => pc_update, 
		ROM_Output => ROM_Output, 
		branchOutput => branchOutput, 
		RegValA => RegValA, 
		RegValB_RAMData => RegValB_RAMData, 
		signExtender => signExtender, 
		RAMOut => RAMOut, 
		ALUOutput => ALUOutput, 
		AluZeroFlg => AluZeroFlg, 
		InstructionFetch => InstructionFetch, 
		Execute_ALU => Execute_ALU, 
		memory_access_RAM => memory_access_RAM, 
		Decode => Decode, 
		initialPcVal => initialPcVal, 
		NextInstrcnADDR => NextInstrcnADDR, 
		registerRead => registerRead
   );

-- *** Test Bench - User Defined Section ***
   tb : PROCESS
   BEGIN
     WAIT for 10 ns; -- will wait forever
		 initialPcVal <= X"00000000";
		pc_update <='1' ;
		WAIT for 10 ns;
		  InstructionFetch<='1';
		  WAIT for 10 ns;
		  Decode<='1';
		  registerRead<='1'; 
		   WAIT for 10 ns;
			Execute_ALU<='1';
			WAIT for 10 ns;
			memory_access_RAM<='1';
			WAIT for 30 ns;-- will wait forever
   END PROCESS;
-- *** End Test Bench - User Defined Section ***

END;
