library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

library UNISIM;
use UNISIM.VComponents.all;

entity DCD_3_to_8_tb is
end DCD_3_to_8_tb;

architecture DCD_3_to_8_tb of DCD_3_to_8_tb is

    component DCD_3_to_8 is
        Port (
               A : in STD_LOGIC;
               B : in STD_LOGIC;
               C : in STD_LOGIC;
               Y0 : out STD_LOGIC;
               Y1 : out STD_LOGIC;
               Y2 : out STD_LOGIC;
               Y3 : out STD_LOGIC;
               Y4 : out STD_LOGIC;
               Y5 : out STD_LOGIC;
               Y6 : out STD_LOGIC;
               Y7 : out STD_LOGIC
             );
    end component;

    signal A  : std_logic := '0';
    signal B  : std_logic := '0';
    signal C  : std_logic := '0';
    signal Y0 : std_logic;
    signal Y1 : std_logic;
    signal Y2 : std_logic;
    signal Y3 : std_logic;
    signal Y4 : std_logic;
    signal Y5 : std_logic;
    signal Y6 : std_logic;
    signal Y7 : std_logic;

begin

    UUT : DCD_3_to_8
    port map (
               A => A, B => B, C => C, 
               Y0 => Y0, Y1 => Y1, Y2 => Y2, Y3 => Y3, 
               Y4 => Y4, Y5 => Y5, Y6 => Y6, Y7 => Y7
             );

    A <= NOT A after 20 ns;
    B <= NOT B after 10 ns;
    C <= NOT C after 5 ns;

end DCD_3_to_8_tb;








