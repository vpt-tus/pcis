library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.bcd_package.all;
 
entity bcd_counter_test is
end bcd_counter_test;
 
architecture test of bcd_counter_test is

   constant NUMBER_OF_DIGITS: positive := 3;

   constant CLOCK_PERIOD : time := 10 ns; 
   signal clock_run : boolean := true;

   signal clock, reset, carry_in, carry_out : std_logic;
   signal bcd : bcd_number(NUMBER_OF_DIGITS-1 downto 0);   
begin
    -- instantiate the unit under test
    uut: entity work.bcd_counter(v1)
    generic map(NUMBER_OF_DIGITS => NUMBER_OF_DIGITS)
    port map(clock => clock, 
        reset => reset,     
        carry_in => carry_in,
        carry_out => carry_out,
        bcd_out => bcd);
 
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
        procedure check_bcd(expected: in bcd_number; actual: in bcd_number) is
        begin
            assert are_equal(expected, actual) report "expected " & to_string(expected) &", actual " & to_string(actual);
        end;        
    begin       
        reset <= '1';
        wait for 100 ns;
        reset <= '0'; carry_in <= '1';  
  
        for i in 0 to 10**NUMBER_OF_DIGITS-1 loop
            wait until rising_edge(clock);        
            check_bcd(to_bcd_number(i,NUMBER_OF_DIGITS), bcd);
        end loop;
        assert carry_out = '1' report"carry_out must be '1' for bcd=" & to_string(bcd);
        
        -- stop the clock
        clock_run <= false;
        wait;
    end process;
end;