----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:18:01 05/15/2022 
-- Design Name: 
-- Module Name:    ITYPEDatapath - Behavioral 
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

entity ITYPEDatapath is
Port (    ENABLE : in  STD_LOGIC;
                  
           instruction : in  STD_LOGIC_VECTOR (31 downto 0);
           ramWriteBack : out  STD_LOGIC_VECTOR (31 downto 0);
			  ramLocationCalculated: out  STD_LOGIC_VECTOR (31 downto 0);
			  DatagoingInRam: out  STD_LOGIC_VECTOR (31 downto 0)
			  		  
			  
			 );
end ITYPEDatapath;

architecture Behavioral of ITYPEDatapath is
COMPONENT REG
	 port (
         I_REG_EN       : in std_logic;
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
	
	
	COMPONENT EXTT
	     port(
     I_EXT_16 : in STD_LOGIC_VECTOR(15 downto 0);
	  O_EXT_32 : out STD_LOGIC_VECTOR(31 downto 0));
		 
	END COMPONENT;
	
	
	COMPONENT RAM
	     port(
		    I_RAM_EN : in  STD_LOGIC;
           I_RAM_RE : in  STD_LOGIC;
           I_RAM_WE : in  STD_LOGIC;
           I_RAM_ADDR : in  STD_LOGIC_VECTOR (31 downto 0);
           I_RAM_DATA : in  STD_LOGIC_VECTOR (31 downto 0);
           O_RAM_DATA : out  STD_LOGIC_VECTOR (31 downto 0)
              );
		 
	END COMPONENT;
	
		signal memreadsig:  std_logic;
		signal memtoregsig:  std_logic;
		signal memwritesig:  std_logic;
		signal regwritesig:  std_logic;
		signal aluopsig:  STD_LOGIC_VECTOR (1 downto 0);
		signal writebacksig:  STD_LOGIC_VECTOR (31 downto 0);
		signal regoutA:  std_logic_vector  (31 downto 0);
		signal regoutB:  std_logic_vector  (31 downto 0);
	  signal A:  std_logic_vector  (31 downto 0);
	  signal B :  std_logic_vector  (31 downto 0);
	signal aluctrlsig : std_logic_vector  (3 downto 0);
   signal aluresult:  std_logic_vector  (31 downto 0);
begin

  D1: DEC PORT MAP(
		    			  			  
			  I_DEC_EN => ENABLE,
           I_DEC_Opcode => instruction(31 downto 26), 
           O_DEC_MemRead => memreadsig,
           O_DEC_MemtoReg =>  memtoregsig,
           O_DEC_ALUOp => aluopsig,
           O_DEC_MemWrite => memwritesig,         
          O_DEC_RegWrite=> memwritesig
	);
	
	A1: ACU PORT MAP(
		    I_ACU_ALUOp => aluopsig, 
           I_ACU_Funct =>  instruction(5 downto 0), 			 
           O_ACU_CTL => aluctrlsig
	);
	
	
	
	rf: REG PORT MAP(
		 I_REG_EN   => ENABLE,
        I_REG_WE  => regwritesig,
        I_REG_SEL_RS => instruction(25 downto 21), 
        I_REG_SEL_RT =>  instruction(20 downto 16),
        I_REG_SEL_RD =>  instruction(20 downto 16), 
        I_REG_DATA_RD =>writebacksig,
        O_REG_DATA_A =>A, 
        O_REG_DATA_B => regoutB		  		  
	);
	ex: EXTT PORT MAP(
	   I_EXT_16 => instruction(15 downto 0),
		O_EXT_32 => B	    
	);
	
	al1 : ALU PORT MAP(
		     I_ALU_EN => ENABLE,
    I_ALU_CTL => aluctrlsig,
    I_ALU_A =>A,
    I_ALU_B =>B,
    O_ALU_Out => aluresult
    
	);
	
	am: RAM PORT MAP(
		    			  
			  I_RAM_EN => ENABLE ,
           I_RAM_RE => memreadsig,
           I_RAM_WE => memwritesig,
           I_RAM_ADDR => aluresult,
           I_RAM_DATA => regoutB,
           O_RAM_DATA => writebacksig
	);
	
	ramLocationCalculated <= aluresult;
	DatagoingInRam <= regoutB;
	ramWriteBack <= writebacksig;
	
	
end Behavioral; 

