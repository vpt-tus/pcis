library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.bcd_package.all;
 
entity bcd_adder_test is
end bcd_adder_test;
 
architecture test of bcd_adder_test is
    constant N: positive := 3;

    signal a,b : bcd_number(N-1 downto 0);
    signal s : bcd_number(N downto 0);
         
begin
    uut: entity work.bcd_adder(v1)
        generic map(N=>N)
        port map(a,b,s);
  
    stim_proc: process
        variable expected, actual: integer;     
    begin           
        for i1 in 0 to 10**N-1 loop
            for i0 in 0 to 10**N-1 loop
                integer_to_bcd(i0, a);
                integer_to_bcd(i1, b);
                wait for 10 ns;                
                expected := i0 + i1;
                bcd_to_integer(s, actual);
                assert actual = expected report "expected " & integer'image(expected) & "   actual " & integer'image(actual);   
            end loop;        
        end loop;      
        wait;
    end process;
end;