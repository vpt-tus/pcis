module pulse_fsm #(PULSE_WIDTH = 3)(
  input clock, reset, sig,
  output logic pulse);

  enum {IDLE, EDGE, WAIT} state, next_state;
  integer pw_counter, next_pw_counter;

  always_ff @(posedge clock, posedge reset)
    if (reset) begin
      state <= IDLE;
      pw_counter <= 0;
    end else begin
      state <= next_state;
      pw_counter <= next_pw_counter;
    end

  always_comb begin
    next_state = state;
    next_pw_counter = 0;
    case (state)
      IDLE: begin
        pulse = 0;
        if (sig) begin
          pulse = 1;
          next_pw_counter = PULSE_WIDTH-1;
          next_state = EDGE;
        end
      end
      EDGE: begin
        if (pw_counter == 0) begin
          pulse = 0;
          next_state = WAIT;
        end else begin
          next_pw_counter = pw_counter - 1;
        end
      end
      WAIT:         
        if (~sig) begin
          next_state = IDLE;
        end
    endcase
  end
endmodule
