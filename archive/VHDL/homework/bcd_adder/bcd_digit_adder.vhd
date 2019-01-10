library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.bcd_package.all;

-- Adds two BCD digits - 'digit_a' and 'digit_b' and an input carry 'cin'
-- The result is a single BCD digit sum 'digit_s' and output carry 'cout'

entity bcd_digit_adder is
    port(digit_a, digit_b: in bcd_digit;
        digit_s: out bcd_digit;
        cin: in std_logic;
        cout: out std_logic);
end bcd_digit_adder;

architecture v1 of bcd_digit_adder is
begin
 -- TODO
end v1;

