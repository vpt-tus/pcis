library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.mpis.all;

entity dyn_ind_controler is
    port ( clock : in  std_logic;
           reset : in  std_logic;
           d0 : in  unsigned (3 downto 0);
           d1 : in  unsigned (3 downto 0);
           d2 : in  unsigned (3 downto 0);
           d3 : in  unsigned (3 downto 0);
           seg : out  std_logic_vector (6 downto 0);
           an : out  std_logic_vector (3 downto 0));
end dyn_ind_controler;

architecture behavioral of dyn_ind_controler is
    signal address : unsigned(1 downto 0);
    signal temp : unsigned(3 downto 0); 
begin
 
    with address select
        an <= "0111" when "00",
            "1011" when "01",
            "1101" when "10",
            "1110" when others;
 
    with address select
        temp <= d0 when "00",
            d1 when "01",
            d2 when "10",
            d3 when others;
            
    seg <= seven_segment_decoder(temp);
 
    process (clock, reset)
    begin
        if( reset = '1') then
            address <= (others=>'0');
        elsif rising_edge(clock) then
            address <= address + 1;
        end if;
    end process;

end behavioral;