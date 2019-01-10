library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
 
entity led_control is
    port ( clk : in  std_logic;
           reset : in  std_logic;
           d0 : in  std_logic_vector (3 downto 0);
           d1 : in  std_logic_vector (3 downto 0);
           d2 : in  std_logic_vector (3 downto 0);
           d3 : in  std_logic_vector (3 downto 0);
           seg : out  std_logic_vector (6 downto 0);
           an : out  std_logic_vector (3 downto 0));
end led_control;
 
architecture behavioral of led_control is
 
    component hex2led
    port(
        hex : in std_logic_vector(3 downto 0);          
        led : out std_logic_vector(6 downto 0)
        );
    end component;
 
    signal cnt : unsigned(1 downto 0);
    signal tmp : std_logic_vector(3 downto 0);    
 
begin
 
    with cnt select
        an <= "0111" when "00",
            "1011" when "01",
            "1101" when "10",
            "1110" when others;
 
    with cnt select
        tmp <= d0 when "00",
            d1 when "01",
            d2 when "10",
            d3 when others;
 
    process (clk, reset)
    begin
        if( reset = '1') then
            cnt <= (others=>'0');
        elsif rising_edge(clk) then
            cnt <= cnt + 1;
        end if;
    end process;
 
    decoder: hex2led port map(
        hex => tmp,
        led => seg
    );
 
end behavioral;