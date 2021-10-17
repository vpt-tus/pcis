// Dataflow style
module decoder_2x4_v1 (
  output logic [0:3] Q,
  input A, B, E);

  assign Q[0] = !(!A && !B && !E);
  assign Q[1] = !(!A && B && !E);
  assign Q[2] = !(A && !B && !E);
  assign Q[3] = !(A && B && !E);
endmodule

// Behavioral style
module decoder_2x4_v2 (
  output logic [3:0] Q,
  input A, B, E);

  always_comb
    if (E)
      Q = 4'b1111;
    else
      case ({A,B})
          2'b00: Q = 4'b0111;
          2'b01: Q = 4'b1011;
          2'b10: Q = 4'b1101;
          2'b11: Q = 4'b1110;
      endcase
endmodule

module decoder_top(
  output logic [3:0] Q1, Q2,
  input A, B, E);

  decoder_2x4_v1 D1 (.Q(Q1), .*);
  decoder_2x4_v2 D2 (.Q(Q2), .*);

endmodule


module decoder_test_1;

  logic [0:3] Q1, Q2;
  logic A, B, E;

  decoder_top uut (.*);

  initial begin
    $display("E A B ->  Q1   Q2");
    $monitor("%b %b %b -> %b %b", E, A, B, Q1, Q2);
    E = 1; A = 0; B = 0;
    #100 E = 0;
    #100 A = 0; B = 0;
    #100 A = 0; B = 1;		
    #100 A = 1; B = 0;
    #100 A = 1; B = 1;
    #100;
    $finish;
  end
endmodule

module decoder_test_2;
  logic [0:3] Q1, Q2;
  logic A, B, E;

  decoder_top uut (.*);

  initial begin
    $display("E A B ->  Q1 Q2");
    $monitor("%b %b %b -> %b %b", E, A, B, Q1, Q2);
    for (integer i=0; i<=7; i++) begin
      {E,A,B} = i;
      #100;
    end
    $finish;
  end
endmodule
