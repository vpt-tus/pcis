`timescale 1ns / 1ps

module lab1_test;

	logic clock = 0;
	logic reset;
	logic [7:0] sr;

	lab1 uut(.*);

	initial forever #50 clock = ~clock;
	initial $monitor("%b",sr);

	initial begin
		reset = 1;
		#100 reset = 0;
		#5000 $finish;
	end

endmodule
