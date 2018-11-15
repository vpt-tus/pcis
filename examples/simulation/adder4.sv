module adder_4b(
	output [3:0] Sum,
	output C_out,
	input [3:0] A, B,
	input C_in
	);

	logic carry_out, carry_in;
	logic [3:0] sum_out, ina, inb;
	assign {carry_out, sum_out} = ina + inb + carry_in;

	assign {C_out, Sum} = A + B + C_in;

endmodule


