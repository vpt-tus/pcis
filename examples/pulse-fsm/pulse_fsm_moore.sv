module pulse_fsm_moore #(PULSE_WIDTH = 1)(
  input clock, reset, sig,
  output logic pulse);

  enum {IDLE, EDGE, WAIT} state, next_state;
  integer counter, next_counter;

  always_ff @(posedge clock, posedge reset)
    if (reset) begin
      state <= IDLE;
      counter <= 0;
    end else begin
      state <= next_state;
      counter <= next_counter;
    end

  always_comb begin
    next_state = state;
    next_counter = 0;
    case (state)
      IDLE: begin
        pulse = 0;
        if (sig) begin
          next_counter = PULSE_WIDTH - 1;
          next_state = EDGE;
        end
      end
      EDGE: begin
        pulse = 1;
        if (counter == 0) begin
          next_state = WAIT;
        end else begin
          next_counter = counter - 1;
        end
      end
      WAIT: begin      
        pulse = 0;
        if (~sig) begin
          next_state = IDLE;
        end
      end
    endcase
  end
endmodule
