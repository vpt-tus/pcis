module single_shot(
  input clk, rst, sig,
  output logic tick );

  enum logic [1:0] {IDLE, EDGE, WAIT_ZERO} state, state_next;
  logic [5:0] timer, timer_next;

  always_ff @(posedge clk, posedge rst)
    if (rst) begin
      state <= IDLE;
    end
    else begin
      state <= state_next;
    end

  always_comb begin
    state_next = state;
    tick = 0;
    case (state)
      IDLE:
        if (sig) state_next = EDGE;
      EDGE: begin
        tick = 1;
        state_next = WAIT_ZERO;
			end
			WAIT_ZERO:
				if (~sig) state_next = IDLE;
    endcase
  end

endmodule