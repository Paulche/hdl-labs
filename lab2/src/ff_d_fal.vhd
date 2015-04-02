
--  D flip-flop with asynchonous SET and RESET (falling edge)
library ieee;
use ieee.std_logic_1164.all;

entity d_flip_flop is
  port( d: in std_logic; 
        s: in std_logic;
        r: in std_logic;
        c: in std_logic;
        q: out std_logic);
end d_flip_flop;

architecture BEH of d_flip_flop is 
begin
  el1: process(d,s,r,c)
    begin
      if (r = '1') then
        q <= '0';
      else
        if (s = '1') then
          q <= '1';
        else
          if (falling_edge(c)) then
            q <= d; 
          end if;
        end if;
      end if;
    end process;
end BEH;

library ieee;
use ieee.std_logic_1164.all;

entity d_flip_flop_tb is 
end d_flip_flop_tb;

architecture TB of d_flip_flop_tb is 
  component d_flip_flop
    port( c: in std_logic; 
          d: in std_logic;
          s: in std_logic;
          r: in std_logic;
          q: out std_logic);
  end component;

  signal device_in:  std_logic_vector(0 to 3) := "0000";
  signal device_out: std_logic;

begin	 
  
  el1: d_flip_flop port map(device_in(0),device_in(1),device_in(2),device_in(3),device_out);
  el2: for i in 0 to 3 generate 
	  le1: process	 
	  variable timeout0: time := 2ns;
	  variable timeout1: time := 8ns;
               begin
                  device_in(i) <= not device_in(i);
				  if (i > 1) then
                    wait for (i+1)*timeout1;	 
				  else 		
					wait for (i+1)*timeout0;  
			      end if;
               end process;    
       end generate; 
end TB;

