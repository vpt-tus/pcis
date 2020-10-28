`timescale 1ns / 1ps

module clk_div_test;

  localparam T = 50;

  logic clock_in = 0;
  logic reset;
  logic clock_out;

  // Instantiate the Unit Under Test (UUT)
  clk_div #(.SCALE(3)) uut (.*);

//  initial forever #T clock_in = ~clock_in;
  always #T clock_in = ~clock_in;
  initial $monitor("SCALE = %0d, N = %0d", uut.SCALE, uut.N);
  initial $monitor("%b %b %d",clock_in, clock_out, uut.count);
  
  initial begin
    reset = 1;
    // Wait 100 ns for global reset to finish
    #100 reset = 0;
    #(30*T) $finish;
  end
endmodule

