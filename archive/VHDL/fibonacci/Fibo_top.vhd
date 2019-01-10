library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity fibo_top is
    port (clk50 : in  std_logic;
        reset : in  std_logic;
        enable : in std_logic;
        seg : out  std_logic_vector (6 downto 0);
        an : out  std_logic_vector (3 downto 0));
end fibo_top;

architecture structural of fibo_top is
    signal fn : unsigned(15 downto 0);
    -- derived clock for the counter
    signal clock : std_logic;
    -- derived clock for the dynamic indication
    signal clock_dyn_ind : std_logic; 
begin
 
    u1: entity work.fibo 
        generic map (n=>16)
        port map(
          clock => clock,
          reset => reset,
          enable => enable,
          fn => fn);
  
    u2: entity work.dyn_ind_controler(behavioral)
        port map(
            clock => clock_dyn_ind,
            reset => reset,
            d3 => fn(15 downto 12),
            d2 => fn(11 downto 8),
            d1 => fn(7 downto 4),
            d0 => fn(3 downto 0),
            seg => seg,
            an => an);
     
    -- clk = clk50 / 2^24 = approx 3 Hz
    u3: entity work.clock_divider(behavioral)
        generic map( n => 24 )
        port map( clock_in => clk50, clock_out => clock, reset => reset );
 
    -- clk_ind = clk50 / 2^16 = approx 760 Hz
    u4: entity work.clock_divider(behavioral)
        generic map( n => 16 )
        port map( clock_in => clk50, clock_out => clock_dyn_ind, reset => reset );
     
end structural;