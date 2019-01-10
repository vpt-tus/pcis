library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity johnson is
    generic(N: positive);
    port( clock, reset: in std_logic;
        reg: out std_logic_vector (N-1 downto 0));
end johnson;

architecture v1 of johnson is
    signal reg_i: std_logic_vector(reg'range);
begin
    reg <= reg_i;
    process (clock, reset)
    begin
        if( reset = '1') then
            reg_i <= (others=>'0');
        elsif rising_edge(clock) then
            -- using concatenation
            reg_i <= reg_i(reg'left-1 downto reg'right) & not reg_i(reg'left);
        end if;
    end process;
end v1;

architecture v2 of johnson is
    signal reg_i: unsigned(reg'range);
begin
    reg <= std_logic_vector(reg_i);
    process (clock, reset)
        variable tmp: std_logic;
    begin
        if( reset = '1') then
            reg_i <= (others=>'0');
        elsif rising_edge(clock) then
            -- using shift functions
            tmp := reg_i(reg'left); 
            reg_i <= shift_left(reg_i, 1);
            reg_i(reg'right) <= not tmp;
        end if;
    end process;
end v2;