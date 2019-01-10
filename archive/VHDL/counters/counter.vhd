library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
 
entity counter is
    generic ( N: positive;
        RESET_ACTIVE: std_logic := '1';
        INITIAL_STATE : integer := 0);
    port ( clock : in  std_logic; 
        reset : in  std_logic; 
        q : out  unsigned (N-1 downto 0));
end counter;
 
architecture behavioral of counter is
    signal temp : unsigned(N-1 downto 0);    
begin
    process(clock, reset) 
    begin
        if( reset = RESET_ACTIVE) then
            temp <= to_unsigned(INITIAL_STATE,N);
        elsif rising_edge(clock) then
            temp <= temp + 1;
        end if;
    end process;
    q <= temp;
end behavioral;