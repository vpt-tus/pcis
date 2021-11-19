module timer_light #(parameter T=20) (
  input logic clock, reset, push_btn,
  output logic light
);

  enum logic {OFF, ON} state, next_state;
  integer timer, next_timer;

  always_ff @(posedge clock or posedge reset)
    if (reset) begin
      state <= ON;
      timer <= T;
    end else begin
      state <= next_state;
      timer <= next_timer;
    end

  always_comb begin
    next_state = state;
    next_timer = timer;
    case (state)
      ON: begin
        light = '1;
        if (timer == 0)
          next_state = OFF;
        else 
          next_timer = timer - 1;
      end    
      OFF: begin
        light = '0;
        if (push_btn) begin
          next_state = ON;
          next_timer = T;
        end
      end
    endcase
  end
endmodule
