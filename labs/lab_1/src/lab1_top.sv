module lab1_top (
	input clk_100,
	input reset,
	output [15:0] led
	);

	logic clkock;

	lab1a #(.WIDTH(16)) u1 (.sr(led), .*);

	clk_div #(.SCALE(100_000_000/16)) div (
		.clock_in(clk_100),
		.clock_out(clock),
		.reset(reset)
	);

endmodule