library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

library UNISIM;
use UNISIM.VComponents.all;

entity Mux41_tb is
--  Port ( );
end Mux41_tb;

architecture Mux41_tb of Mux41_tb is

    component Mux41 is
        Port ( D0 : in STD_LOGIC;
           D1 : in STD_LOGIC;
           D2 : in STD_LOGIC;
           D3 : in STD_LOGIC;
           C0 : in STD_LOGIC;
           C1 : in STD_LOGIC;
           Z : out STD_LOGIC);
    end component;
    
signal D0 : std_logic := '1';
signal D1 : std_logic := '1';
signal D2 : std_logic := '1';
signal D3 : std_logic := '1';
signal C0 : std_logic := '0';
signal C1 : std_logic := '0';

signal Z : std_logic;

begin

    UUT : Mux41
    port map ( D0, D1, D2, D3, C0, C1, Z );
    
    C0 <= NOT C0 after 5 ns;
    C1 <= NOT C1 after 10 ns;
    

end Mux41_tb;
