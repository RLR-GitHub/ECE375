---------------------------------------------------------------------------------
-- D_FLIP_FLOP_LOGIC_GATE_TB
---------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity D_FLIP_FLOP_LOGIC_GATE_TB is
end D_FLIP_FLOP_LOGIC_GATE_TB;

architecture Structural of D_FLIP_FLOP_LOGIC_GATE_TB is

    component D_FLIP_FLOP_LOGIC_GATE is
        Port ( Input_C, Input_D    : in std_logic;  
               Output_Q, Output_QP : out std_logic );
    end component;

    signal C, D  : std_logic := '1';
    signal Q, QP : std_logic;

begin

    UUT: D_FLIP_FLOP_LOGIC_GATE Port Map (Input_D => D, Input_C => C, Output_Q => Q, Output_QP => QP  );
    
    C <= NOT C after 10 ns;
    D <= NOT D after 20 ns;

end Structural;
