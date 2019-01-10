library ieee;
use ieee.std_logic_1164.all;

entity variant2_plus_test is
end variant2_plus_test;
 
architecture test of variant2_plus_test is
    constant CLOCK_PERIOD : time := 10 ns;
    constant WIDTH : integer := 5;  
    
    signal clock_run : boolean := true;
    signal clock, reset, data_in, enable : std_logic;
    signal data_out : std_logic_vector( WIDTH-1 downto 0 );
begin
 
	-- instantiate the unit under test (uut)
   uut: entity work.variant2_plus 
      generic map (W => WIDTH)
      port map (
          clock => clock,
          reset => reset,
          data_in => data_in,
          enable => enable,
          data_out => data_out
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
        variable temp: std_logic_vector(data_out'range); 
    begin      
        reset <= '1';
        data_in <=  '0';
        enable <= '1';
        wait until falling_edge(clock);

        reset <= '0';
        wait until falling_edge(clock);
        assert data_out = "00000" report "test 1";

        data_in <=  '1';
        wait until falling_edge(clock);
        assert data_out = "10000" report "test 2";                                      

        wait until falling_edge(clock);
        assert data_out = "11000" report "test 3";  
        
        wait until falling_edge(clock);
        assert data_out = "11100" report "test 4";
        
        enable <= '0';
        wait until falling_edge(clock);
        assert data_out = "11100" report "test 4.1";
        
        wait until falling_edge(clock);
        assert data_out = "11100" report "test 4.2";                    

        enable <= '1';
        wait until falling_edge(clock);
        assert data_out = "11110" report "test 5";  
        
        wait until falling_edge(clock);
        assert data_out = "11111" report "test 6";  
        
        wait until falling_edge(clock);
        assert data_out = "11111" report "test 7";  
        
        data_in <=  '0';               
        wait until falling_edge(clock);
        assert data_out = "01111" report "test 8";  
        
        wait until falling_edge(clock);
        assert data_out = "00111" report "test 9";  
        
        wait until falling_edge(clock);
        assert data_out = "00011" report "test 10";  

        wait until falling_edge(clock);
        assert data_out = "00001" report "test 11";  
        
        wait until falling_edge(clock);
        assert data_out = "00000" report "test 12";                                                  
        clock_run <= false;

        wait;
    end process;
end;