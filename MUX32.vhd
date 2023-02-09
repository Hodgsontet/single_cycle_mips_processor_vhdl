----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    08:03:53 05/15/2022 
-- Design Name: 
-- Module Name:    MUX32 - Behavioral 
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

entity MUX32 is
port(
         I_MUX_SEL : in std_logic;
        I_MUX_0, I_MUX_1: in std_logic_vector(31 downto 0);
        O_MUX_Out : out std_logic_vector(31 downto 0)
    );
end MUX32;

architecture Behavioral of MUX32 is

begin
 process(I_MUX_0, I_MUX_1, I_MUX_SEL )
            begin
                if I_MUX_SEL = '0' then
                    O_MUX_Out<= I_MUX_0;
                elsif I_MUX_SEL = '1' then
                    O_MUX_Out <= I_MUX_1;
                end if;
        end process;

end Behavioral;

