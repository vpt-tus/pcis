module timer_switch(
  input clock_1Hz, // clock period is 1s
  input reset, // active high
  input btn,   // active high, duration of one clock period
  output logic light // 0 - off, 1 - on
);
  localparam ON_DURATION = 19; // 20s

  enum logic {OFF, ON} state, next_state;
  logic [4:0] timer, next_timer;

  // State register
  always_ff @(posedge clock_1Hz or posedge reset)
    if (reset)
      state <= OFF;
    else
      state <= next_state;

  // Timer register
  always_ff @(posedge clock_1Hz or posedge reset)
    if (reset)
      timer <= '0;
    else
      timer <= next_timer;

  always_comb 
  begin
    next_state = state;
    next_timer = timer;
    case (state)
      OFF: 
      begin
        light = '0;
        if (btn)
        begin
          next_state = ON;
          next_timer = ON_DURATION;
          light = '1;
        end
      end
      ON: 
      begin
        light = '1;
        if (timer==0)
          next_state = OFF;
        else
          next_timer = timer - 1;
        if (btn)
          next_timer = ON_DURATION; // pushing the button while in ON state will reset the timer to ON_DURATION
      end
    endcase
  end
endmodule