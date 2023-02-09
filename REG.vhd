library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use std.textio.all;

entity REG is
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
end REG;

architecture behave of REG is 
type REG_type is array (0 to 31) of std_logic_vector (31 downto 0);
    -- intialize the File using file
    constant file_name :string  := "REG_init.txt";
    -- Function for Parsing the Init File
    impure function init_mem(file_name : in string) return REG_type is
        file fptr : text open read_mode is file_name;
        variable file_line : line;
        variable temp_vector : bit_vector(0 to 31);
        variable temp_mem : REG_type;
    begin
        for i in REG_type'range loop
            if( not endfile(fptr)) then
                readline(fptr, file_line);
                read(file_line, temp_vector);
                temp_mem(i) := to_stdlogicvector(temp_vector); 
            else 
                temp_mem(i) := (others=> '0'); 
            end if;
        end loop;
        return temp_mem;
    end function;
    -------- 
    signal REGS: REG_type:= init_mem(file_name);
begin

    process(I_REG_EN, I_REG_WE, I_REG_SEL_RD, I_REG_SEL_RS, I_REG_SEL_RT, I_REG_DATA_RD) begin
        if(I_REG_EN = '1') then
            O_REG_DATA_A <= REGS(to_integer(unsigned(I_REG_SEL_RS)));
            O_REG_DATA_B <= REGS(to_integer(unsigned(I_REG_SEL_RT)));
        end if;
        if(I_REG_WE = '1' AND I_REG_SEL_RD /= "00000" AND I_REG_EN = '1') then
            REGS(to_integer(unsigned(I_REG_SEL_RD))) <= I_REG_DATA_RD;
        end if;
    end process;

end behave;