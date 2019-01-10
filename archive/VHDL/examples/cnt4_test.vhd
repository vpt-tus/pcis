library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
 
entity cnt4_test is
end cnt4_test;
 
architecture behavior of cnt4_test is 

    constant CLOCK_PERIOD : time := 10 ns;
    constant WIDTH : integer := 4;   

    signal clock_run : boolean := true;

    signal clock : std_logic;
    signal reset : std_logic;
    signal q : unsigned(3 downto 0);

begin
 
	-- instantiate the unit under test (uut)
    uut: entity work.cnt4_dummy_delay 
        port map (
            clock => clock,
            reset => reset,
            q => q
        );

   -- clock process 
    clock_process :process
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
        assert q = to_unsigned(0, WIDTH) report "q=0";

        -- test up counting from 1 to 15
        reset <= '0';
        wait until falling_edge(clock);
        assert q = to_unsigned(1, WIDTH) report "q=1";

        wait until falling_edge(clock);
        assert q = to_unsigned(2, WIDTH) report "q=2";

        wait until falling_edge(clock);
        assert q = to_unsigned(3, WIDTH) report "q=3";

        wait until falling_edge(clock);
        assert q = to_unsigned(4, WIDTH) report "q=4";

        wait until falling_edge(clock); 
        assert q = to_unsigned(5, WIDTH) report "q=5";

        for i in 1 to 10 loop
            wait until falling_edge(clock);     
        end loop;
        assert q = to_unsigned(15, WIDTH) report "q=15";

        -- check counter overflow
        wait until falling_edge(clock);
        assert q = to_unsigned(0, WIDTH) report "q=0";      

        -- test the reset
         for i in 1 to 4 loop
            wait until falling_edge(clock);             
        end loop;
        assert q = to_unsigned(4, WIDTH) report "q=4";
        reset <= '1';
        wait until falling_edge(clock);
        assert q = to_unsigned(0, WIDTH) report "q=0";  
        
        clock_run <= false;
        wait;
    end process;
end;
