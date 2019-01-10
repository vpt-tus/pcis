library ieee;
use ieee.std_logic_1164.all;
 
entity sequence_recognizer is
    port ( input : in  std_logic;
           clock : in  std_logic;
           reset : in  std_logic;
           output : out  std_logic);
end sequence_recognizer;


architecture v1 of sequence_recognizer is
   
begin
    
    state_register: process(clock, reset)
    begin
        -- TODO
    end process;
    
    compute_next_state: process (current_state, input)
    begin
        -- TODO
    end process;
end;

