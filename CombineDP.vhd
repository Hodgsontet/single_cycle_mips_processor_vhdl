----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:46:29 05/13/2022 
-- Design Name: 
-- Module Name:    CombineDP - Behavioral 
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
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity CombineDP is
 Port (    ENABLE : in  STD_LOGIC;  
           Instruction : in  STD_LOGIC_VECTOR (31 downto 0);
           r1: out  STD_LOGIC_VECTOR (31 downto 0);
			  r2: out  STD_LOGIC_VECTOR (31 downto 0);
			  r3_wr: out  STD_LOGIC_VECTOR (31 downto 0);
           nul: out  STD_LOGIC			  
			  
			 );
end CombineDP;

architecture Behavioral of CombineDP is
COMPONENT REG
	 port (
         I_REG_EN        : in std_logic;
        I_REG_WE        : in std_logic;
        I_REG_SEL_RS    : in std_logic_vector   (4 downto 0);  
        I_REG_SEL_RT    : in std_logic_vector   (4 downto 0);  
        I_REG_SEL_RD    : in std_logic_vector   (4 downto 0);  
        I_REG_DATA_RD   : in std_logic_vector   (31 downto 0);  
        O_REG_DATA_A    : out std_logic_vector  (31 downto 0);  
        O_REG_DATA_B    : out std_logic_vector  (31 downto 0)
    );
	END COMPONENT;
	
	
	COMPONENT DEC
	Port ( I_DEC_EN : in  STD_LOGIC;
           I_DEC_Opcode : in  STD_LOGIC_VECTOR (5 downto 0);
           O_DEC_RegDst : out  STD_LOGIC;
           O_DEC_Jump : out  STD_LOGIC;
           O_DEC_Beq : out  STD_LOGIC;
           O_DEC_Bne : out  STD_LOGIC;
           O_DEC_MemRead : out  STD_LOGIC;
           O_DEC_MemtoReg : out  STD_LOGIC;
           O_DEC_ALUOp : out  STD_LOGIC_VECTOR (1 downto 0);
           O_DEC_MemWrite : out  STD_LOGIC;
           O_DEC_ALUSrc : out  STD_LOGIC;
           O_DEC_RegWrite : out  STD_LOGIC);
	
	END COMPONENT;
	
	COMPONENT ACU
	 Port ( I_ACU_ALUOp : in  STD_LOGIC_VECTOR (1 downto 0);
           I_ACU_Funct : in  STD_LOGIC_VECTOR (5 downto 0);
           O_ACU_CTL : out  STD_LOGIC_VECTOR (3 downto 0));
	
	END COMPONENT;
	
	COMPONENT ALU
	Port(
    I_ALU_EN : in STD_LOGIC;
    I_ALU_CTL : in STD_LOGIC_VECTOR (3 downto 0);
    I_ALU_A : in STD_LOGIC_VECTOR (31 downto 0);
    I_ALU_B : in STD_LOGIC_VECTOR (31 downto 0);
    O_ALU_Out : out STD_LOGIC_VECTOR (31 downto 0);
    O_ALU_Zero : out STD_LOGIC );
	
	END COMPONENT;
	
     signal regoutA:  std_logic_vector  (31 downto 0);
	  signal regoutB:  std_logic_vector  (31 downto 0);
	  signal aluopsig:  std_logic_vector  (1 downto 0); ---feeds from DEC aluop to alucntrol
	   signal regwrite_sig:  std_logic;
		signal nulsig:  std_logic;
		signal aluresult:  std_logic_vector  (31 downto 0);
		signal aluctrlsig:  std_logic_vector  (3 downto 0);
begin

rfile: REG PORT MAP(
		 I_REG_EN   => ENABLE,
        I_REG_WE  => regwrite_sig,
        I_REG_SEL_RS => instruction(25 downto 21),
        I_REG_SEL_RT => instruction(20 downto 16), 
        I_REG_SEL_RD =>  instruction(15 downto 11),
        I_REG_DATA_RD => aluresult,
        O_REG_DATA_A =>regoutA , 
        O_REG_DATA_B => regoutB
	);
	
	cu: DEC PORT MAP(
		    I_DEC_EN => ENABLE,
           I_DEC_Opcode => instruction(31 downto 26),  
           O_DEC_ALUOp => aluopsig,
           O_DEC_RegWrite =>regwrite_sig
	);
	
	 u1: ACU PORT MAP(
		    I_ACU_ALUOp => aluopsig,
           I_ACU_Funct =>  instruction(5 downto 0),
           O_ACU_CTL => aluctrlsig
	);
	
	u2: ALU PORT MAP(
		     I_ALU_EN => ENABLE,
    I_ALU_CTL => aluctrlsig,
    I_ALU_A =>regoutA,
    I_ALU_B =>regoutB,
    O_ALU_Out => aluresult,
    O_ALU_Zero => nulsig
	);
	        r1  <=regoutA;
			  r2 <=regoutB;
			  r3_wr <= aluresult;
           nul <= nulsig;
	

end Behavioral;

