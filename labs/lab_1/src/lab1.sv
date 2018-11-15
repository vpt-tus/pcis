module lab1_top #(parameter N = 16) (
	input clk_pin, // 100 MHz
	input rst_pin,
	output [N-1:0] led_pins
);

logic clock;

lab1 #(.WIDTH(N)) u1 (
	.clock(clock), 
	.reset(rst_pin), 
	.sr(led_pins)
);

// 100 000 000 / 2 000 000 = 50 Hz
clk_div #(.DIVIDE_BY(2_000_000)) div (
	.clock_in(clk_pin),
	.clock_out(clock),
	.reset(rst_pin)
);

endmodule

module lab1   #(parameter WIDTH = 8) (
	input clock,
	input reset,
	output logic [WIDTH-1:0] sr
);

always_ff @(posedge clock, posedge reset) 
	if(reset) sr <= 0;
	else sr = {sr[WIDTH-2:0],~sr[WIDTH-1]};

endmodule
