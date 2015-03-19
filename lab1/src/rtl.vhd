library ieee;
use ieee.std_logic_1164.all;

entity device0 is 
  port(a, x42, x41, x32, x31, x22, x21, x12, x11, not_e: in std_logic; y4, y3, y2, y1: out std_logic);
end device0;

architecture RTL of device0 is 	
	signal v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10: std_logic;

begin
  el0: v0 <= not a;
  el1: v1 <= not v0;
  el2: v2 <= (v1 and x42 and v10);
  el3: v3 <= (v0 and x41 and v10);
  el4: y4 <= (v2 or v3);
  el5: v4 <= (v1 and x32 and v10);
  el6: v5 <= (v0 and x31 and v10);
  el7: y3 <= (v4 or v5);
  el8: v6 <= (v1 and x22 and v10);
  el9: v7 <= (v0 and x21 and v10);
  el10: y2 <= (v6 or v7);
  el11: v8 <= (v1 and x12 and v10);
  el12: v9 <= (v0 and x11 and v10);
  el13: y1 <= (v8 or v9);
  el14: v10 <= not not_e;

end RTL;

library ieee;
use ieee.std_logic_1164.all;

entity device0_tb is 
end device0_tb;

architecture RTL of device0_tb is
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
  
end RTL;




