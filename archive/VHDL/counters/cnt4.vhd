library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity cnt4 is
    port( clock : in  std_logic; reset: in std_logic; q : out  unsigned (3 downto 0) );
end cnt4;

architecture behavioral of cnt4 is
	signal temp : unsigned (3 downto 0);
begin
    counter: process( clock, reset ) 
    begin
        if( reset = '1') then
            temp <= "0000";
        elsif rising_edge( clock ) then
            temp <= temp + 1;
        end if;
    end process;
    q <= temp;
end behavioral;