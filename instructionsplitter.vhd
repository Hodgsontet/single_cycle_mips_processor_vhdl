----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:42:14 05/15/2022 
-- Design Name: 
-- Module Name:    instructionsplitter - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity instructionsplitter is
Port ( 
           instruction : in  STD_LOGIC_VECTOR (31 downto 0);
           pseudo_addr_ins_25_0: out  STD_LOGIC_VECTOR (25 downto 0); ----pseudoaddr
           ins_31_26: out  STD_LOGIC_VECTOR (5 downto 0); ----opcode
			  ins_25_21: out  STD_LOGIC_VECTOR (4 downto 0);----rs
			  ins_20_16: out  STD_LOGIC_VECTOR (4 downto 0); -- rt
			   ins_15_11: out  STD_LOGIC_VECTOR (4 downto 0); --rd 
			  ins_15_0: out  STD_LOGIC_VECTOR (15 downto 0); ---immidiate
			    ins_5_0: out  STD_LOGIC_VECTOR (5 downto 0) ---function
			  
			 		  
			  );
end instructionsplitter;

architecture Behavioral of instructionsplitter is

begin
             pseudo_addr_ins_25_0 <=  instruction(25 downto 0);----psudoaddr
           ins_31_26 <= instruction(31 downto 26); ----opcode
			  ins_25_21 <=instruction(25 downto 21);----rs       
			  ins_20_16 <= instruction(20 downto 16); -- rt
			   ins_15_11 <= instruction(15 downto 11);--rd
			  ins_15_0 <= instruction(15 downto 0); ---immidiate
			  ins_5_0<= instruction(5 downto 0);--function code;

end Behavioral;

