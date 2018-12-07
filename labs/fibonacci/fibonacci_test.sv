`timescale 10ns / 1ns

module fibonacci_test;

	localparam N = 10;

	logic clk = 0;
	logic reset;
	logic [N-1:0] fn;

	fibonacci #(.N(N)) uut(.*);

	initial forever #50 clk = ~clk;
	initial $monitor("%d",fn);

	initial begin
		reset = 1;
		#100 reset = 0;
		#2000 $finish;
	end

endmodule
