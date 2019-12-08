`timescale 10ns / 1ns

module fibonacci_test;

	localparam N = 13;

	logic clk = 0;
	logic reset, next = 0;
	logic [N-1:0] fn;

	fibonacci #(.N(N)) uut(.*);

	initial forever #60 clk = ~clk;
	initial $display("Max number: %d",uut.MAX_NUMBER);
	initial begin
		reset = 1;
		#100 reset = 0;
		#150 next = 1;
		#100 next = 0;
		#507 next = 1;
		#500 next = 0;
		#2013 next = 1;
		#1000 next = 0;
		#2000 next = 1;
		#1000 $finish;
	end

	always @ (posedge(clk)) begin
		$display("%t fn = %d, next = %0b, mode = %0b", $time, fn, next, uut.mode);
	end
endmodule
