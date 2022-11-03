module mux_4x1 #(parameter N=8)(
  output logic [N-1:0] Q,
  input [N-1:0] A0, A1, A2, A3,
  input [1:0] SEL );

  always_comb
    case (SEL)
      0: Q = A0;
      1: Q = A1;
      2: Q = A2;
      3: Q = A3;
    endcase
endmodule

