library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity parity is
    generic(WIDTH : positive := 8);
    port (
        a: in unsigned(WIDTH-1 downto 0); 
        even : out std_logic);
end parity;

architecture Behavioral of parity is
    signal tmp: unsigned(WIDTH-2 downto 0);
begin
    even <= not tmp(0);
    l1: for i in WIDTH-2 downto 0 generate
        process (tmp,a) is
        begin
            if i=WIDTH-2 then
                tmp(i) <= a(i+1) xor a(i);
            else
                tmp(i) <= tmp(i+1) xor a(i);            
            end if;
        end process;      
    end generate;    
end Behavioral;
