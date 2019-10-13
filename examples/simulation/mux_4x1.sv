module mux_4x1(
  output logic Y,
  input [7:0] A, B, C, D,
  input [1:0] select
  );

always_comb
  case (select)
    2'b00: Y = A;
    2'b01: Y = B;
    2'b10: Y = C;
    2'b11: Y = D;
  endcase
endmodule