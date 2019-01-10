library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity fibo is
    generic(N : natural);
    port( clock : in  std_logic;
        reset : in  std_logic;
        enable : in std_logic;
        fn : out unsigned(N-1 downto 0));
end fibo;

architecture behavioral of fibo is
    signal fn_internal, fn_minus_1, fn_minus_2 : unsigned(N-1 downto 0);
begin

    fn <= fn_internal;
    fn_internal <= fn_minus_1 + fn_minus_2;
    
    registers : process (clock, reset) begin
        if reset = '1' then
            fn_minus_2 <= (others => '0');
            fn_minus_1 <= to_unsigned(1,N); -- convert integer to n-bit unsigned
        elsif rising_edge(clock) then
            if enable = '1' then
                fn_minus_2 <= fn_minus_1;
                fn_minus_1 <= fn_internal;
            end if;
        end if;
    end process;
end behavioral;