library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.mpis.all;

entity counter_8bit_test is
end counter_8bit_test;

architecture behavioral of counter_8bit_test is
   constant CLOCK_PERIOD : time := 10 ns;
   constant WIDTH : natural := 8;   
   
   signal clock_run : boolean := true;
    
   signal clock : std_logic;
   signal reset : std_logic;
   signal q : unsigned(WIDTH-1 downto 0);

begin
	-- instantiate the unit under test (uut)
    uut: entity work.counter 
    generic map ( N => WIDTH, INITIAL_STATE => 4) 
    port map ( clock => clock, reset => reset, q => q );

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
        assert are_equal(q,0) report "q=0";

        -- test up counting from 1 to 2^N-1
        reset <= '0';        
        for i in 1 to 2**WIDTH-1 loop
            wait until falling_edge(clock); 
            assert are_equal(q,i) report "q=" & natural'image(i);            
        end loop;
        
        -- check counter overflow
        wait until falling_edge(clock);
        assert are_equal(q,0) report "q=0";

        -- test the reset
         for i in 1 to 5 loop
            wait until falling_edge(clock);             
        end loop;
        assert are_equal(q,5) report "q=5";
        reset <= '1';
        wait until falling_edge(clock);
        assert are_equal(q,0) report "q=0";
        
        -- stop the clock
        clock_run <= false;
        wait;
    end process;
end;