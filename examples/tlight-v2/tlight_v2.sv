import tlight_package::*;

module tlight_v2(
  input clock, reset, // clock period is 1s
  output tlight_control_t ns, we
);

  enum logic[2:0] {
    RESET, 
    WE_READY_TO_GO, 
    WE_GO, 
    WE_PREPARE_TO_STOP, 
    NS_READY_TO_GO, 
    NS_GO, 
    NS_PREPARE_TO_STOP} state, state_next;

  logic [3:0] timer, timer_next;

  parameter YELLOW_DURATION = 2; // 3s
  parameter RED_GREEN_DURATION = 14; // 15s

  // State register
  always_ff @(posedge clock or posedge reset) 
    if (reset) 
      state <= RESET;
    else
      state <= state_next;

  // Timer
  always_ff @(posedge clock or posedge reset) 
    if (reset)
      timer <= '0;
    else
      timer <= timer_next;

  always_comb 
  begin
    // Defaults
    state_next = state;

    case (state)
      RESET: begin
        ns = RED;
        we = RED;
        timer_next = YELLOW_DURATION;
        state_next = WE_READY_TO_GO;
      end
      WE_READY_TO_GO: begin
        ns = RED;
        we = YELLOW;
        if (timer == 0) begin
          state_next = WE_GO;
          timer_next = RED_GREEN_DURATION;
        end else
          timer_next = timer - 1;
      end
      WE_GO: begin
        ns = RED;
        we = GREEN;
        if (timer == 0) 
          state_next = WE_PREPARE_TO_STOP;
        else
          timer_next = timer - 1;
      end
      WE_PREPARE_TO_STOP: begin
        ns = RED;
        we = YELLOW;        
        state_next = NS_READY_TO_GO;
        timer_next = YELLOW_DURATION;
      end
      NS_READY_TO_GO: begin
        ns = YELLOW;
        we = RED;
        if (timer == 0) begin
          state_next = NS_GO;
          timer_next = RED_GREEN_DURATION;
        end else
          timer_next = timer - 1;
      end
      NS_GO: begin
        ns = GREEN;
        we = RED;
        if (timer == 0) begin
          state_next = NS_PREPARE_TO_STOP;
          timer_next = YELLOW_DURATION;
        end else
          timer_next = timer - 1;
      end
      NS_PREPARE_TO_STOP: begin
        ns = YELLOW;
        we = RED;        
        state_next = WE_READY_TO_GO;
      end      
    endcase
  end
endmodule
