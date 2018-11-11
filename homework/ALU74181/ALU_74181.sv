`timescale 10ns / 1ns

module ALU_74181(
	input [3:0] A,	// Operand inputs
	input [3:0] B,	// Operand inputs
	input [3:0] S,	// Function selection inputs
	input M, Cn,	// Mode control
	output logic [3:0] F	// Function outputs
	);

always_comb
	// TODO

endmodule


module ALU_74181_test;
	logic [3:0] A, B, S, F;
	logic M, Cn;

	ALU_74181 uut (.*);

	task test_vector (input [3:0] arg1, arg2, expected);
		A = arg1;
		B = arg2;
		#10 assert (expected == F) 
		else $warning("expected F=%b, actual F=%b, (A=%b B=%b)",expected, F, A, B);
	endtask

	initial begin
		$display("%0t %s", $time, "F = not A");
		M = 1; Cn = 1; S = 0;
		A = 0; #10 assert (F == 4'b1111) else $warning("A=%b B=%b F=%b",A,B,F);
		A = 1; #10 assert (F == 4'b1110) else $warning("A=%b B=%b F=%b",A,B,F);
		A = 2; #10 assert (F == 4'b1101) else $warning("A=%b B=%b F=%b",A,B,F);
		A = 10; #10 assert (F == 4'b0101) else $warning("A=%b B=%b F=%b",A,B,F);
		A = 15; #10 assert (F == 4'b0000) else $warning("A=%b B=%b F=%b",A,B,F);

		$display("%0t %s", $time, "F = A");
		M = 0; Cn = 1; S = 0;
		test_vector(0, 0, 0);
		test_vector(1, 0, 1);
		test_vector(7, 0, 7);
		test_vector(10, 0, 10);
		test_vector(15, 0, 15);

		$display("%0t %s", $time, "F = A or B");
		M = 0; Cn = 1; S = 1;
		test_vector(0, 0, 0);
		test_vector(0, 1, 1);
		test_vector(1, 0, 1);
		test_vector(1, 1, 1);
		test_vector(4'b0101, 4'b1010, 4'b1111);
		test_vector(4'b1111, 4'b1111, 4'b1111);

		$display("%0t %s", $time, "F = !A or !B");
		M = 1; Cn = 1; S = 1;
		test_vector(0, 0, 4'b1111);
		test_vector(1, 1, 4'b1110);
		test_vector(1, 0, 4'b1111);
		test_vector(0, 1, 4'b1111);
		test_vector(15, 15, 0);

		$display("%0t %s", $time, "F = A or !B");
		M = 0; Cn = 1; S = 2;
		test_vector(0, 0, 4'b1111);
		test_vector(1, 1, 4'b1111);
		test_vector(1, 0, 4'b1111);
		test_vector(0, 1, 4'b1110);
		test_vector(15, 15, 15);
		test_vector(0, 15, 0);

		$display("%0t %s", $time, "F = !A and B");
		M = 1; Cn = 1; S = 2;
		test_vector(0, 0, 0);
		test_vector(1, 1, 0);
		test_vector(1, 0, 0);
		test_vector(0, 1, 4'b0001);
		test_vector(15, 15, 0);
		test_vector(0, 15, 15);

		$display("%0t %s", $time, "F = -1");
		M = 0; Cn = 1; S = 3;
		test_vector(0, 0, -1);
		test_vector(1, 1, -1);
		test_vector(1, 0, -1);
		test_vector(0, 1, -1);
		test_vector(15, 15, -1);
		test_vector(0, 15, -1);

		$display("%0t %s", $time, "F = 0");
		M = 1; Cn = 1; S = 3;
		test_vector(0, 0, 0);
		test_vector(1, 1, 0);
		test_vector(1, 0, 0);
		test_vector(0, 1, 0);
		test_vector(15, 15, 0);
		test_vector(0, 15, 0);

		$display("%0t %s", $time, "F = A + (A and !B)");
		M = 0; Cn = 1; S = 4;
		test_vector(0, 0, 0);
		test_vector(1, 1, 1);
		test_vector(1, 0, 2);
		test_vector(0, 1, 0);
		test_vector(4'b0100, 4'b0011, 4'b1000);
		test_vector(4'b0000, 4'b1111, 4'b0000);
		test_vector(4'b1111, 4'b1111, 4'b1111);

		$display("%0t %s", $time, "F = !(A and B)");
		M = 1; Cn = 1; S = 4;
		test_vector(0, 0, 15);
		test_vector(1, 1, 14);
		test_vector(1, 0, 15);
		test_vector(0, 1, 15);
		test_vector(4'b0100, 4'b0011, 4'b1111);
		test_vector(4'b0100, 4'b1100, 4'b1011);
		test_vector(4'b0000, 4'b1111, 4'b1111);
		test_vector(4'b1111, 4'b1111, 4'b0000);
		$finish;
	end
endmodule