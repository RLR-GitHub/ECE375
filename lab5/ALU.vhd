library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ALU is
    Port (
           A : in STD_LOGIC;
           B : in STD_LOGIC;
           C_In : in STD_LOGIC;
           OP0 : in STD_LOGIC;
           OP1 : in STD_LOGIC;
           Result : out STD_LOGIC;
           Carry : out STD_LOGIC
         );
end ALU;

architecture Structural of ALU is

    component AND2                              -- AND Component Declaration
        port ( X, Y : in std_logic; Z : out std_logic );
    end component;

    component OR2                               -- OR Component Declaration
        port ( X, Y : in std_logic; Z : out std_logic );
    end component;

    component XOR2                              -- XOR Component Declaration
        port ( X, Y : in std_logic; Z : out std_logic );
    end component;

    component FullAdder                         -- ADDER Component Declaration
        port ( A, B, C_In     : in std_logic;
               Sum, Carry     : out std_logic );
    end component;

    component Mux                              -- MUX Component Declaration
        port ( D0, D1, D2, D3, SL0, SL1 : in std_logic;
               M_Out                    : out std_logic );
    end component;

signal S0, S1, S2, S3 : std_logic;                  -- Signal Declarations

begin

    u1 : AND2 port map ( X => A, Y => B, Z => S0 );
    u2 : OR2 port map ( X => A, Y => B, Z => S1 );
    u3 : XOR2 port map ( X => A, Y => B, Z => S2 );
    u4 : FullAdder port map ( A => A, B => B, C_In => C_In, Sum => S3, Carry => Carry );
    u5 : Mux port map ( D0 => S0, D1 => S1, D2 => S2, D3 => S3, SL0 => OP0, SL1 => OP1, M_Out => Result );

end Structural;
