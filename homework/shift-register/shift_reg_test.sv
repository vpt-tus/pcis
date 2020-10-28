`timescale 1ns / 1ps

module shift_reg_test;

  localparam N = 8; // Register width
  localparam T = 100; // Clock period

  logic clock = 0;
  logic reset; // Active high
  logic [N-1:0] sr; // Shift register content

  shift_reg #(.N(N)) uut(.*);

  always #(T/2) clock = ~clock;

  initial $monitor("%b", sr);

  initial begin
    reset = 1;
    #T reset = 0;
    #(32*T) $finish;
  end

endmodule
