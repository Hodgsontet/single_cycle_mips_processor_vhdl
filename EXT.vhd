----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    08:12:24 05/15/2022 
-- Design Name: 
-- Module Name:    EXT - Behavioral 
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

entity EXTT is
port(
   I_EXT_16 : in STD_LOGIC_VECTOR(15 downto 0);
	 O_EXT_32 : out STD_LOGIC_VECTOR(31 downto 0)
);
end EXTT;

architecture Behavioral of EXTT is

begin

process(I_EXT_16 )
begin

if I_EXT_16(15)='0' then
O_EXT_32(31 downto 16) <="0000000000000000";
O_EXT_32(15 downto 0) <=I_EXT_16;
else
O_EXT_32(31 downto 16) <="1111111111111111";
O_EXT_32(15 downto 0) <=I_EXT_16;

end if;
end process;

end Behavioral;

