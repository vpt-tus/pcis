module fsm1(
  output logic rd, ds,
  input go, ws, clock, reset_n
);
    // state type
    typedef enum logic [1:0] {IDLE, READ, DELAY, DONE} state_t;
    state_t state, state_next;

    // state register
    always_ff @(posedge clock, negedge reset_n)
      if (~reset_n) state <= IDLE;
      else state <= state_next;

    // next state and output logic
    always_comb begin
      ds = '0;
      rd = '0;
      case (state)
        IDLE:
          if (go) state_next = READ;
          else state_next = IDLE;
        READ: begin
          rd = '1;
          state_next = DELAY;
        end
        DELAY: begin
          rd = '1;
          if (ws) state_next = READ;
          else state_next = DONE;
        end
        DONE: begin
          ds = '1;
          state_next = IDLE;
        end
      endcase
    end
endmodule
