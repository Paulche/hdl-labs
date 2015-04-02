-- device0
library ieee;
use ieee.std_logic_1164.all;

entity device0 is
  port( 
  d: in std_logic_vector(0 to 3);
  c: in std_logic;
  e: in std_logic;
  i: in std_logic;
  s: in std_logic;
  r: in std_logic;
  q: out std_logic_vector(0 to 3));
end device0;

architecture STR of device0 is 
  component d_flip_flop
    port( c: in std_logic; 
          d: in std_logic;
          s: in std_logic;
          r: in std_logic;
          q: inout std_logic);
   end component;
 
  component nand4
   port(in4: in std_logic_vector(0 to 3); out1: out std_logic);
  end component;     
 
  component not1
   port(in1: in std_logic; out1: out std_logic);
  end component;
 
  component nand2
   port(in1: in std_logic; in2: std_logic; out1: out std_logic);
  end component;  
  
  signal s1,s2,s3,s4,s5,s6,s7,s10,s13,s16,s19: std_logic;    
  
  signal d1_vector: std_logic_vector(0 to 3);  
  signal d2_vector: std_logic_vector(0 to 3);
  signal d3_vector: std_logic_vector(0 to 3);
  signal d4_vector: std_logic_vector(0 to 3);
begin

p1: d1_vector  <= (d(0),e,i,s7);
p2: d2_vector  <= (d(1),e,q(0),s7);  
p3: d3_vector  <= (d(2),e,q(1),s7);  
p4: d4_vector  <= (d(3),e,q(2),s7);  
  
el1: nand4 port map(d1_vector,s10);
el2: nand4 port map(d2_vector,s13);
el3: nand4 port map(d3_vector,s16);
el4: nand4 port map(d4_vector,s19);     

el5: d_flip_flop port map(s6,s10,s4,s5,q(0));
el6: d_flip_flop port map(s6,s13,s4,s5,q(1));
el7: d_flip_flop port map(s6,s16,s4,s5,q(2));
el8: d_flip_flop port map(s6,s19,s4,s5,q(3));

el9:  nand2 port map(s,r,s1); 
el10: nand2 port map(s,s1,s2);
el11: nand2 port map(r,s1,s3);

el12: not1 port map(c,s6);
el13: not1 port map(e,s7);

el14: not1 port map(s2,s4);
el15: not1 port map(s3,s5);

end STR;

library ieee;
use ieee.std_logic_1164.all;

entity device0_tb is
end device0_tb;

architecture TB of device0_tb is 
  component device0 is
    port( 
    d: in std_logic_vector(0 to 3);
    c: in std_logic;
    e: in std_logic;
    i: in std_logic;
    s: in std_logic;
    r: in std_logic;
    q: out std_logic_vector(0 to 3));
  end component;

  signal d: in  std_logic_vector(0 to 3) := "1111";
  signal q: out std_logic_vector(0 to 3);
  signal i, s, r, c: in std_logic := '1'; 
  signal e: in std_logic := '0';
begin

  el1: device0 port map(d,c,e,i,s,r,q);
  el2:  process
          c <= not c;
          wait for 2 ns;
        end process;
end TB;

