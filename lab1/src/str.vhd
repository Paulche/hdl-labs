					  
-- inverter2
library ieee;
use ieee.std_logic_1164.all;

entity inverter2 is
  port(in0: in std_logic; out0: out std_logic);
end inverter2;

architecture RTL of inverter2 is 
begin
	out0 <= not in0;
end RTL;

-- and3
library ieee;
use ieee.std_logic_1164.all;

entity and3 is
  port(in0, in1, in2: in std_logic; out0: out std_logic);
end and3;

architecture RTL of and3 is 
begin
	out0 <= in0 and in1 and in2;
end RTL;

-- or2  
library ieee;
use ieee.std_logic_1164.all;

entity or2 is
  port(in0, in1: in std_logic; out0: out std_logic);
end or2;

architecture RTL of or2 is 
begin
	out0 <= in0 or in1;
end RTL;

-- module0
library ieee;
use ieee.std_logic_1164.all;

entity module0 is 
  port(in0, in1, in2, in3, in4: in std_logic; out0: out std_logic);
end module0;

architecture RTL of module0 is   
begin
  out0 <= (in0 and in1 and in2) or (in3 and in4 and in2);
end RTL;

-- module1
library ieee;
use ieee.std_logic_1164.all;

entity module1 is 
  port(a, x42, x41, x32, x31, x22, x21, x12, x11, not_e: in std_logic; y4, y3, y2, y1: out std_logic);
end module1;

architecture RTL of module1 is 
  component module0 
    port(in0, in1, in2, in3, in4: in std_logic; out0: out std_logic);
  end component;
  
  component inverter2 
    port(in0: in std_logic; out0: out std_logic);
  end component;
  
  signal s0, s1, s2: std_logic; 
  
begin
  el0: inverter2 port map(a, s0);     
  el1: inverter2 port map(s0, s1); 
  el2: module0 port map(s1,x42,s2,s0,x41,y4);
  el3: module0 port map(s1,x32,s2,s0,x31,y3);
  el4: module0 port map(s1,x22,s2,s0,x21,y2); 
  el5: module0 port map(s1,x12,s2,s0,x11,y1);
  el6: inverter2 port map(not_e,s2);
end RTL;   

library ieee;
use ieee.std_logic_1164.all;

entity module1_tb is
end module1_tb;

architecture RTL of module1_tb is
  component module1 
	port(a, x42, x41, x32, x31, x22, x21, x12, x11, not_e: in std_logic; y4, y3, y2, y1: out std_logic);
  end component;
  
  signal a, e_not, x11, x12, x21, x22, x31, x32, x41, x42: std_logic := '1';
  signal y1, y2, y3, y4: std_logic;
  
begin
  el0: module1 port map(a, x42, x41, x32, x31, x22, x21, x12, x11, e_not, y4, y3, y2, y1);
  
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