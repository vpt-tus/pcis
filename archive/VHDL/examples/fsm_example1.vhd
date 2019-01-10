library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
 
entity fsm_example1 is
    port ( a : in  std_logic;
           b : in  std_logic;
           clock : in  std_logic;
           reset : in  std_logic;
           x : out  std_logic;
           y : out  std_logic);
end fsm_example1;

architecture v1 of fsm_example1 is
    type fsm_states is (s0, s1, s2);
    signal current_state, next_state : fsm_states;
begin
    
    state_register: process(clock, reset)
    begin
        if(reset = '1')then
            current_state <= s0;
        elsif(rising_edge(clock))then
            current_state <= next_state;
        end if;
    end process;
    
    next_state_logic: process (current_state, a, b)
    begin
        case current_state is
        when s0 =>
            -- state transitions
            if(a = '1')then
                next_state <= s1;
            elsif (b = '1')then
                next_state <= s2;
            else
                next_state <= s0;
            end if;
            -- outputs
            x <= '0';
            y <= '1';
        when s1 =>        
            if(a = '1')then
                next_state <= s2;
            elsif (b = '1')then
                next_state <= s0;
            else
                next_state <= s1;
            end if;
            
            x <= '1';
            y <= '1';      
        when s2 => 
            next_state <= s0;
            x <= '1';
            y <= '0';            
        when others => 
            next_state <= s0;
            x <= '0';
            y <= '0';            
        end case;
    end process;
end v1;