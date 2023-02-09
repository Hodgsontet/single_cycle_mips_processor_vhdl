----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:18:22 05/13/2022 
-- Design Name: 
-- Module Name:    ACU - Behavioral 
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

entity ACU is
    Port ( I_ACU_ALUOp : in  STD_LOGIC_VECTOR (1 downto 0);
           I_ACU_Funct : in  STD_LOGIC_VECTOR (5 downto 0);
           O_ACU_CTL : out  STD_LOGIC_VECTOR (3 downto 0));
end ACU;

architecture Behavioral of ACU is

begin
process(I_ACU_ALUOp, I_ACU_Funct)
            begin

                case I_ACU_ALUOp is
                    when "00" => -- addition
                        O_ACU_CTL <= "0001";

                    when "01" => -- subtraction
                        O_ACU_CTL <= "0010";

                    when "10" => -- set on less than
                        O_ACU_CTL <= "1101";

                    when "11" => -- determined by I_ACU_Funct code
                        case I_ACU_Funct is
                            when "100000" => -- 20h
                                O_ACU_CTL <= "0001"; -- add
									 when "100001" => -- 21h
                                O_ACU_CTL <= "0001"; -- add

                            when "100010" => -- 22h
                                O_ACU_CTL <= "0010"; -- sub                                

                            when "011000" => -- 18h
                                O_ACU_CTL <= "0011"; -- mult

                            when "011010" => -- 1ah
                                O_ACU_CTL <= "0100"; -- div

                            when "100100" => -- 24h
                                O_ACU_CTL <= "0101"; -- and

                            when "100101" => -- 25h
                                O_ACU_CTL <= "0110"; -- or

                            when "100111" => -- 27h
                                O_ACU_CTL <= "0111"; -- nor

                            when others => null;
                        end case;
								

                    when others => null;
                end case;
        end process;

end Behavioral;

