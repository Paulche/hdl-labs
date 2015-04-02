-- nand4
library ieee;
use ieee.std_logic_1164.all;

entity nand4 is
  port( in4: in std_logic_vector(0 to 3);
        out1: out std_logic);
end nand4;

architecture STR of nand4 is 
begin
  el1: out1 <= (in4(0) nand in4(1)) nand (in4(2) nand in4(3));
end STR;

-- not1
library ieee;
use ieee.std_logic_1164.all;

entity not1 is
  port( in1: in std_logic;
        out1: out std_logic);
end not1;

architecture STR of not1 is 
begin
  el1: out1 <= not in1;
end STR;

-- nand2
library ieee;
use ieee.std_logic_1164.all;

entity not1 is
  port( in1: in std_logic;
        out1: out std_logic);
end not1;

architecture STR of not1 is 
begin
  el1: out1 <= not in1;
end STR;

