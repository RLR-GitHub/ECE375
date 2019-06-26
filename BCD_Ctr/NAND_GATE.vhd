---------------------------------------------------------------------------------
-- NAND_GATE Component
---------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity NAND_GATE is
    Port ( I0, I1 : in std_logic; O : out std_logic );
end NAND_GATE;

architecture behavior of NAND_GATE is
begin
    O <= NOT ( I0 AND I1 );
end behavior;