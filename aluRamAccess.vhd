----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:30:01 05/15/2022 
-- Design Name: 
-- Module Name:    aluRamAccess - Behavioral 
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

entity aluRamAccess is
port (
        EN        : in std_logic;
		  WEN        : in std_logic;
         aluc :  IN std_logic_vector(3 downto 0);
        A  : in std_logic_vector   (31 downto 0);  
        B   : in std_logic_vector  (31 downto 0); 
         memDataIn : IN std_logic_vector(31 downto 0); 		  
        res   : out std_logic_vector  (31 downto 0);
		   memres   : out std_logic_vector  (31 downto 0)
    );
end aluRamAccess;

architecture Behavioral of aluRamAccess is

 COMPONENT ALU
	PORT(
		I_ALU_EN : IN std_logic;
		I_ALU_CTL : IN std_logic_vector(3 downto 0);
		I_ALU_A : IN std_logic_vector(31 downto 0);
		I_ALU_B : IN std_logic_vector(31 downto 0);          
		O_ALU_Out : OUT std_logic_vector(31 downto 0);
		O_ALU_Zero : OUT std_logic
		);
	END COMPONENT;
	
	COMPONENT RAM
	PORT(
		I_RAM_EN : IN std_logic;
		I_RAM_RE : IN std_logic;
		I_RAM_WE : IN std_logic;
		I_RAM_ADDR : IN std_logic_vector(31 downto 0);
		I_RAM_DATA : IN std_logic_vector(31 downto 0);          
		O_RAM_DATA : OUT std_logic_vector(31 downto 0)
		);
		end component;
		
		signal result : std_logic_vector  (31 downto 0);
		signal memresult : std_logic_vector  (31 downto 0);
begin

Inst_ALU: ALU PORT MAP(
		I_ALU_EN => EN,
		I_ALU_CTL =>aluc ,
		I_ALU_A => A,
		I_ALU_B =>B ,
		
		O_ALU_Out => result
	);
	
	Inst_RAM: RAM PORT MAP(
		I_RAM_EN =>EN ,
		I_RAM_RE => EN,
		I_RAM_WE => WEN,
		I_RAM_ADDR => result,
		I_RAM_DATA =>memDataIn ,
		O_RAM_DATA => memresult
	);

 res<= result;
 memres <= memresult;
end Behavioral;

