library ieee;
use ieee.std_logic_1164.all;

entity variant2_plus is
    generic(W : natural := 5);
port( clock: in  std_logic;
    reset: in std_logic;
    data_in: in std_logic;
    enable: in std_logic;
    data_out: out std_logic_vector(W-1 downto 0));
end variant2_plus;

architecture behavioral of variant2_plus is
    signal reg: std_logic_vector(data_out'range);
begin
    data_out <= reg;
    registers : process (clock, reset) begin

	-- TODO

    end process;
end behavioral;