module fsm_cc4_2(
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
      gnt = '0;
      case (state)
        IDLE :
          if (req) state_next = BBUSY;
          else state_next = IDLE;
        BBUSY: begin
          gnt = '1;
          if (!done) state_next = BBUSY;
          else if (dly) state_next = BWAIT;
          else state_next = BFREE;
        end
        BWAIT: begin
          gnt = '1;
          if (!dly) state_next = BFREE;
          else state_next = BWAIT;
        end
        BFREE:
          if (req) state_next = BBUSY;
          else state_next = IDLE;
      endcase
  end
endmodule
