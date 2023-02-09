----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    09:32:13 05/16/2022 
-- Design Name: 
-- Module Name:    jumpAddress - Behavioral 
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

entity jumpAddress is
port(

pseudoaddr : in std_logic_vector(25 downto 0);
inc_pcVal: in std_logic_vector(31 downto 0);
JumpAddress : out std_logic_vector(31 downto 0)
);
end jumpAddress;

architecture Behavioral of jumpAddress is

begin
 JumpAddress <= inc_pcVal(31 downto 28)& pseudoaddr(25 downto 0)&"00" ;  

end Behavioral;

