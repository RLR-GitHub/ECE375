---------------------------------------------------------------------------------
-- NAND_GATE Component
---------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity NAND_GATE is
    Port ( I0, I1 : in  std_logic;
           O      : out std_logic );
end NAND_GATE;

architecture behavior of NAND_GATE is
begin 
    O <= NOT ( I0 AND I1 );
end behavior;
---------------------------------------------------------------------------------
-- D Flip-Flop Component
---------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity D_Flip_Flop is
    Port ( D, Clk : in  std_logic;
           Q, Q_P : inout std_logic );
end D_Flip_Flop;

architecture behavior of D_Flip_Flop is

    component NAND2_GATE
    port ( I0, I1 : in  std_logic;
           O      : out std_logic );
    end component;

    signal S0 : std_logic;
    signal S1 : std_logic;
    signal DP : std_logic;

begin
    I0 : NAND2_GATE port map ( I0 => D,  I1 => D,   O => DP );
    W0 : NAND2_GATE port map ( I0 => D,  I1 => Clk, O => S0 );
    W1 : NAND2_GATE port map ( I0 => DP, I1 => Clk, O => S1 );
    V0 : NAND2_GATE port map ( I0 => S0, I1 => Q_P,  O => Q );
    V1 : NAND2_GATE port map ( I0 => S1, I1 => Q,  O => Q_P );
end behavior;
---------------------------------------------------------------------------------
-- Decade Counter
---------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity decade_ctr is
    Port ( Clk : in  std_logic;
           Q0, Q1, Q2, Q3 : inout std_logic );
end decade_ctr;

architecture Structure of decade_ctr is

    component D_Flip_Flop
    Port ( D, Clk : in  std_logic;
           Q, Q_P : inout std_logic );
    end component;

    signal D0, D1, D2, D3 : std_logic;
    signal B0, B1, B2, B3 : std_logic;

begin

    U0 : D_Flip_Flop port map ( D => D0, Clk => Clk, Q => Q0, Q_P => B0 );
    U1 : D_Flip_Flop port map ( D => B1, Clk => B0, Q => Q1, Q_P => D1 );
    U2 : D_Flip_Flop port map ( D => B2, Clk => B1, Q => Q2, Q_P => D2 );
    U3 : D_Flip_Flop port map ( D => B3, Clk => B2, Q => Q3, Q_P => D3 );

    D0 <= B0; -- Connect input 'B0' to the output 'S0'
    D1 <= B1;
    D2 <= B2; -- connect output 'S2' to input 'B2'
    D3 <= B3;

end Structure;
