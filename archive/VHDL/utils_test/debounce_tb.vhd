library ieee;
use ieee.std_logic_1164.all;
 
entity debounce_tb is
end debounce_tb;
 
architecture behavior of debounce_tb is 
    constant CLOCK_PERIOD : time := 10 ns;
    signal clock_run : boolean := true;
    
    signal clock : std_logic;
    signal reset : std_logic;
    signal din : std_logic;
    signal dout : std_logic;
begin
    uut: entity work.debounce 
    port map (
        clock => clock,
        reset => reset,
        din => din,
        dout => dout);

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
 
   stim_proc: process
   begin		
		din <= '0';
      reset <= '1';
      wait until falling_edge(clock);
      assert dout = '0' report "sled reset dout != 0";
 
      reset <= '0';
      wait until falling_edge(clock);
      assert dout = '0' report "dout != 0";

      din <= '1';
      wait until falling_edge(clock);
      assert dout = '0' report "dout != 0";
      
      din <= '1';
      wait until falling_edge(clock);
      assert dout = '1' report "dout != 1";
      
      din <= '1';
      wait until falling_edge(clock);
      assert dout = '0' report "dout != 0";
      
      din <= '1';
      wait until falling_edge(clock);
      assert dout = '0' report "dout != 0";
      
      din <= '0';
      wait until falling_edge(clock);
      assert dout = '0' report "dout != 0";
      
      wait until falling_edge(clock);
      wait until falling_edge(clock);
      
      din <= '1';
      wait until falling_edge(clock);
      assert dout = '0' report "dout != 0";
      
      din <= '0';
      wait until falling_edge(clock);
      assert dout = '0' report "dout != 0";
      
      din <= '0';
      wait until falling_edge(clock);
      assert dout = '0' report "dout != 0";

      clock_run <= false;
      wait;
   end process;
end;