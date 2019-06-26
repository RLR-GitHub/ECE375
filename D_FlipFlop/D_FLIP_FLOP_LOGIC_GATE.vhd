---------------------------------------------------------------------------------
-- D_FLIP_FLOP_LOGIC_GATE
---------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity D_FLIP_FLOP_LOGIC_GATE is 
    Port ( Input_C, Input_D    : in std_logic;     
           Output_Q, Output_QP : out std_logic );
end D_FLIP_FLOP_LOGIC_GATE;

architecture Structural of D_FLIP_FLOP_LOGIC_GATE is

    component NAND_LOGIC_GATE is
        Port ( Input_X, Input_Y : in std_logic; 
               Output_Z         : out std_logic );
    end component;
 
    signal InvertD : std_logic;
    signal S0, S1, T0, T1 : std_logic;
    
begin

    I0 : NAND_LOGIC_GATE Port Map ( Input_X => Input_D, Input_Y => Input_D, Output_Z => InvertD );
    W0 : NAND_LOGIC_GATE Port Map ( Input_X => Input_D, Input_Y => Input_C, Output_Z => S0 );
    W1 : NAND_LOGIC_GATE Port Map ( Input_X => InvertD, Input_Y => Input_C, Output_Z => S1 );
    V0 : NAND_LOGIC_GATE Port Map ( Input_X => S0,      Input_Y => T1,      Output_Z => T0 );
    V1 : NAND_LOGIC_GATE Port Map ( Input_X => S1,      Input_Y => T0,      Output_Z => T1 );
    
    Output_QP <= T1;
    Output_Q <= T0;
    
end Structural;