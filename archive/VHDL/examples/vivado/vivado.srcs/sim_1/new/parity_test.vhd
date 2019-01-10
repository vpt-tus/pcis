library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity parity_test is
end parity_test;

architecture test of parity_test is
    constant WIDTH : integer := 3;  
    signal a: unsigned(WIDTH-1 downto 0);
    signal even: std_logic;
begin
    uut: entity work.parity
        generic map (WIDTH => WIDTH)
        port map (a => a, even => even);

    stim_proc: process
    begin        
        a <= "000";
        wait for 10 ns;
        assert even = '1' report "test 0";
        
        a <= "001";
        wait for 10 ns;        
        assert even = '0' report "test 1";
        
        a <= "010";
        wait for 10 ns;        
        assert even = '0' report "test 2";
        
        a <= "011";
        wait for 10 ns;        
        assert even = '1' report "test 3";
                        
        a <= "100";
        wait for 10 ns;        
        assert even = '0' report "test 4";
                
        a <= "101";
        wait for 10 ns;        
        assert even = '1' report "test 5";

        a <= "110";
        wait for 10 ns;        
        assert even = '1' report "test 6";

        a <= "111";
        wait for 10 ns;        
        assert even = '0' report "test 7";
                                               
        wait;
    end process;
end test;
