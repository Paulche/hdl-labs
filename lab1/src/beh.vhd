library ieee;
use ieee.std_logic_1164.all;

entity device1 is 
  port(a, x42, x41, x32, x31, x22, x21, x12, x11, not_e: in std_logic; y4, y3, y2, y1: out std_logic);
end device0;

architecture BEH of device1 is 	
  signal v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10: std_logic;

begin
  process(a,not_e,x42,x41,x32,x31,x22,x21,x12,x11)
  begin
    if (x = '0') then
      if (a = '0') then
        y4 := x41;
        y3 := x31;
        y2 := x21;
        y1 := x11;
      else 
        y4 := x42;
        y3 := x32;
        y2 := x22;
        y1 := x12;
      end if;
    else 
      y1 := 0; y2 = 0; y3 = 0; y4 = 0;
    end if;
  end process;
end BEH;

library ieee;
use ieee.std_logic_1164.all;

entity device0_tb is 
end device0_tb;

architecture BEH of device1_tb is
  component device0
    port(a, x42, x41, x32, x31, x22, x21, x12, x11, not_e: in std_logic; y4, y3, y2, y1: out std_logic);
  end component;
  
  signal a, e_not, x11, x12, x21, x22, x31, x32, x41, x42: std_logic := '1';
  signal y1, y2, y3, y4: std_logic;
  
begin
  el0: device0 port map(a, x42, x41, x32, x31, x22, x21, x12, x11, e_not, y4, y3, y2, y1);
  
  el1: process
       begin
       a <= not a;
     wait for 1ns;
     end process;
     
  el2: process
       begin
       x11 <= not x11;
     wait for 2ns;
     end process;    
     
  el3: process
       begin
       x12 <= not x12;
     wait for 4ns;
     end process;   

 el4: process
       begin
       x21 <= not x21;
     wait for 8ns;
     end process;   

 el5: process
       begin
       x22 <= not x22;
     wait for 16ns;
     end process;   

 el6: process
       begin
       x31 <= not x31;
     wait for 32ns;
     end process;   

 el7: process
       begin
       x32 <= not x32;
     wait for 64ns;
     end process;        
    
 el8: process
       begin
       x41 <= not x41;
     wait for 128ns;
     end process;   
   
 el9: process
       begin
       x42 <= not x42;
     wait for 256ns;
     end process;   

 el10: process
        begin
      e_not <= not e_not;
      wait for 512ns;
    end process;
  
end BEH;




