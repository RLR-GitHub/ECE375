---------------------------------------------------------------------------------
-- Decade_Counter_Logic_Circuit_TB
---------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Decade_Counter_Logic_Circuit_TB is
end Decade_Counter_Logic_Circuit_TB;

architecture Behavioral of Decade_Counter_Logic_Circuit_TB is

    component Decade_Counter_logic_Circuit is
        Port ( Clk            : in std_logic;
               Q0, Q1, Q2, Q3 : out std_logic );
    end component;
    
    signal Clk : std_logic := '1';
    signal Q0, Q1, Q2, Q3 : std_logic;
    
begin

    UUT : Decade_Counter_Logic_Circuit Port Map ( Clk => Clk, Q0 => Q0, Q1 => Q1, Q2 => Q2, Q3 => Q3 );

    Clk <= NOT Clk after 10 ns;

end Behavioral;
