library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity cafe_control is
   port ( clk : in  std_logic;
      reset : in  std_logic;
      izbor : in std_logic;
      moneta : in std_logic_vector(2 downto 0);
      moneta_ready : in std_logic;     
      cafe : out  std_logic;
      cafe_ready : in  std_logic;
      ostatak : out std_logic_vector(2 downto 0);
      resto : out std_logic_vector(2 downto 0);
      resto_ready : out std_logic);
end cafe_control;

architecture behavioral of cafe_control is
   type state_type is (init, s50, s40, s20, s30, s10, make_cafe);
   signal current_state, next_state : state_type;
   signal ostatak_int, moneta_int : integer range 0 to 5;
begin
   moneta_int <= to_integer(unsigned(moneta));
   ostatak <= std_logic_vector(to_unsigned(ostatak_int,3));

   -- бета версията не връща ресто
   resto <= "000";
   resto_ready <= '0';
   
   state_register: process(clk, reset)
   begin
      if reset = '1' then
         current_state <= init;
      elsif rising_edge(clk) then
         current_state <= next_state;
      end if;
   end process;
   
   next_state_logic: process (current_state, izbor, moneta_ready, moneta_int, cafe_ready) 
   begin
      cafe <= '0';
      ostatak_int <= 0;
      
      case current_state is
      when init =>
         if izbor = '1' then
            next_state <= s50;
         else
            next_state <= init;
         end if;
      when s50 =>
         ostatak_int <= 5;      
         
         if moneta_ready = '1' and moneta_int = 5 then
            next_state <= make_cafe;
         elsif moneta_ready = '1' and moneta_int = 2 then
            next_state <= s30;
         elsif moneta_ready = '1' and moneta_int = 1 then
            next_state <= s40;
         else
            next_state <= s50;
         end if;
      when s40 =>
         ostatak_int <= 4;
         
         if moneta_ready = '1' and moneta_int = 2 then
            next_state <= s20;
         elsif moneta_ready = '1' and moneta_int = 1 then
            next_state <= s30;
         elsif moneta_ready = '1' and moneta_int > 2 then
            next_state <= make_cafe;      
         else
            next_state <= s40;
         end if;
      when s30 =>
         ostatak_int <= 3;
         
         if moneta_ready = '1' and moneta_int = 2 then
            next_state <= s10;
         elsif moneta_ready = '1' and moneta_int = 1 then
            next_state <= s20;
          elsif moneta_ready = '1' and moneta_int > 2 then
            next_state <= make_cafe;  
         else
            next_state <= s30;
         end if;
      when s20 =>
         ostatak_int <= 2;
         
         if moneta_ready = '1' and moneta_int >= 2 then
            next_state <= make_cafe;
         elsif moneta_ready = '1' and moneta_int = 1 then
            next_state <= s10;
         else
            next_state <= s20;
         end if;
      when s10 =>
         ostatak_int <= 1;
         
         if moneta_ready = '1' then
            next_state <= make_cafe;
         else
            next_state <= s10;
         end if;
      when make_cafe =>
         cafe <= '1';
         
         if cafe_ready = '1' then
            next_state <= init;
         else
            next_state <= make_cafe;
         end if;
      when others => 
         next_state <= init;
      end case;
   end process;
end behavioral;   