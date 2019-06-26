--===============================================================
-- ***            Start of XOR2 Logic Gate Component          ***                       
--===============================================================
library IEEE;                          -- LIBRARY_DECLARATIONS
use IEEE.STD_LOGIC_1164.ALL;
-----------------------------------------------------------------
entity XOR2_GATE is                    -- ENTITY_DECLARATION             
    port ( in_0, in_1 : in  STD_LOGIC;
           out_0      : out STD_LOGIC );
end XOR2_GATE;
-----------------------------------------------------------------
architecture behavior of XOR2_GATE is -- ARCHITECTURE_DECLARATION
begin                                 -- BEHAVIORAL_STATEMENT
    out_0 <= in_0 XOR in_1; 
end behavior;
--===============================================================
-- ***          Start of INV Logic Gate Component             ***     
--===============================================================
library IEEE;                          -- LIBRARY_DECLARATIONS
use IEEE.STD_LOGIC_1164.ALL;
-----------------------------------------------------------------
entity INV_GATE is                     -- ENTITY_DECLARATION             
    port ( in_0       : in  STD_LOGIC;
           out_0      : out STD_LOGIC );
end INV_GATE;
-----------------------------------------------------------------
architecture behavior of INV_GATE is  -- ARCHITECTURE_DECLARATION
begin                                 -- BEHAVIORAL_STATEMENT
    out_0 <= NOT in_0; 
end behavior;
--===============================================================
-- ***            Start of 4-Bit Parity Generator             ***                       
--===============================================================
library IEEE;                          -- LIBRARY_DECLARATIONS                          
use IEEE.STD_LOGIC_1164.ALL;
-----------------------------------------------------------------
entity ParityGenerator_4Bit is         -- ENTITY_DECLARATION   
    Port ( D0   : in     STD_LOGIC;
           D1   : in     STD_LOGIC;
           D2   : in     STD_LOGIC;
           D3   : in     STD_LOGIC;
           Odd  : out    STD_LOGIC;
           Even : out    STD_LOGIC );
end ParityGenerator_4Bit;
-----------------------------------------------------------------
--  ARCHITECTURE_DECLARATION
architecture structure of ParityGenerator_4Bit is

--  XOR2_GATE_COMPONENT_DECLARATION
    component XOR2_GATE              
        port ( in_0, in_1 : in  STD_LOGIC;
               out_0      : out STD_LOGIC );
    end component;
    
--  INV_GATE_COMPONENT_DECLARATION
    component INV_GATE         
        port ( in_0       : in  STD_LOGIC;
               out_0      : out STD_LOGIC );
    end component;
    
--  INTERNAL_SIGNAL_DECLARATIONS
    signal E0 : STD_LOGIC;
    signal E1 : STD_LOGIC;
    signal B0 : STD_LOGIC; -- Output to connect to buffer output 'Even'
   
begin

--  COMPONENT_INSTANTIATION_STATEMENTS
    U0 : XOR2_GATE port map ( in_0  => D0,
                              in_1  => D1, 
                              out_0 => E0   );
                              
    U1 : XOR2_GATE port map ( in_0  => D2, 
                              in_1  => D3,  
                              out_0 => E1   );
                              
    U2 : XOR2_GATE port map ( in_0  => E0,
                              in_1  => E1, 
                              out_0 => B0 );
                              
    U3 : INV_GATE  port map ( in_0  => B0,
                              out_0 => Odd  );
                              
    Even <= B0; -- connect 'X' to the output 'even'
    
end structure;