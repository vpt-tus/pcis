library ieee;
use ieee.std_logic_1164.all;

entity experiment is
    port ( clk50: in std_logic;
           reset: in std_logic;
           led: out std_logic_vector (7 downto 0));
end experiment;

architecture structural of experiment is
   signal clock: std_logic; 
begin
 
   U1: entity work.johnson(v1)
      generic map (N => 8)
      port map(
          clock => clock,
          reset => reset,
          reg => led);
 
   U2: entity work.clock_divider
      generic map (N => 23)
      port map( 
          clock_in => clk50,
          clock_out => clock,
          reset => reset);
end structural;