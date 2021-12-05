module pulse_fsm_mealy #(PULSE_WIDTH = 3)(
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
          pulse = 1;
          next_counter = PULSE_WIDTH - 1;
          next_state = EDGE;
        end
      end
      EDGE: begin        
        if (counter == 0) begin
          pulse = 0;
          next_state = WAIT;
        end else begin
          next_counter = counter - 1;
        end
      end
      WAIT: begin              
        if (~sig) begin
          next_state = IDLE;
        end
      end
    endcase
  end
endmodule
