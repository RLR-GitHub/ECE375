---------------------------------------------------------------------------------
-- NAND_LOGIC_GATE
---------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity NAND_LOGIC_GATE is
    Port ( Input_X, Input_Y : in std_logic;
           Output_Z         : out std_logic );
end NAND_LOGIC_GATE;

architecture Behavioral of NAND_LOGIC_GATE is

begin

    Output_Z <= NOT ( Input_X AND Input_Y );
    
end Behavioral;
