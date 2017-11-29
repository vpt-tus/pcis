`timescale 1ns / 1ps

module lab1_test;

   // Inputs
   logic clock;
   logic reset;

   // Outputs
   logic [7:0] sr;

   // Instantiate the Unit Under Test (UUT)
   lab1 uut(.*);

   initial begin   
       clock = 0;
       forever #50 clock = ~clock;
   end

   initial begin
      $monitor("%b",sr);
          
      reset = 1;
      #100 reset = 0;      
      #5000 $finish;      
  end

endmodule
