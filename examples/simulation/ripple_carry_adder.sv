`timescale 10ns / 1ns

module full_adder (
	input a, b, cin,
	output s, cout
);
	assign s = a ^ b ^ cin;
	assign cout = (a & b) | (cin & a) | (cin & b);
endmodule

module ripple_carry_adder #(parameter N = 4) (
	input carry_in,
	input [N-1:0] op1, op2,
	output logic [N-1:0] sum,
	output logic carry_out
);
	logic [N:0] carry;

	assign carry[0] = carry_in;
	assign carry_out = carry[N];

	for(genvar i=0; i<N; i++) begin
		full_adder fa (.a(op1[i]), .b(op2[i]),.cin(carry[i]),.s(sum[i]),.cout(carry[i+1]));
	end
endmodule

module ripple_carry_adder_5bit (
	input carry_in,
	input [4:0] op1, op2,
	output logic [4:0] sum,
	output logic carry_out
);
	ripple_carry_adder #(.N(5)) uut (.*);
endmodule

module ripple_carry_adder_test_1;

	localparam OP_WIDTH = 7;

	logic carry_in, carry_out;
	logic [OP_WIDTH-1:0] op1, op2, sum;

	ripple_carry_adder #(.N(OP_WIDTH)) uut (.*);

	initial begin
		for(int c = 0; c <= 1; c++) begin
			carry_in = c;
			for(int i = 0; i < 2**OP_WIDTH; i++) begin
				for(int j = 0; j < 2**OP_WIDTH; j++) begin
					op1 = i;
					op2 = j;
					#10 assert ({carry_out,sum} == i+j+carry_in)
					else $warning("expected sum=%d, actual sum=%d (%d + %d + %b)",i+j+carry_in, sum, op1, op2, carry_in);
				end;
			end;
		end;

		$finish;
	end

	initial begin
		$monitor("%t %b+%d+%d=%d",$time, carry_in, op1, op2, {carry_out, sum});
		$dumpfile("dump.vcd");
		$dumpvars;
	end

endmodule
