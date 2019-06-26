---------------------------------------------------------------------------------
-- D Flip-Flop Component
---------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity D_Flip_Flop is
    Port ( D, Clk : in std_logic; Q, Q_P : out std_logic );
end D_Flip_Flop;

architecture Structure of D_Flip_Flop is

    component NAND_GATE
        port ( I0, I1 : in  std_logic; O : out std_logic );
    end component;

    signal S0 : std_logic;
    signal S1 : std_logic;
    signal T0 : std_logic := '0';
    signal T1 : std_logic := '0';
    signal DP : std_logic;

begin
    U_DP : NAND_GATE port map ( I0 => D,  I1 => D,   O => DP );
    U_S0 : NAND_GATE port map ( I0 => D,  I1 => Clk, O => S0 );
    U_S1 : NAND_GATE port map ( I0 => DP, I1 => Clk, O => S1 );
    U_T0 : NAND_GATE port map ( I0 => S0, I1 => T1,  O => T0 );
    U_T1 : NAND_GATE port map ( I0 => S1, I1 => T0,  O => T1 );
    Q   <= T0;
    Q_P <= T1;
end Structure;