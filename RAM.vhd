----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    23:04:23 05/01/2022 
-- Design Name: 
-- Module Name:    RAM - Behavioral 
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
use std.textio.all;
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity RAM is
    Port ( I_RAM_EN : in  STD_LOGIC;
           I_RAM_RE : in  STD_LOGIC;
           I_RAM_WE : in  STD_LOGIC;
           I_RAM_ADDR : in  STD_LOGIC_VECTOR (31 downto 0);
           I_RAM_DATA : in  STD_LOGIC_VECTOR (31 downto 0);
           O_RAM_DATA : out  STD_LOGIC_VECTOR (31 downto 0));
end RAM;

architecture Behavioral of RAM is

type DataMemory is array(0 to 255) of std_logic_vector(31 downto 0);
--signal DM : DataMemory := (others => "00000000000000000000000000000000");
signal init : std_logic := '0';
 impure function init_mem(file_name : in string) return DataMemory  is
        file fptr : text open read_mode is file_name;
        variable file_line : line;
        variable temp_vector : bit_vector(0 to 31);
        variable temp_mem : DataMemory ;
    begin
        for i in DataMemory'range loop
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
    
	 
 signal DM : DataMemory := init_mem("RAM_init.txt");	 

begin


 

 process(I_RAM_ADDR,I_RAM_DATA )
	begin
	if I_RAM_EN = '1' then
	   
	     if I_RAM_WE = '1' then
	     DM( (to_integer(unsigned(I_RAM_ADDR ))-8192)/4 ) <= I_RAM_DATA;
	     end if;
	  
	     if I_RAM_RE = '1' then
	     O_RAM_DATA <= DM( (to_integer(unsigned(I_RAM_ADDR ))-8192)/4 );
	     end if;
	  
	end if;
	
end process;



end Behavioral;

