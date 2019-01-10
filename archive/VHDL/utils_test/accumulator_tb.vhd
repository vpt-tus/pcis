library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.mpis.all;

entity accumulator_tb is
end accumulator_tb;
 
architecture test of accumulator_tb is 

    constant CLOCK_PERIOD : time := 10 ns;
    constant OP_WIDTH : natural := 8;
    constant SUM_WIDTH : natural := OP_WIDTH + 2;  

    signal clock_run : boolean := true;
    
   signal operand : unsigned(OP_WIDTH-1 downto 0);
   signal reset : std_logic;
   signal clock : std_logic;
   signal sum : unsigned(SUM_WIDTH-1 downto 0);
 
begin
 
   uut:entity work.accumulator 
        generic map (OP_WIDTH => OP_WIDTH, SUM_WIDTH => SUM_WIDTH)
        port map (
          operand => operand,
          sum => sum,
          reset => reset,
          clock => clock
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
        assert are_equal(sum,0) report "after reset sum=0";
        
        reset <= '0';
        
        -- test increment by 2
        operand <= to_unsigned(2,OP_WIDTH);
        wait until falling_edge(clock);
        assert are_equal(sum,2) report "0+2=2";
        
        wait until falling_edge(clock);
        assert are_equal(sum,4) report "2+2=4";
        
        wait until falling_edge(clock);
        assert are_equal(sum,6) report "4+2=6";
        
        wait until falling_edge(clock);
        assert are_equal(sum,8) report "6+2=8";
        
        wait until falling_edge(clock);
        assert are_equal(sum,10) report "8+2=10";
        
        -- test that the sum does not overflow at operands width
        operand <= to_unsigned(245,OP_WIDTH);
        wait until falling_edge(clock);
        assert are_equal(sum,255) report "10+245=255";
        
        operand <= to_unsigned(1,OP_WIDTH);
        wait until falling_edge(clock);
        assert are_equal(sum,256) report "255+1=256";
        
        -- test reset
        reset <= '1';
        wait until falling_edge(clock);
        assert are_equal(sum,0) report "after reset sum=0";       
        
        -- test sum overflow
        reset <= '0';
        operand <= to_unsigned(1,OP_WIDTH);
        for i in 1 to 2**SUM_WIDTH-1 loop
            wait until falling_edge(clock);
            assert are_equal(sum,i) report "sum=" & natural'image(i);           
        end loop;
        
        wait until falling_edge(clock);
        assert are_equal(sum,0) report "overflow sum=0";    
         
        clock_run <= false;
      wait;
   end process;

end;