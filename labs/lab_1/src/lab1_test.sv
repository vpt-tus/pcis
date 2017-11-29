`timescale 1ns / 1ps

module lab1_test;

   // Inputs
   reg clock;
   reg reset;

   // Outputs
   wire [7:0] sr;

   // Instantiate the Unit Under Test (UUT)
   lab1 uut(
        .clock(clock),
        .reset(reset),
        .sr(sr));

   initial begin
       $monitor("%b",sr);   
       clock = 0;
       forever #50 clock = ~clock;
   end

   initial begin
      reset = 1;
      #100 reset = 0;      
      #5000 $finish;      
  end

endmodule
