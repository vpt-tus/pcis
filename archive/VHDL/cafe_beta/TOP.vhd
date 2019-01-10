library ieee;
use ieee.std_logic_1164.all;

entity cafe_top is
   port ( 
      clk50 : in  std_logic;
      reset : in  std_logic; -- btn0
      izbor : in std_logic; -- btn1
      moneta : in  std_logic_vector (2 downto 0); -- sw2 - sw0
      moneta_ready : in  std_logic; -- btn2
      cafe : out  std_logic; -- led0
      cafe_ready : in  std_logic; -- btn3
      resto : out std_logic_vector (2 downto 0);
      resto_ready : out std_logic;
      seg : out std_logic_vector (6 downto 0); 
      an : out std_logic_vector (3 downto 0)
      );
end cafe_top;

architecture behavioral of cafe_top is
    signal clk : std_logic;
    signal moneta_ready_int : std_logic;
    signal ostatak : std_logic_vector(2 downto 0);
begin
    
   u1: entity work.debounce port map(
      clk => clk,
      reset => reset,
      d_in => moneta_ready,
      q_out => moneta_ready_int
      );

   u2: entity work.cafe_control port map(
      clk => clk,
      reset => reset,
      moneta_ready => moneta_ready_int,
      moneta => moneta,
      cafe => cafe,
      ostatak => ostatak,
      cafe_ready => cafe_ready,
      resto => resto,
      resto_ready => resto_ready,
      izbor => izbor
      );

   u3: entity work.led_control port map(
      clk => clk,
      reset => reset,
      d3 => "0000",
      d2(2 downto 0) => ostatak,
      d2(3) => '0',
      d1 => "0000",
      d0 => "0000",
      seg => seg,
      an => an
      );

   u4: entity work.clock_div generic map(n=>16) port map(
      clk_in => clk50,
      reset => reset,
      clk_out => clk
      );
end behavioral;