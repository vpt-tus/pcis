library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.mpis.all;
 
entity fsm_example1_test is
end fsm_example1_test;
 
architecture test1 of fsm_example1_test is 
    constant CLOCK_PERIOD : time := 10 ns;
    constant WIDTH : integer := 4;   

    signal clock_run : boolean := true;
    signal clock, reset, a, b, x, y : std_logic;          
begin
    -- note how a particular architecture is selected for instantiation
    uut: entity work.fsm_example1(v1) 
        port map (a,b,clock,reset,x,y);
   
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
        a <= '0'; b <='0';
        wait until falling_edge(clock);
        assert x = '0' and y = '1' report  "After reset must be in s0";
        
        reset <= '0';

        -- test1 - should stay in s0
        a <= '0'; b <='0';        
        wait until falling_edge(clock);
        assert x = '0' and y = '1' report "test1: should stay in s0";
        wait until falling_edge(clock);
        assert x = '0' and y = '1' report "test1: should stay in s0";

         -- test2 - s0 -> s1 -> s0
        a <= '1'; b <='0';        
        wait until falling_edge(clock);
        assert x = '1' and y = '1' report "test2: must go to s1";

        a <= '0'; b <='1';        
        wait until falling_edge(clock);
        assert x = '0' and y = '1' report "test2: must go to s0";  

         -- test3 - s0 -> s1 -> s1 -> s2 -> s0
        a <= '1'; b <='0';        
        wait until falling_edge(clock);
        assert x = '1' and y = '1' report "test2: must go to s1";   
        
        a <= '0'; b <='0';        
        wait until falling_edge(clock);
        assert x = '1' and y = '1' report "test2: must stay in s1";
        
        a <= '1'; b <='1';        
        wait until falling_edge(clock);
        assert x = '1' and y = '0' report "test2: must go to s2";          
      
        wait until falling_edge(clock);
        assert x = '0' and y = '1' report "test2: must go to s0"; 
        
        clock_run <= false;
        wait;
    end process;
end;
