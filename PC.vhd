----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    08:25:19 05/16/2022 
-- Design Name: 
-- Module Name:    PC - Behavioral 
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity PC is
port(
I_PC_UPDATE : in std_logic;
I_PC : in std_logic_vector(31 downto 0);
O_PC : out std_logic_vector(31 downto 0)
);
end PC;

architecture Behavioral of PC is
  
begin
process( I_PC_UPDATE)
   
   begin

   if I_PC_UPDATE ='1' then
    O_PC <= I_PC;
    end if;
    end process;
	 
   
end Behavioral;

