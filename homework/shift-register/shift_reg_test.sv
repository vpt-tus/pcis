`timescale 1ns / 1ps

module shift_reg_test;

  localparam N = 5;

  logic clock = 0;
  logic reset;
  logic [N-1:0] sr;

  shift_reg #(.N(N)) uut(.*);

  always #50 clock = ~clock;

  initial $monitor("%b",sr);

  initial begin
    reset = 1;
    #100 reset = 0;
    #2000 $finish;
  end

endmodule
