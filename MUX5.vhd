library ieee;
use ieee.std_logic_1164.all;


entity MUX5 is
    port(
         I_MUX_SEL : in std_logic;
        I_MUX_0, I_MUX_1: in std_logic_vector(4 downto 0);
        O_MUX_Out : out std_logic_vector(4 downto 0)
    );
end MUX5;

architecture Behavioral of MUX5 is
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