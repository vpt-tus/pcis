library ieee;
use ieee.std_logic_1164.all;
 
entity johnson_tb is
end johnson_tb;
 
architecture behavior of johnson_tb is  
    constant CLOCK_PERIOD : time := 10 ns; 
    constant WIDTH : positive := 8;
    signal clock_run : boolean := true;
   
    signal clock : std_logic;
    signal reset : std_logic;
    signal led : std_logic_vector(WIDTH-1 downto 0);
begin
   UUT: entity work.johnson(v2)
      generic map( N => WIDTH )
      port map (
         clock => clock,
         reset => reset,
         reg => led
      );

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
      reset <= '1';
      wait until falling_edge(clock);
      assert led = "00000000" report "led != 00000000";
      
      reset <= '0';
      wait until falling_edge(clock);
      assert led = "00000001" report "led != 00000001";
      
      wait until falling_edge(clock);
      assert led = "00000011" report "led != 00000011";
      
      wait until falling_edge(clock);
      assert led = "00000111" report "led != 00000111";
      
      wait until falling_edge(clock);
      assert led = "00001111" report "led != 00001111";
      
      wait until falling_edge(clock);
      assert led = "00011111" report "led != 00011111";
      
      wait until falling_edge(clock);
      assert led = "00111111" report "led != 00111111";
      
      wait until falling_edge(clock);
      assert led = "01111111" report "led != 01111111";
      
      wait until falling_edge(clock);
      assert led = "11111111" report "led != 11111111";
      
      wait until falling_edge(clock);
      assert led = "11111110" report "led != 11111110";
      
      wait until falling_edge(clock);
      assert led = "11111100" report "led != 11111100";
      
      for i in 1 to 6 loop
         wait until falling_edge(clock);
      end loop;
      assert led = "00000000" report "led != 00000000";
      
      for i in 1 to 8 loop
         wait until falling_edge(clock);
      end loop;
      assert led = "11111111" report "led != 11111111";
      
      clock_run <= false;
      wait;
   end process;
end;