library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- Divide the input clock by 2^(N-1)
--
-- Signals
-- clk_in - input clock
-- clk_out - output clock
-- reset - active high
--
-- Generics
-- N - division coefficient 
   
entity clock_divider is
   generic( N: integer );
   port( clock_in: in std_logic; reset: in std_logic; clock_out: out std_logic);
end clock_divider;

architecture behavioral of clock_divider is
   signal counter: unsigned(N-1 downto 0); 
begin
    process (clock_in, reset) 
    begin
        if( reset = '1') then
            counter <= ( others=>'0' );
        elsif rising_edge( clock_in ) then
            counter <= counter + 1;
        end if;
    end process;
    clock_out <= counter(N-1);
end behavioral;