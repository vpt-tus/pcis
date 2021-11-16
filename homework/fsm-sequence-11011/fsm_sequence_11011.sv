module fsm_sequence_11011(
    input clk, rst, din,
    output logic dout );
  
  enum logic [2:0] { S1, S11, S110, S1101, S11011, S0} state, state_next;
  
  always_ff @(posedge clk, posedge rst) begin
      // TODO
  end;
 
  always_comb begin
      // TODO
  end
endmodule
