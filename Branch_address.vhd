----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    09:13:15 05/16/2022 
-- Design Name: 
-- Module Name:    Branch_address - Behavioral 
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

entity Branch_address is
port(

offset : in std_logic_vector(31 downto 0);
inc_pcVal: in std_logic_vector(31 downto 0);
BranchAddress : out std_logic_vector(31 downto 0)
);

end Branch_address;

architecture Behavioral of Branch_address is
 
begin
  
   
    
	   
	    
		  BranchAddress <= std_logic_vector(  signed(inc_pcVal) + signed( offset(29 downto 0)&"00" )  )  ;
		  
	 
   
        
    
end Behavioral;

