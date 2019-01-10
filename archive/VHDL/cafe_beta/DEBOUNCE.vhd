library ieee;
use ieee.std_logic_1164.all;

entity debounce is
    port ( clk : in  std_logic;
           reset : in  std_logic;
           d_in : in  std_logic;
           q_out : out  std_logic);
end debounce;

architecture behavioral of debounce is

	signal q1, q2, q3 : std_logic;
begin

	process(clk) begin
		if rising_edge(clk) then
			if (reset = '1') then
				q1 <= '0';
				q2 <= '0';
				q3 <= '0'; 
			else
				q1 <= d_in;
				q2 <= q1;
				q3 <= q2;
			end if;
		end if;
	end process;
	 
	q_out <= q1 and q2 and (not q3);

end behavioral;

