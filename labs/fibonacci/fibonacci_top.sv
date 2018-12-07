module fibonacci_top (
	input clk_100,
	input reset,
	output [6:0] seg,
	output [3:0] an
);

	logic clk_fn, clk_disp;
	logic [15:0] fn;

	fibonacci u1 (.clk(clk_fn), .*);
	disp_ctrl u2 (.clk(clk_disp), .*);

	clk_div #(.SCALE(100_000)) u3 (
		.clock_in(clk_100),
		.clock_out(clk_disp),
		.*
	);
	clk_div #(.SCALE(100)) u4 (
		.clock_in(clk_disp),
		.clock_out(clk_fn),
		.*
	);
endmodule