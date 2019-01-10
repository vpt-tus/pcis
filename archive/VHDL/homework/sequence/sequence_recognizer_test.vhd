library ieee;
use ieee.std_logic_1164.all;
  
entity sequence_recognizer_test is
end sequence_recognizer_test;
  
architecture test1 of sequence_recognizer_test is 
    constant CLOCK_PERIOD : time := 10 ns;
    constant STIMULUS_DELAY : time := 7 ns;    
    signal clock_run : boolean := true;
    
    signal clock, reset, input, output : std_logic := '0';
begin
   uut: entity work.sequence_recognizer(v1)
      port map (
         clock => clock,
         reset => reset,
         input => input,
         output => output
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
        procedure apply_and_check(constant stimulus, expected: in std_logic) is
        begin
            wait for STIMULUS_DELAY;
            input <= stimulus;
            wait until rising_edge(clock);
            assert expected = output report "expected:" & std_logic'image(expected);
        end;
    begin
        wait for 100 ns;
        
        -- test 1 - reset
        input <= '0';
        reset <= '1';
        wait until falling_edge(clock);
        assert output = '0' report "test 1 - reset failed";
        reset <= '0';
        
        -- test 2 - 0000
        apply_and_check('0','0');
        apply_and_check('0','0');
        apply_and_check('0','0');
        apply_and_check('0','0');
      
        -- test 3 - input: 0110 output: 0001
        apply_and_check('0','0');
        apply_and_check('1','0');
        apply_and_check('1','0');
        apply_and_check('0','1');
        
        -- test 4 - input: 11110111 output: 0000100
        apply_and_check('1','0');
        apply_and_check('1','0');
        apply_and_check('1','0');
        apply_and_check('1','0');
        apply_and_check('0','1');
        apply_and_check('1','0');
        apply_and_check('1','0');
        apply_and_check('1','0');
        
      clock_run <= false;
      wait;
   end process;
end;