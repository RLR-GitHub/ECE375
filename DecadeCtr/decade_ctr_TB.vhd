library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity decade_ctr_TB is
end decade_ctr_TB;

architecture Structure of decade_ctr_TB is
    component decade_ctr
        port ( Clk : in std_logic; Q0, Q1, Q2, Q3 : inout std_logic ); 
    end component;
    
    signal Clk : std_logic := '0';
    signal Q0, Q1, Q2, Q3 : std_logic; 
    
begin
    UUT : decade_ctr port map ( Clk => Clk, Q0 => Q0, Q1 => Q1, Q2 => Q2, Q3 => Q3 );
    Clk <= NOT Clk after 10 ns;
end Structure;
