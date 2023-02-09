----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    09:05:53 05/16/2022 
-- Design Name: 
-- Module Name:    PC_PLUS4 - Behavioral 
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity PC_PLUS4 is
port(

InPC : in std_logic_vector(31 downto 0);
OtPC : out std_logic_vector(31 downto 0)
);
end PC_PLUS4; 

architecture Behavioral of PC_PLUS4 is
signal inc: std_logic_vector(31 downto 0) := X"00000004";
begin
 
 OtPC <=  std_logic_vector(signed(inc ) + signed(InPC));

end Behavioral;

