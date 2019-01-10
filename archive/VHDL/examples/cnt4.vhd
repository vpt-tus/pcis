library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity cnt4_dummy_delay is
    port( clock : in  std_logic; reset: in std_logic; q : out  unsigned (3 downto 0) );
end cnt4_dummy_delay;

architecture behavioral of cnt4_dummy_delay is
    constant DUMMY_DELAY: time := 1 ns;
	signal temp : unsigned (3 downto 0);
begin
    counter: process( clock, reset ) 
    begin
        if( reset = '1') then
            temp <= "0000" after DUMMY_DELAY;
        elsif rising_edge( clock ) then
            temp <= temp + 1 after DUMMY_DELAY;
        end if;
    end process;
    q <= temp;
end behavioral;