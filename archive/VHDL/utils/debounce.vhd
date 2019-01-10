library ieee;
use ieee.std_logic_1164.all;

entity debounce is
    port ( clock : in std_logic;
           reset : in std_logic;
           din : in std_logic;
           dout : out std_logic);
end debounce;

architecture behavioral of debounce is
   signal q1, q2, q3 : std_logic;
begin
   process(clock) begin
      if reset = '1' then
         q1 <= '0';
         q2 <= '0';
         q3 <= '0'; 
      elsif rising_edge(clock) then
         q1 <= din;
         q2 <= q1;
         q3 <= q2;
      end if;
   end process;
   dout <= q1 and q2 and (not q3);
end behavioral;