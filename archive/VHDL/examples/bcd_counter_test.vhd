library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.mpis.all;
 
entity bcd_counter_test is
end bcd_counter_test;
 
architecture behavior of bcd_counter_test is 
    constant CLOCK_PERIOD : time := 10 ns;
    constant WIDTH : integer := 4;   

    signal clock_run : boolean := true;

    signal clock : std_logic;
    signal reset : std_logic;
    signal q : unsigned(3 downto 0);    
begin
    -- note how a particular architecture is selected for instantiation
    uut: entity work.bcd_counter(with_signal) 
        port map (
            clock => clock,
            reset => reset,
            q => q
        );
   
    -- clock process 
    clock_process: process
    begin
        if clock_run then
            clock <= '0';
            wait for CLOCK_PERIOD/2;
            clock <= '1';
            wait for CLOCK_PERIOD/2;
        else
            wait;
        end if;
    end process;
 
    -- stimulus process
    stim_proc: process
    begin		
        reset <= '1';
        wait until falling_edge(clock);
        assert q = to_unsigned(0, WIDTH) 
        report  "After reset. Signal 'q': " & format_diff(0,to_integer(q));

        -- test up counting from 1 to 9
        reset <= '0';
        for i in 1 to 9 loop
            wait until falling_edge(clock);
            assert are_equal(q,i) 
            report "Signal 'q': " & format_diff(i,to_integer(q));
        end loop;

        -- check counter overflow
        wait until falling_edge(clock);
        assert q = to_unsigned(0, WIDTH) 
        report "After overflow. Signal 'q': " & format_diff(0,to_integer(q));

        for i in 1 to 9 loop
            wait until falling_edge(clock);
            assert are_equal(q,i) 
            report "Signal 'q': " & format_diff(i,to_integer(q));
        end loop;
        
        clock_run <= false;
        wait;
    end process;
end;
