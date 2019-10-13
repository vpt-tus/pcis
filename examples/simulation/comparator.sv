`timescale 1ns / 1ps

// Dataflow description of a four-bit comparator
module comparator #(parameter N=4) (
  output A_lt_B, A_eq_B, A_gt_B,
  input [3:0] A, B
  );

  assign A_lt_B = A < B;
  assign A_gt_B = A > B;
  assign A_eq_B = A == B;

endmodule

module comparator_test_1;

  logic [3:0] A, B;
  logic A_lt_B, A_eq_B, A_gt_B;

  // Instantiate the Unit Under Test (UUT)
  comparator uut (.*);

  initial begin
    $monitor("%d %d -> %d %d %d", A, B, A_lt_B, A_eq_B, A_gt_B);
    #100 A = 0; B = 0;
    #100 A = 0; B = 1;		
    #100 A = 5; B = 5;
    #100 A = 15; B = 8;
    #100;
    $finish;
  end
endmodule