library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.bcd_package.all;

entity top is
    generic(NUMBER_OF_DIGITS: positive := 3);
    port(clock, reset: in std_logic; 
        bcd_out: out bcd_number(NUMBER_OF_DIGITS-1 downto 0));
end top;

architecture structural of top is

begin
    uut: entity work.bcd_counter(v1)
    generic map(NUMBER_OF_DIGITS => NUMBER_OF_DIGITS)
    port map(clock => clock, 
        reset => reset,     
        bcd_out => bcd_out);

end structural;

