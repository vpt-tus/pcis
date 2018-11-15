module alu (
	output [7:0] alu_out,
	output zero,
	input [7:0] ain, bin,
	input [2:0] opcode);
	// RTL code for the alu module
endmodule
module accum (
	output [7:0] dataout,
	input [7:0] datain,
	input clk, rst_n);
	// RTL code for the accumulator module
endmodule
module xtend (
	output [7:0] dout,
	input din,
	input clk, rst_n);
	// RTL code for the sign-extension module
endmodule

// positional
module alu_accum1 (
	output [15:0] dataout,
	input [7:0] ain, bin,
	input [2:0] opcode,
	input clk, rst_n);

	logic [7:0] alu_out;

	alu u1 (alu_out, , ain, bin, opcode);
	accum u2 (dataout[7:0], alu_out, clk, rst_n);
	xtend u3 (dataout[15:8], alu_out[7], clk, rst_n);
endmodule

// by name
module alu_accum2 (
	output [15:0] dataout,
	input [7:0] ain, bin,
	input [2:0] opcode,
	input clk, rst_n);

	logic [7:0] alu_out;

alu u1 (.alu_out(alu_out), .zero(), .ain(ain), .bin(bin), .opcode(opcode));
accum u2 (.dataout(dataout[7:0]), .datain(alu_out), .clk(clk), .rst_n(rst_n));
xtend u3 (.dout(dataout[15:8]), .din(alu_out[7]), .clk(clk), .rst_n(rst_n));
endmodule

module alu_accum3 (
	output [15:0] dataout,
	input [7:0] ain, bin,
	input [2:0] opcode,
	input clk, rst_n);

	logic [7:0] alu_out;

alu u1 (.alu_out, .zero(), .ain, .bin, .opcode);
accum u2 (.dataout(dataout[7:0]), .datain(alu_out), .clk, .rst_n);
xtend u3 (.dout(dataout[15:8]), .din(alu_out[7]), .clk, .rst_n);

endmodule

module alu_accum4 (
	output [15:0] dataout,
	input [7:0] ain, bin,
	input [2:0] opcode,
	input clk, rst_n);

	logic [7:0] alu_out;

alu u1 (.*, .zero());
accum u3 (.*, .dataout(dataout[7:0]), .datain(alu_out));
xtend u3 (.*, .dout(dataout[15:8]), .din(alu_out[7]));;

endmodule

module lab1_top  (
    input clk_pin, // 100 MHz
    input rst_pin,
    output [15:0] led_pins
);
 
logic clock;
 
lab_1 #(.WIDTH(16)) u1 (
    .clock(clock),
    .reset(rst_pin),
    .sr(led_pins)
);
 
// 100 000 000 / 4 000 000 = 25 Hz
clk_div #(.DIVIDE_BY(4_000_000)) div (
    .clock_in(clk_pin),
    .clock_out(clock),
    .reset(rst_pin)
);
 
endmodule
