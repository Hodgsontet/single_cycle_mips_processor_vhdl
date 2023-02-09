----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:05:47 05/13/2022 
-- Design Name: 
-- Module Name:    ALU - Behavioral 
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

entity ALU is
Port(
I_ALU_EN : in STD_LOGIC;
I_ALU_CTL : in STD_LOGIC_VECTOR (3 downto 0);
I_ALU_A : in STD_LOGIC_VECTOR (31 downto 0);
I_ALU_B : in STD_LOGIC_VECTOR (31 downto 0);
O_ALU_Out : out STD_LOGIC_VECTOR (31 downto 0);
O_ALU_Zero : out STD_LOGIC );

end ALU;

architecture Behavioral of ALU is
  signal Z :std_logic;
  signal R:  std_logic_vector(31 downto 0);
  
  
begin
   
  operation : process(I_ALU_CTL, I_ALU_A, I_ALU_B ,I_ALU_EN) -- may need to change
             variable result : std_logic_vector(31 downto 0);
           begin
			  if(I_ALU_EN = '1') then
			      case I_ALU_CTL is
                    when "0001" => -- addition 
                        result := std_logic_vector(signed(I_ALU_A ) + signed(I_ALU_B));

                    when "0010" => -- subtraction 
                        result := std_logic_vector(signed(I_ALU_A) - signed(I_ALU_B));
			  
			
                   when others => null;
                end case;
					 
					  
                 if result = X"00000000" then
                    O_ALU_Zero <= '1';
                else
                    O_ALU_Zero <= '0';
                end if;
                
		       O_ALU_Out  <=result;
		    end if;
        end process;
  
            

end Behavioral;

