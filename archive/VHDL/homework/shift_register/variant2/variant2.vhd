library ieee;
use ieee.std_logic_1164.all;

entity variant2 is
    generic(W : natural := 5);
port( clock: in  std_logic;
    reset: in std_logic;
    data_in: in std_logic;
    data_out: out std_logic_vector(W-1 downto 0));
end variant2;

architecture behavioral of variant2 is
    signal reg: std_logic_vector(data_out'range);
begin
    data_out <= reg;
    registers : process (clock, reset) begin

	-- TODO

    end process;
end behavioral;