library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ParityGenerator_4Bit_TB is
end ParityGenerator_4Bit_TB;

architecture Behavioral of ParityGenerator_4Bit_TB is

--  Component_Declaration for the Unit Under Test (UUT)
    component ParityGenerator_4Bit
        port ( D0   : in     STD_LOGIC;
               D1   : in     STD_LOGIC;
               D2   : in     STD_LOGIC;
               D3   : in     STD_LOGIC;
               Odd  : out    STD_LOGIC;
               Even : out    STD_LOGIC );
    end component;

--  Input Signals
    signal D0   : std_logic := '0';
    signal D1   : std_logic := '0';
    signal D2   : std_logic := '0';
    signal D3   : std_logic := '0';
    
--  Output & Buffer Signals
    signal Odd  : std_logic;
    signal Even : std_logic;
    
begin

--  Instantiate the Unit Under Test (UUT)
    UUT : ParityGenerator_4Bit port map ( D0   => D0,
                                          D1   => D1,
                                          D2   => D2,
                                          D3   => D3,
                                          Odd  => Odd,
                                          Even => Even );

    D0 <= not D0 after 40 ns;
    D1 <= not D1 after 20 ns;
    D2 <= not D2 after 10 ns;
    D3 <= not D3 after 5  ns;

end Behavioral;