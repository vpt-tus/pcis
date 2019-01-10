library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
 
entity cafe_control_tb is
end cafe_control_tb;
 
architecture behavior of cafe_control_tb is 
   signal clk : std_logic := '0';
   signal reset : std_logic := '0';
   signal izbor : std_logic := '0';
   signal moneta_ready : std_logic := '0';
   signal cafe : std_logic;
   signal cafe_ready : std_logic := '0';
   
   signal moneta_slv : std_logic_vector(2 downto 0);
   signal moneta_i : integer range 0 to 5;
   
   signal ostatak_slv : std_logic_vector(2 downto 0);
   signal ostatak_i : integer range 0 to 5;
   
   signal resto : std_logic_vector(2 downto 0);
   signal resto_ready : std_logic;

   constant clk_period : time := 10 ns;
   signal clk_run : boolean := true;
begin
   uut: entity work.cafe_control port map (
          clk => clk,
          reset => reset,
          izbor => izbor,
          moneta_ready => moneta_ready,
          cafe_ready => cafe_ready,
          moneta => moneta_slv,
          cafe => cafe,
          ostatak => ostatak_slv,
          resto => resto,
          resto_ready => resto_ready
        );

   clk_process: process
   begin
      if clk_run then
         clk <= '0';
         wait for clk_period/2;
         clk <= '1';
         wait for clk_period/2;
      else
         wait;
      end if;
   end process;
   
   ostatak_i <= to_integer(unsigned(ostatak_slv));
   moneta_slv <= std_logic_vector(to_unsigned(moneta_i,3));
 
   stim_proc: process
      procedure do_moneta_ready is 
      begin
         moneta_ready <= '1';
         wait until falling_edge(clk);
         moneta_ready <= '0';
         wait until falling_edge(clk);      
      end do_moneta_ready; 
   begin        
      reset <= '1';
      wait until falling_edge(clk);
      reset <= '0';
      izbor <= '1';
      wait until falling_edge(clk);
      izbor <= '0';
      wait until falling_edge(clk);

      moneta_i <= 2;
      do_moneta_ready;
      assert ostatak_i = 3;
      
      moneta_i <= 1;
      do_moneta_ready;
      assert ostatak_i = 2;
      
      moneta_i <= 1;
      do_moneta_ready;
      assert ostatak_i = 1;
      
      moneta_i <= 2;
      do_moneta_ready;
      assert ostatak_i = 0;
      assert cafe = '1' report "cafe=1";      
 
      wait until falling_edge(clk);
      wait until falling_edge(clk);
      cafe_ready <= '1';
      wait until falling_edge(clk);
      cafe_ready <= '0';
      
      clk_run <= false;
      wait;
   end process;
end;