module adder4(
	output logic [3:0] Sum,
	output logic C_out,
	input [3:0] A, B,
	input C_in);

	assign {C_out, Sum} = A + B + C_in;

endmodule

module adder4_test;
	logic [3:0] Sum, A, B;
	logic C_in, C_out;

	adder4 uut (.*);

	initial begin
		$display("A B C_in C_out Sum");
		$monitor("  %b      %b     %b   -> %b %b", A, B, C_in, C_out, Sum);
		A = 0; B = 0; C_in = 0;
		#10;
		A = 2; B = 2; C_in = 1;
		#10;
		A = 15; B = 15; C_in = 0;
		#10;
		A = 15; B = 15; C_in = 1;
		#10;
		$finish;
	end
endmodule
