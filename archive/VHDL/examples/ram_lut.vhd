library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ram_lut is
    port(
        hex : in unsigned(3 downto 0);
        segs : out std_logic_vector(6 downto 0)
    );
end ram_lut;

architecture behavioral of ram_lut is

begin
    process (hex)
    begin
        case (hex) is 
		  when "0000" =>
			 segs <= "1000000"; --0
		  when "0001" =>
			 segs <= "1111001"; --1
		  when "0010" =>
			 segs <= "0100100"; --2
		  when "0011" =>
			 segs <= "0110000"; --3
		  when "0100" =>
			 segs <= "0011001"; --4
		  when "0101" =>
			 segs <= "0010010"; --5
		  when "0110" =>
			 segs <= "0000010"; --6
		  when "0111" =>
			 segs <= "1111000"; --7
		  when "1000" =>
			 segs <= "0000000"; --8
		  when "1001" =>
			 segs <= "0010000"; --9
		  when "1010" =>
			 segs <= "0001000"; -- A
		  when "1011" =>
			 segs <= "0000011"; -- b
		  when "1100" =>
			 segs <= "1000110"; -- C
		  when "1101" =>
			 segs <= "0100001"; -- d
		  when "1110" =>
			 segs <= "0000110"; -- E
		  when "1111" =>
			 segs <= "0001110"; -- F   
		  when others =>
			 segs <= "1111111"; -- nothing
	   end case;
    end process;
end;

