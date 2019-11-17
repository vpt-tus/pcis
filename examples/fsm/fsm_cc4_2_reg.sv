module fsm_cc4_2_reg(
  output logic gnt,
  input dly, done, req, clk, rst_n);

enum logic [1:0] {
  IDLE  = 2'b00,
  BBUSY = 2'b01,
  BWAIT = 2'b10,
  BFREE = 2'b11,
  XX    = 2'bxx} state, state_next;

always_ff @(posedge clk, negedge rst_n)
  if (!rst_n) state <= IDLE;
  else state <= state_next;

always_comb begin
  state_next = XX;
  case (state)
    IDLE :
      if (req) state_next = BBUSY;
      else state_next = IDLE;
    BBUSY:
      if (!done) state_next = BBUSY;
      else if (dly) state_next = BWAIT;
      else state_next = BFREE;
    BWAIT:
      if (!dly) state_next = BFREE;
      else state_next = BWAIT;
    BFREE:
      if (req) state_next = BBUSY;
      else state_next = IDLE;
  endcase
end

always_ff @(posedge clk, negedge rst_n)
  if (!rst_n) gnt <= '0;
  else begin
    case (state_next)
      IDLE, BFREE: gnt <= '0;
      BBUSY, BWAIT: gnt <= '1;
    endcase
  end
endmodule
