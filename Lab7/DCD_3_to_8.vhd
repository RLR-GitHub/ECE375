library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

library UNISIM;
use UNISIM.VComponents.all;

entity e0 is                        -- 3:1 AND_GATE ENTITY DECLARATION  
    port (
           i0, i1, i2 : in std_logic; 
           o : out std_logic
         );
end e0;

architecture behaviour of e0 is     -- 3:1 AND_GATE ARCHITECTURE DECLARATION 
begin 
    o <= i0 AND i1 AND i2;          -- 3:1 AND_GATE BEHAVIORAL STATEMENT
end behaviour;
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

library UNISIM;
use UNISIM.VComponents.all;

entity e1 is                        -- 1:1 INV_GATE ENTITY DECLARATION 
    port (
           i : in std_logic; 
           o : out std_logic
         );
end e1;

architecture behaviour of e1 is     -- 1:1 INV_GATE ARCHITECTURE DECLARATION
begin 
    o <= NOT i;                     -- 1:1 INV_GATE BEHAVIORAL STATEMENT
end behaviour;
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

library UNISIM;
use UNISIM.VComponents.all;

entity DCD_3_to_8 is                -- 3:8 DCD ENTITY DECLARATION 
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
end DCD_3_to_8;

architecture struct of DCD_3_to_8 is-- 3:8 DCD ARCHITECTURE DECLARATION

    component AND3                  -- 3:1 AND_GATE Component Declaration
    port (
            i0, i1, i2 : in std_logic;
            o : out std_logic
         );
    end component; 
    component INV                   -- 1:1 INV_GATE component declaration
    port (
            i : in std_logic;
            o : out std_logic
         );
    end component;

    -- Internal Signals Declarations
    signal A_NOT : std_logic;           
    signal B_NOT : std_logic;           
    signal C_NOT : std_logic;           

begin

    -- Component Instantiations Statements
    u0  : INV port map ( i => A, o => A_NOT );
    u1  : INV port map ( i => B, o => B_NOT );
    u2  : INV port map ( i => C, o => C_NOT );
    u3  : AND3 port map ( i0 => A_NOT, i1 => B_NOT, i2 => C_NOT, o => Y0 );
    u4  : AND3 port map ( i0 => A_NOT, i1 => B_NOT, i2 => C, o => Y1 );
    u5  : AND3 port map ( i0 => A_NOT, i1 => B, i2 => C_NOT, o => Y2 );
    u6  : AND3 port map ( i0 => A_NOT, i1 => B, i2 => C, o => Y3 );
    u7  : AND3 port map ( i0 => A, i1 => B_NOT, i2 => C_NOT, o => Y4 );
    u8  : AND3 port map ( i0 => A, i1 => B_NOT, i2 => C, o => Y5 );
    u9  : AND3 port map ( i0 => A, i1 => B, i2 => C_NOT, o => Y6 );
    u10 : AND3 port map ( i0 => A, i1 => B, i2 => C, o => Y7 );

end struct;