library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity priority_encoder is
  port (invec: in std_logic_vector(2 downto 0);
        enc_out: out unsigned(2 downto 0));
end priority_encoder;

architecture v1 of priority_encoder is
begin
    process (invec)
    begin
        if invec(2) = '1' then
            enc_out <= to_unsigned(3,3);
        elsif invec(1) = '1' then
            enc_out <= to_unsigned(2,3);
        elsif invec(0) = '1' then
            enc_out <= to_unsigned(1,3);
        else 
            enc_out <= to_unsigned(0,3);
        end if; 
    end process;
end v1;

architecture v2 of priority_encoder is
begin
    process (invec)
    begin
        if invec(2) = '1' then
            enc_out <= to_unsigned(3,3);
        elsif invec(1) = '1' then
            enc_out <= to_unsigned(2,3);
        elsif invec(0) = '1' then
            enc_out <= to_unsigned(1,3);
        end if; 
    end process;
end v2;