-- Vhdl test bench created from schematic E:\csc343proj\DataPathWIthControlla\cpuForTesting.sch - Tue May 17 20:10:05 2022
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
ENTITY cpuForTesting_cpuForTesting_sch_tb IS
END cpuForTesting_cpuForTesting_sch_tb;
ARCHITECTURE behavioral OF cpuForTesting_cpuForTesting_sch_tb IS 

   COMPONENT cpuForTesting
   PORT( pc_update	:	IN	STD_LOGIC; 
          ROM_Output	:	OUT	STD_LOGIC_VECTOR (31 DOWNTO 0); 
          branchOutput	:	OUT	STD_LOGIC_VECTOR (31 DOWNTO 0); 
          RegValA	:	OUT	STD_LOGIC_VECTOR (31 DOWNTO 0); 
          RegValB_RAMData	:	OUT	STD_LOGIC_VECTOR (31 DOWNTO 0); 
          signExtender	:	OUT	STD_LOGIC_VECTOR (31 DOWNTO 0); 
          aluSrcMuxout	:	OUT	STD_LOGIC_VECTOR (31 DOWNTO 0); 
          alusrc	:	OUT	STD_LOGIC; 
          aluOpcode	:	OUT	STD_LOGIC_VECTOR (1 DOWNTO 0); 
          writeenableRam	:	OUT	STD_LOGIC; 
          RamRead	:	OUT	STD_LOGIC; 
          RAMOut	:	OUT	STD_LOGIC_VECTOR (31 DOWNTO 0); 
          ALUOutput	:	OUT	STD_LOGIC_VECTOR (31 DOWNTO 0); 
          AluZeroFlg	:	OUT	STD_LOGIC; 
          writeBackVal	:	OUT	STD_LOGIC_VECTOR (31 DOWNTO 0); 
          aluControlcode	:	OUT	STD_LOGIC_VECTOR (3 DOWNTO 0); 
          InstructionFetch	:	IN	STD_LOGIC; 
          Execute_ALU	:	IN	STD_LOGIC; 
          memory_access_RAM	:	IN	STD_LOGIC; 
          initialPcVal	:	IN	STD_LOGIC_VECTOR (31 DOWNTO 0); 
          NextInstrcnADDR	:	OUT	STD_LOGIC_VECTOR (31 DOWNTO 0); 
          Decode	:	IN	STD_LOGIC; 
          registerRead	:	IN	STD_LOGIC; 
          functionCode	:	OUT	STD_LOGIC_VECTOR (5 DOWNTO 0));
   END COMPONENT;

   SIGNAL pc_update	:	STD_LOGIC;
   SIGNAL ROM_Output	:	STD_LOGIC_VECTOR (31 DOWNTO 0);
   SIGNAL branchOutput	:	STD_LOGIC_VECTOR (31 DOWNTO 0);
   SIGNAL RegValA	:	STD_LOGIC_VECTOR (31 DOWNTO 0);
   SIGNAL RegValB_RAMData	:	STD_LOGIC_VECTOR (31 DOWNTO 0);
   SIGNAL signExtender	:	STD_LOGIC_VECTOR (31 DOWNTO 0);
   SIGNAL aluSrcMuxout	:	STD_LOGIC_VECTOR (31 DOWNTO 0);
   SIGNAL alusrc	:	STD_LOGIC;
   SIGNAL aluOpcode	:	STD_LOGIC_VECTOR (1 DOWNTO 0);
   SIGNAL writeenableRam	:	STD_LOGIC;
   SIGNAL RamRead	:	STD_LOGIC;
   SIGNAL RAMOut	:	STD_LOGIC_VECTOR (31 DOWNTO 0);
   SIGNAL ALUOutput	:	STD_LOGIC_VECTOR (31 DOWNTO 0);
   SIGNAL AluZeroFlg	:	STD_LOGIC;
   SIGNAL writeBackVal	:	STD_LOGIC_VECTOR (31 DOWNTO 0);
   SIGNAL aluControlcode	:	STD_LOGIC_VECTOR (3 DOWNTO 0);
   SIGNAL InstructionFetch	:	STD_LOGIC;
   SIGNAL Execute_ALU	:	STD_LOGIC;
   SIGNAL memory_access_RAM	:	STD_LOGIC;
   SIGNAL initialPcVal	:	STD_LOGIC_VECTOR (31 DOWNTO 0);
   SIGNAL NextInstrcnADDR	:	STD_LOGIC_VECTOR (31 DOWNTO 0);
   SIGNAL Decode	:	STD_LOGIC;
   SIGNAL registerRead	:	STD_LOGIC;
   SIGNAL functionCode	:	STD_LOGIC_VECTOR (5 DOWNTO 0);

BEGIN

   UUT: cpuForTesting PORT MAP(
		pc_update => pc_update, 
		ROM_Output => ROM_Output, 
		branchOutput => branchOutput, 
		RegValA => RegValA, 
		RegValB_RAMData => RegValB_RAMData, 
		signExtender => signExtender, 
		aluSrcMuxout => aluSrcMuxout, 
		alusrc => alusrc, 
		aluOpcode => aluOpcode, 
		writeenableRam => writeenableRam, 
		RamRead => RamRead, 
		RAMOut => RAMOut, 
		ALUOutput => ALUOutput, 
		AluZeroFlg => AluZeroFlg, 
		writeBackVal => writeBackVal, 
		aluControlcode => aluControlcode, 
		InstructionFetch => InstructionFetch, 
		Execute_ALU => Execute_ALU, 
		memory_access_RAM => memory_access_RAM, 
		initialPcVal => initialPcVal, 
		NextInstrcnADDR => NextInstrcnADDR, 
		Decode => Decode, 
		registerRead => registerRead, 
		functionCode => functionCode
   );

-- *** Test Bench - User Defined Section ***
    
-- *** End Test Bench - User Defined Section ***

END;
