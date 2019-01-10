library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity clock_div is
   generic( N: integer );
   port( clk_in: in std_logic;
      reset: in std_logic;
      clk_out: out std_logic);
end clock_div;

architecture behavioral of clock_div is
   signal counter: unsigned(N-1 downto 0); 
begin
   -- Divide the input clock by 2^(N-1).
   process (clk_in, reset) 
   begin
      if( reset = '1') then
         counter <= (others=>'0');
      elsif rising_edge(clk_in) then
         counter <= counter + 1;
      end if;
   end process;
   clk_out <= counter(N-1);
end behavioral;