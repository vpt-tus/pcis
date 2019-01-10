library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.bcd_package.all;

entity bcd_counter is
    generic(NUMBER_OF_DIGITS: positive);
    port(clock, reset: in std_logic; 
        carry_in: in std_logic;
        carry_out: out std_logic;        
        bcd_out: out bcd_number(NUMBER_OF_DIGITS-1 downto 0));
end bcd_counter;

architecture v1 of bcd_counter is  
    signal bcd: bcd_number(bcd_out'range);
    signal carry: std_logic_vector(bcd_out'left+1 downto 0);
begin
    bcd_out <= bcd;
    carry(0) <= carry_in;
    carry_out <= carry(carry'left);
    
	-- TO DO

end;

