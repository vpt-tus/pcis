library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.mpis.all;
 
entity adder_test is
end adder_test;
 
architecture test1 of adder_test is 
    constant WIDTH : integer := 4;   
  
    signal a, b: unsigned(WIDTH-1 downto 0);
    signal carry_in: std_logic;
    signal summ: unsigned(WIDTH-1 downto 0); 
    signal carry_out: std_logic;
        
begin
    uut: entity work.ripple_carry_adder 
        port map (
            a => a,
            b => b,
            summ => summ, 
            carry_in => carry_in, 
            carry_out => carry_out
        );

    stim_proc: process
    begin		
        carry_in <= '0';
        for i in 0 to 2**WIDTH-1 loop
            for j in 0 to 2**WIDTH-1 loop        
                a <= to_unsigned(i,WIDTH);
                b <= to_unsigned(j,WIDTH);
                wait for 10 ns;
                assert are_equal(summ,i+j) report "Signal 'summ': " & format_diff(i+j,to_integer(summ));
                if(i+j > 2**WIDTH-1) then
                    assert carry_out = '1' report "carry_out must me '1'";
                else
                    assert carry_out = '0' report "carry_out must me '0'";
                end if;
            end loop;
        end loop;
        wait;
    end process;
end;
