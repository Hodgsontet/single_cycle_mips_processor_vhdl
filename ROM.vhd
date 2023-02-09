----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    23:33:44 05/01/2022 
-- Design Name: 
-- Module Name:    ROM - Behavioral 
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

entity ROM is
    Port ( I_ROM_EN : in  STD_LOGIC;
           I_ROM_ADDR : in  STD_LOGIC_VECTOR (31 downto 0);
           O_ROM_DATA : out  STD_LOGIC_VECTOR (31 downto 0));
end ROM;

architecture Behavioral of ROM is
type InstructionMemory is array(0 to 255) of std_logic_vector(31 downto 0);
--signal IM : InstructionMemory  := (others => x"00000000");

impure function init_mem(FileName: in string) return InstructionMemory is
    constant LINE_NUM : integer := 32;
    file fp: text;
    variable temp_mem : InstructionMemory:= (others => x"00000000");	 
     variable line_cache : line;
	  variable byte_cache : bit_vector (31 downto 0) := x"00000000";
	 begin
	    file_open(fp,FileName, read_mode);
		 for i in 0 to LINE_NUM loop
		   if endfile(fp) then
			    exit;
		   else
			    readline(fp,line_cache);
				 read(line_cache,byte_cache);
				 temp_mem(i) := to_stdlogicvector(byte_cache);
			 end if;
		 end loop;
		 file_close(fp);
		 return temp_mem;
		 
	 end function;
	 
 signal IM : InstructionMemory := init_mem("ROM_init.txt");	
begin
process(I_ROM_EN,I_ROM_ADDR)
begin
  if I_ROM_EN ='1' then
       
      O_ROM_DATA <= IM( (to_integer(unsigned(I_ROM_ADDR )))/4 );
    end if;
end process;

end Behavioral;

