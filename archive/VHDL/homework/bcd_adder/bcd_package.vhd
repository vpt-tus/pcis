library ieee;
use ieee.std_logic_1164.all;

--
-- Type declarations and helper functions for BCD arithmetic
--
package bcd_package is
    subtype bcd_digit is integer range 0 to 9;
    type bcd_number is array (integer range<>) of bcd_digit;
    function chr(digit: bcd_digit) return character;
    function to_string(bcd: bcd_number) return string;
    function are_equal(foo: bcd_number; bar: bcd_number) return boolean;  
    procedure integer_to_bcd(int: in integer; signal bcd: out bcd_number);
    procedure bcd_to_integer(signal bcd: in bcd_number; int: out integer);
end bcd_package;

package body bcd_package is

    function chr(digit: bcd_digit) return character is
        variable c: character;
    begin
        case digit is
            when  0 => c := '0';
            when  1 => c := '1';
            when  2 => c := '2';
            when  3 => c := '3';
            when  4 => c := '4';
            when  5 => c := '5';
            when  6 => c := '6';
            when  7 => c := '7';
            when  8 => c := '8';
            when  9 => c := '9';
            when others => c := '?';
        end case;
        return c;
    end chr;

    function to_string(bcd: bcd_number) return string is
        variable result: string(bcd'range);
    begin
        for i in bcd'range loop
            result(i) := chr(bcd(i));
        end loop;
        return result;
    end;
    
    function are_equal(foo: bcd_number; bar: bcd_number) return boolean is
    begin
        for i in foo'range loop
            if(foo(i) /= bar(i)) then 
                return false;
            end if;                
        end loop;
        return true;
    end;

    procedure integer_to_bcd(int: in integer; signal bcd: out bcd_number) is
        variable limit: integer;
    begin
        -- parameters check
        assert 10**bcd'length-1 >= int report "The 'bcd' parameter is not long enough for 'int'=" & integer'image(int); 
        assert bcd'right = 0 report "The 'bcd' range must be in the format 'N downto 0'";
        
        for i in bcd'range loop
            bcd(i) <= (int mod 10**(i+1)) / 10**i;
        end loop;
    end;
    
    procedure bcd_to_integer(signal bcd: in bcd_number; int: out integer) is
        variable tmp: integer;
    begin
        -- parameters check    
        assert bcd'right = 0 report "The 'bcd' range must be in the format 'N downto 0'";
        
        tmp := 0;
        for i in bcd'right to bcd'left loop
            tmp := tmp + 10**i * bcd(i);
        end loop;
        int := tmp;
    end; 

end bcd_package;