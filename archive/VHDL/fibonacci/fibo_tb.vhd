library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.mpis.all;

entity fibo_tb is
end fibo_tb;
 
architecture behavior of fibo_tb is
 
    constant CLOCK_PERIOD : time := 10 ns;
    constant WIDTH : integer := 8;  
 
    signal clock_run : boolean := true;
    
    signal clock : std_logic;
    signal reset : std_logic;
    signal enable : std_logic;
    signal fn : unsigned( WIDTH-1 downto 0 );
begin
 
	-- instantiate the unit under test (uut)
   uut: entity work.fibo 
      generic map (N => WIDTH)
      port map (
          clock => clock,
          reset => reset,
          enable => enable,
          fn => fn
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
        --reset <= '1';
        enable <= '0';
        wait until falling_edge(clock);

        --reset <= '0';
        enable <= '0';
        wait until falling_edge(clock);
        assert are_equal(fn,0) report "fn(0)=0";

        enable <= '1';
        wait until falling_edge(clock);
        assert are_equal(fn,1) report "fn(1)=1";

        wait until falling_edge(clock);
        assert are_equal(fn,1) report "fn(2)=1";

        wait until falling_edge(clock);
        assert are_equal(fn,2) report "fn(3)=2";

        wait until falling_edge(clock);
        assert are_equal(fn,3) report "fn(4)=3";

        wait until falling_edge(clock);	
        assert are_equal(fn,5) report "fn(5)=5";

        wait until falling_edge(clock);
        assert are_equal(fn,8) report "fn(6)=8";

        wait until falling_edge(clock);
        assert are_equal(fn,13) report "fn(7)=13";

        clock_run <= false;

        wait;
    end process;

end;
