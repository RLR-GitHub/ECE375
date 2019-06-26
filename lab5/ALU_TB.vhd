library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

library UNISIM;
use UNISIM.VComponents.all;

entity ALU_TB is
--  Port ( );
end ALU_TB;

architecture ALU_TB of ALU_TB is

    -- Declaration of component to test
    component ALU
        Port (
               A     : in STD_LOGIC;
               B     : in STD_LOGIC;
               C_In  : in STD_LOGIC;
               OP0   : in STD_LOGIC;
               OP1   : in STD_LOGIC;
               Carry : out STD_LOGIC;
               Result: out STD_LOGIC
             );
    end component;

-- Input signals of component
signal A      : std_logic := '0';
signal B      : std_logic := '0';
signal C_In   : std_logic := '1';
signal OP0    : std_logic := '0';
signal OP1    : std_logic := '0';

-- Output signals of component
signal Carry  : std_logic;
signal Result : std_logic;

begin

    -- Instantiation of Unit Under Test (UUT)
    UUT : ALU
    port map (
               A       => A,
               B       => B,
               C_In    => C_In,
               OP0     => OP0,
               OP1     => OP1,
               Carry   => Carry,
               Result  => Result
             );

    -- Stimulus Block to generate test signals for the UUT
    A    <= NOT A after 80ns;
    B    <= NOT B after 40ns;
    OP0  <= NOT OP0 after 10ns;
    OP1  <= NOT OP1 after 20ns;
        
end ALU_TB;
