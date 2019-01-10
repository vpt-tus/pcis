library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity priority_encoder_test is
end priority_encoder_test;

architecture test of priority_encoder_test is
    signal invec: std_logic_vector(2 downto 0);
    signal enc_out: unsigned(2 downto 0);
begin
    uut: entity work.priority_encoder(v1)
        port map (invec => invec, enc_out => enc_out);

    stim_proc: process
    begin        
        invec <= "000";
        wait for 10 ns;
        assert enc_out = to_unsigned(0,2) report "test 0";
        
        invec <= "100";
        wait for 10 ns;
        assert enc_out = to_unsigned(3,2) report "test 1";
        
        invec <= "110";
        wait for 10 ns;
        assert enc_out = to_unsigned(3,2) report "test 2";
                                                       
        wait;
    end process;
end test;