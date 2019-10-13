// Dataflow style
module decoder_2x4_df (
  output [0:3] D,
  input A, B, E
);
  assign D[0] = !(!A && !B && !E);
  assign D[1] = !(!A && B && !E);
  assign D[2] = !(A && !B && !E);
  assign D[3] = !(A && B && !E);
endmodule

module decoder_test_1;

  logic [0:3] D;
  logic A, B, E;

  decoder_2x4_df uut (.*);

  initial begin
    $display("E A B ->  D");
    $monitor("%b %b %b -> %b", E, A, B, D);
    E = 1;
    #100 E = 0;
    #100 A = 0; B = 0;
    #100 A = 0; B = 1;		
    #100 A = 1; B = 0;
    #100 A = 1; B = 1;
    #100;
    $finish;
  end
endmodule
