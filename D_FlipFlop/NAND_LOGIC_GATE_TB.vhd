---------------------------------------------------------------------------------
-- NAND_LOGIC_GATE_TB
---------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity NAND_LOGIC_GATE_TB is
end NAND_LOGIC_GATE_TB;

architecture Behavioral of NAND_LOGIC_GATE_TB is

    component NAND_LOGIC_GATE is
        Port ( Input_X, Input_Y : in std_logic;
               Output_Z         : out std_logic );
    end component;
    
    signal X, Y : std_logic := '1';
    signal Z    : std_logic;
    
begin

    UUT: NAND_LOGIC_GATE Port Map (Input_X => X, Input_Y => Y, Output_Z => Z  );
    
    X <= NOT X after 10 ns;
    Y <= NOT Y after 20 ns;
    
end Behavioral;
