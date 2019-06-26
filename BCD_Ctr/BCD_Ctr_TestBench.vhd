---------------------------------------------------------------------------------
-- Decade Counter Test Bench
---------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity BCD_Ctr_TestBench is
end BCD_Ctr_TestBench;

architecture Behavioral of BCD_Ctr_TestBench is

    component decade_ctr is
        Port ( Clk            : in  std_logic;
               Q0, Q1, Q2, Q3 : inout std_logic );
    end component;

    signal Clk : std_logic := '0';
    signal Q0 : std_logic := '0';
    signal Q1 : std_logic := '0';
    signal Q2 : std_logic := '0';
    signal Q3 : std_logic := '0';

begin

    UUT : decade_ctr port map ( Clk => Clk, Q0 => Q0, Q1 => Q1, Q2 => Q2, Q3 => Q3 );

    Clk <= NOT Clk after 5 ns;

end Behavioral;
