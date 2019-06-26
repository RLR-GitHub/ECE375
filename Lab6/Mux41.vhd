library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

library UNISIM;
use UNISIM.VComponents.all;

entity Mux41 is
    Port ( D0 : in STD_LOGIC;
           D1 : in STD_LOGIC;
           D2 : in STD_LOGIC;
           D3 : in STD_LOGIC;
           C0 : in STD_LOGIC;
           C1 : in STD_LOGIC;
           Z : out STD_LOGIC);
end Mux41;

architecture Structural of Mux41 is

    component AND3 -- and3 component declaration
    port ( 
            i0 : in std_logic;
            i1 : in std_logic;
            i2 : in std_logic;
            o : out std_logic
         );
    end component;
         
    component OR4 -- or4 component declaration
    port ( 
            i0 : in std_logic;
            i1 : in std_logic;
            i2 : in std_logic;
            i3 : in std_logic;
            o  : out std_logic
         );
    end component;
    
    component INV -- or4 component declaration
    port ( 
            I : in std_logic;
            O : out std_logic
         );
    end component;

signal S0, S1, S2, S3, C_IN0, C_IN1 : std_logic;

begin

    u0 : INV port map ( C0, C_IN0 );
    u1 : INV port map ( C1, C_IN1 );
    
    u2 : AND3 port map ( C_IN0, C_IN1, D0, S0 );
    u3 : AND3 port map ( C_IN0, C1, D1, S1 );
    u4 : AND3 port map ( C0, C_IN1, D2, S2 );
    u5 : AND3 port map ( C0, C1, D3, S3 );
        
    u6 : OR4 port map ( S0, S1, S2, S3, Z );

end Structural;
