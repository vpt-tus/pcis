`timescale 10ns / 1ns

module sync_test;
	logic reset, clk = 0, din, dout;

	sync uut (.*);

	always #50 clk = ~clk;
	initial $monitor(clk, din, dout);

	initial begin
		reset = 1;
		din = 0;
		#100 reset = 0;
		#70 din = 1;
		#333 din = 0;
		#218 din = 0;
		#500 $finish;
	end
endmodule