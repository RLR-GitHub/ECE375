-----------------------------------------------------------------
-- XOR, AND, & OR Entity Declarations 
-----------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity XOR2 is
    port ( X, Y : in std_logic; Z : out std_logic );
end XOR2;

architecture e1 of XOR2 is      -- Architecture of entity 1 (e1)
    begin
        Z <= X XOR Y;
end e1;

-----------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity AND2 is
    port ( X, Y : in std_logic; Z : out std_logic );
end AND2;

architecture e2 of AND2 is      -- Architecture of entity 2 (e2)
    begin
        Z <= X AND Y;
end e2;

-----------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity OR2 is
    port ( X, Y : in std_logic; Z : out std_logic );
end OR2;

architecture e3 of OR2 is      -- Architecture of entity 3 (e3)
    begin
        Z <= X OR Y;
end e3;

-----------------------------------------------------------------
-- 1-Bit ALU Entity Declaration 
-----------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity FullAdder is
    Port (
           A : in STD_LOGIC;
           B : in STD_LOGIC;
           C_In : in STD_LOGIC;
           Sum : out STD_LOGIC;
           Carry : out STD_LOGIC
         );
end FullAdder;

architecture Structural of FullAdder is

    component XOR2                              -- XOR Component Declaration
        port ( X, Y : in std_logic; Z : out std_logic );
    end component;

    component AND2                              -- AND Component Declaration
        port ( X, Y : in std_logic; Z : out std_logic );
    end component;

    component OR2                               -- OR Component Declaration
        port ( X, Y : in std_logic; Z : out std_logic );
    end component;

signal S0, S1, S2 : std_logic;                  -- Signal Declarations

begin

    -- top left XOR gate w/ output to signal S0
    u1 : XOR2 port map ( X => A, Y => B, Z => S0 );

    -- top right XOR gate w/ input from S0, C_In
    u2 : XOR2 port map ( X => S0, Y => C_In, Z => Sum );

    -- bottom left AND gate w/ output to signal S2
    u3 : AND2 port map ( X => A, Y => B, Z => S2 );

    -- middle AND gate w/ output to signal S1
    u4 : AND2 port map ( X => S0, Y => C_In, Z => S1 );

    -- bottom right OR gate w/ output to signal S1
    u5 : OR2 port map ( X => S1, Y => S2, Z => Carry );

end Structural;
