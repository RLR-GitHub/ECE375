---------------------------------------------------------------------------------
-- Decade_Counter_Logic_Circuit
---------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Decade_Counter_Logic_Circuit is
    Port ( Clk : in  std_logic;
           Q0  : out std_logic;
           Q1  : out std_logic;
           Q2  : out std_logic;
           Q3  : out std_logic ); -- actual ports

end Decade_Counter_Logic_Circuit;

architecture Structural of Decade_Counter_Logic_Circuit is

    component D_FLIP_FLOP_LOGIC_GATE is -- formal ports associated w/ actual port / signal (meaning formal port is connected)
        Port ( Input_C   : in    std_logic;
               Input_D   : in    std_logic;     
               Output_Q  : out   std_logic;
               Output_QP : inout std_logic );
    end component;

    signal D0, D1, D2, D3 : std_logic := '0';
    signal C0, C1, C2, C3 : std_logic;
    signal QP0, QP1, QP2, QP3 : std_logic; -- output buffer signals

begin
    --QP0 <= '1';
    --D0 <= '0';
    
    --D0 <= QP0;
    --C0 <= Clk; -- D_FF_0 has Clock, C0 == System_Clock, Clk
    --C1 <= QP0; -- D_FF_1 cas Clock, C1 == QP of previous D_FF_1, QP0
    --C2 <= QP1; -- D_FF_2 cas Clock, C1 == QP of previous D_FF_2, QP1
    --C3 <= QP2; -- D_FF_3 cas Clock, C1 == QP of previous D_FF_2, QP2
    
    --D1 <= QP1;
    --D2 <= QP2;
    --D3 <= QP3;
    
    --C0 <= Clk; -- D_FF_0 has Clock, C0 == System_Clock, Clk
    --D0 <= QP0;
    QP0 <= D0;
    DFF_0 : D_FLIP_FLOP_LOGIC_GATE Port Map ( Input_C => Clk, Input_D => D0, Output_Q => Q0, Output_QP => QP0 ); -- formal => actual
    --DFF_1 : D_FLIP_FLOP_LOGIC_GATE Port Map ( Input_C => C1, Input_D => D1, Output_Q => Q1, Output_QP => QP1 );
    --DFF_2 : D_FLIP_FLOP_LOGIC_GATE Port Map ( Input_C => C2, Input_D => D2, Output_Q => Q2, Output_QP => QP2 );
    --DFF_3 : D_FLIP_FLOP_LOGIC_GATE Port Map ( Input_C => C3, Input_D => D3, Output_Q => Q3, Output_QP => QP3 );
    
    -----------------------------------------------------------------------------------------------------------
    
    -- if ( ! D0 ) { Connect QP output of prior D_FF to the Clk input of the current D_FF };
    -- else { Connect system Clk output to the Clk input of the current D_FF };
    --D0 <= QP0;
    --C0 <= Clk; -- D_FF_0 has Clock, C0 == System_Clock, Clk
    --C1 <= QP0; -- D_FF_1 cas Clock, C1 == QP of previous D_FF_1, QP0
    --C2 <= QP1; -- D_FF_2 cas Clock, C1 == QP of previous D_FF_2, QP1
    --C3 <= QP2; -- D_FF_3 cas Clock, C1 == QP of previous D_FF_2, QP2
       
end Structural;
