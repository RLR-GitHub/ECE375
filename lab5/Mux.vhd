library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Mux is
    Port (
           D0 : in STD_LOGIC;
           D1 : in STD_LOGIC;
           D2 : in STD_LOGIC;
           D3 : in STD_LOGIC;
           SL0 : in STD_LOGIC;
           SL1 : in STD_LOGIC;
           M_Out : out STD_LOGIC
         );
end Mux;

architecture Structural of Mux is

-- Signals from inverters, and between AND and OR gates
signal S0, S1, S2, S3, S4, S5 : std_logic;                  -- Signal Declarations

begin

    S0 <= NOT SL0;
    S1 <= NOT SL1;
    S2 <= SL0 AND S1 AND D0;
    S3 <= SL0 AND SL1 AND D1;
    S4 <= SL0 AND SL1 AND D2;
    S5 <= SL0 AND SL1 AND D3;
    M_Out  <= S2 OR S3 OR S4 OR S5;

end Structural;
