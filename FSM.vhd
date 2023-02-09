----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:37:36 05/17/2022 
-- Design Name: 
-- Module Name:    FSM - Behavioral 
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

entity FSM is
port (
I_FSM_CLK : in std_logic;
I_FSM_EN : in std_logic;
I_FSM_INST : in std_logic_vector(31 downto 0);
O_FSM_IF : out std_logic;
O_FSM_ID : out std_logic;
O_FSM_EX :  out std_logic;
O_FSM_ME :out std_logic;
O_FSM_WB : out std_logic
);
end FSM;

architecture Behavioral of FSM is
type stages is ( inf  , id, ex, me ,wb);
signal state : stages;
begin

 process(I_FSM_CLK)
            begin
                if rising_edge (I_FSM_CLK ) and I_FSM_EN ='1' and  I_FSM_INST /= X"0000000c" then
                    
                    if state = 
		  
          			 
                end if;
        end process;
end Behavioral;

