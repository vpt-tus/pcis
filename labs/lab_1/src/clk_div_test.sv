`timescale 1ns / 1ps

module clk_div_test;

	logic clock_in = 0;
	logic reset;
	logic clock_out;
 
	clk_div #(.DIVIDE_BY(8)) uut (.*);
 
	parameter T = 100;
	initial forever #(T/2) clock_in = ~clock_in;

	initial begin
		reset = 1;
		#(2*T) reset = 0;
		#(30*T) $finish;
	end

endmodule
