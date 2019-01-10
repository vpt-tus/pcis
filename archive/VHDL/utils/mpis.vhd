library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

--
--	Package mpis
--
package mpis is
    subtype bcd_digit is natural range 0 to 9;
    type bcd_number is array (natural range<>) of bcd_digit;

	function seven_segment_decoder( hex : unsigned(3 downto 0)) return std_logic_vector;
	function are_equal( vector: unsigned; number: natural) return boolean;
	function format_diff( expected: integer; actual: integer) return string;
end mpis;

package body mpis is
	-- formats string for reporting difference between expected and actual values
	function format_diff( expected: integer; actual: integer) return string is
	begin
	  return "expected " & integer'image(expected) & ", actual " & integer'image(actual);
	end format_diff;

	-- returns 'true' if both arguments represent the same number
	function are_equal( vector: unsigned; number: natural) return boolean is
	begin
	  return vector = to_unsigned(number, vector'length);
	end are_equal;

	function seven_segment_decoder( hex : unsigned(3 downto 0)) return std_logic_vector is
		variable leds : std_logic_vector(6 downto 0);
	begin
	  -- 
		-- segment encoding
		--      0
		--     ---  
		--  5 |   | 1
		--     ---   <- 6
		--  4 |   | 2
		--     ---
		--      3
	   case (hex) is 
		  when "0000" =>
			 leds := "1000000"; --0
		  when "0001" =>
			 leds := "1111001"; --1
		  when "0010" =>
			 leds := "0100100"; --2
		  when "0011" =>
			 leds := "0110000"; --3
		  when "0100" =>
			 leds := "0011001"; --4
		  when "0101" =>
			 leds := "0010010"; --5
		  when "0110" =>
			 leds := "0000010"; --6
		  when "0111" =>
			 leds := "1111000"; --7
		  when "1000" =>
			 leds := "0000000"; --8
		  when "1001" =>
			 leds := "0010000"; --9
		  when "1010" =>
			 leds := "0001000"; -- A
		  when "1011" =>
			 leds := "0000011"; -- b
		  when "1100" =>
			 leds := "1000110"; -- C
		  when "1101" =>
			 leds := "0100001"; -- d
		  when "1110" =>
			 leds := "0000110"; -- E
		  when "1111" =>
			 leds := "0001110"; -- F   
		  when others =>
			 leds := "1111111"; -- nothing
	   end case;
	   return leds;
	end seven_segment_decoder;
end mpis;
