module fsm1_reg(
    output logic rd, ds,
    input go, ws, clock, reset_n
);

enum logic [1:0] {IDLE, READ, DELAY, DONE} state, state_next;

// state register
always_ff @(posedge clock, negedge reset_n)
    if (!reset_n) state <= IDLE;
    else state <= state_next;

// next state logic
always_comb begin
    state_next = state;
    case (state)
      IDLE:
        if (go) state_next = READ;
        else state_next = IDLE;
      READ:
        state_next = DELAY;
      DELAY:
        if (ws) state_next = READ;
        else state_next = DONE;
      DONE:
        state_next = IDLE;
    endcase
end

// output logic and registers
always_ff @(posedge clock, negedge reset_n)
    if(!reset_n) begin
        ds <= '0;
        rd <= '0;
    end
    else begin
      rd <= '0;
      ds <= '0;
      case (state_next)
        READ : rd <= '1;
        DELAY : rd <= '1;
        DONE : ds <= '1;
      endcase
    end
endmodule