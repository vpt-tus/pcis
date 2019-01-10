library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity accumulator is
    generic (OP_WIDTH : integer; SUM_WIDTH : integer);
    port ( clock : in  std_logic;
        reset : in  std_logic;
        operand : in  unsigned (OP_WIDTH-1 downto 0);
        sum : out  unsigned (SUM_WIDTH-1 downto 0));
end accumulator;

architecture behavioral of accumulator is
    signal sum_internal : unsigned(SUM_WIDTH-1 downto 0);
begin
    sum <= sum_internal;
    
	process (clock, reset) begin
        if reset = '1' then
            sum_internal <= (others=>'0');
        elsif rising_edge(clock) then
            sum_internal <= sum_internal + operand;
        end if;
    end process;
end behavioral;