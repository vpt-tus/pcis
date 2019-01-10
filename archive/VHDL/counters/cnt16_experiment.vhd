library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity cnt16_experiment is
    port ( 
        -- reset (active high)
        reset : in  std_logic; 
        -- 50 MHz external clock
        clk50 : in  std_logic; 
        -- 7segment indicator (common anode)
        seg : out  std_logic_vector (6 downto 0); 
        -- digit enable (active low)
        an : out  std_logic_vector (3 downto 0) 
    ); 
end cnt16_experiment;

architecture structural of cnt16_experiment is
    -- derived clock for the counter
    signal clock_counter : std_logic; 
    -- derived clock for the dynamic indication
    signal clock_dyn_ind : std_logic; 
    signal cnt : unsigned(15 downto 0);
begin

	u1: entity work.counter(behavioral) 
        generic map (n => 16)
        port map( clock => clock_counter, reset => reset, q => cnt );
    
    u2: entity work.dyn_ind_controler(behavioral) 
        port map( 
        clock => clock_dyn_ind, 
        reset => reset, 
        d3 => cnt(15 downto 12), 
        d2 => cnt(11 downto 8), 
        d1 => cnt(7 downto 4), 
        d0 => cnt(3 downto 0), 
        seg => seg, 
        an => an);
    
    -- clk = clk50 / 2^24 = approx 3 Hz
    u3: entity work.clock_divider(behavioral)
    generic map( n => 24 )
    port map( clock_in => clk50, clock_out => clock_counter, reset => reset );

    -- clk_ind = clk50 / 2^16 = approx 760 Hz
    u4: entity work.clock_divider(behavioral)
    generic map( n => 16 )
    port map( clock_in => clk50, clock_out => clock_dyn_ind, reset => reset );
    
end structural;
