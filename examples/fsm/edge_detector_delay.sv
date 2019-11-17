module edge_detector_delay #(parameter DELAY=10)(
  input clk, rst, sig,
  output logic tick );

  enum logic [1:0] {IDLE, EDGE, WAIT_ZERO, WAIT_DELAY} state, state_next;
  logic [5:0] timer, timer_next;

  always_ff @(posedge clk, posedge rst)
    if (rst) begin
      state <= IDLE;
      timer <= '0;
    end
    else begin
      state <= state_next;
      timer <= timer_next;
    end

  always_comb begin
    state_next = state;
    timer_next = timer;
    tick = 0;
    case (state)
      IDLE: 
        if (sig) state_next = EDGE;
      EDGE: begin
        tick = 1;
        state_next = WAIT_DELAY;
        timer_next = DELAY;
      end
      WAIT_DELAY: begin
        if (timer) timer_next = timer - 1;
        else state_next = WAIT_ZERO;
      end
      WAIT_ZERO: 
        if (~sig) state_next = IDLE;
    endcase
  end

endmodule
