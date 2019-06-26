---------------------------------------------------------------------------------
-- Decade Counter
---------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity decade_ctr is
    Port ( Clk            : in  std_logic;
           Q0, Q1, Q2, Q3 : inout std_logic );
end decade_ctr;

architecture Structure of decade_ctr is

    component D_Flip_Flop
    Port ( D, Clk : in  std_logic;
           Q, Q_P : inout std_logic );
    end component;

    signal QP0, QP1, QP2, QP3 : std_logic := '0';
    signal B0, B1, B2, B3 : std_logic := '0';

begin

    U0 : D_Flip_Flop port map ( D => B0, Clk => Clk, Q => Q0, Q_P => QP0 );
    U1 : D_Flip_Flop port map ( D => B1, Clk => B0,  Q => Q1, Q_P => QP1 );
    U2 : D_Flip_Flop port map ( D => B2, Clk => B1,  Q => Q2, Q_P => QP2 );
    U3 : D_Flip_Flop port map ( D => B3, Clk => B2,  Q => Q3, Q_P => QP3 );

    QP0 <= B0; -- Connect input 'B0' to the output 'S0'
    QP1 <= B1;
    QP2 <= B2; -- connect output 'S2' to input 'B2'
    QP3 <= B3;

end Structure;
