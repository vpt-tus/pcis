library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.bcd_package.all;
 
entity bcd_digit_adder_test is
end bcd_digit_adder_test;
 
architecture test of bcd_digit_adder_test is
    signal digit_a, digit_b, digit_s: bcd_digit;
    signal cin, cout: std_logic;
begin
    uut: entity work.bcd_digit_adder(v1)
    port map(digit_a, digit_b, digit_s, cin, cout);
  
    stim_proc: process
        variable expected_digit_s: bcd_digit;
        variable overflow: boolean;
    begin
        for cin_i in 0 to 1 loop
            for a_i in 0 to 9 loop
                for b_i in 0 to 9 loop
                
                    -- calculate expected results
                    expected_digit_s := a_i + b_i + cin_i;
                    overflow := expected_digit_s > 9;
                    expected_digit_s := expected_digit_s mod 10;
                    
                    -- apply test vector to uut
                    digit_a <= a_i;
                    digit_b <= b_i;
                    if cin_i = 0 then
                        cin <= '0';
                    else
                        cin <= '1';
                    end if;
                    wait for 10 ns;                   
                    
                    -- verify the outputs
                    assert digit_s = expected_digit_s 
                        report "expected " & integer'image(expected_digit_s) & "   actual " & integer'image(digit_s);
                    if overflow then
                        assert cout = '1' report "cout must be 1 when the sum is " & integer'image(digit_s);
                    else
                        assert cout = '0' report "cout must be 0 when the sum is " & integer'image(digit_s);
                    end if;
                end loop;        
            end loop;    
        end loop;         
        wait;
    end process;
end;