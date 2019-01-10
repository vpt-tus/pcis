library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ripple_carry_adder is
    generic(WIDTH : positive := 6);
    port (
        a, b: in unsigned(WIDTH-1 downto 0);
        carry_in: in std_logic;
        summ: out unsigned(WIDTH-1 downto 0); 
        carry_out : out std_logic);
end ripple_carry_adder;

architecture structural of ripple_carry_adder is
    signal carry : std_logic_vector(WIDTH downto 0);
begin
    
    carry(0) <= carry_in; 
    carry_out <= carry(WIDTH);
    
    gen: for i in WIDTH-1 downto 0 generate
        add: entity work.full_adder port map( 
            a=>a(i), 
            b=>b(i), 
            cin=>carry(i), 
            s=>summ(i),
            cout=>carry(i+1));
   end generate;
end structural;
