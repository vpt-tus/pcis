`timescale 10ns / 1ns

typedef bcd [2:0] bcd3;

module bcd_adder_3d(
	input bcd3 op1, op2,
	input cin,
	output bcd3 sum,
	output logic cout
	);

	logic carry_01, carry_12;

	bcd_adder u1(.a(op1[0]), .b(op2[0]), .cin(cin), .s(sum[0]), .cout(carry_01));
	bcd_adder u2( --- TODO --- );
	bcd_adder u3( --- TODO --- );

endmodule

module bcd_adder_3d_test;
	bcd3 op1, op2, sum;
	logic cin, cout;

	bcd_adder_3d uut(.*);

	task test_vector (
		input bcd3 op1_test, op2_test,
		input cin_test,
		input cout_expected,
		input bcd3 sum_expected);

		op1 = op1_test;
		op2 = op2_test;
		cin = cin_test;

		#10 assert ((sum_expected == sum) && (cout_expected == cout));
	endtask

	initial begin
		test_vector(12'b0,12'b0,0,0,12'b0);
		
		test_vector(12'b0000_0000_0010, 12'b0000_0000_0010, 0, 0, 12'b0000_0000_0100);

		test_vector(
			{4'd9,4'd9,4'd9},	// op1_test
			{4'd0,4'd0,4'd1},	// op2_test
			0,					// cin_test
			1,					// cout_expected
			{4'd0,4'd0,4'd0});	// sum_expected

		test_vector(
			{bcd'(9),bcd'(9),bcd'(9)}, 
			{bcd'(0),bcd'(0),bcd'(2)}, 
			0, 
			1, 
			{bcd'(0),bcd'(0),bcd'(1)});
		
		test_vector(
			.op1_test({bcd'(9),bcd'(9),bcd'(9)}), 
			.op2_test({bcd'(9),bcd'(9),bcd'(9)}), 
			.cin_test(1), 
			.cout_expected(1), 
			.sum_expected({bcd'(9),bcd'(9),bcd'(9)}));

		$finish; 
	end

	initial $monitor("%0d%0d%0d + %0d%0d%0d + %b = %0b%0d%0d%0d",op1[2], op1[1], op1[0], op2[2], op2[1], op2[0], cin, cout, sum[2],sum[1],sum[0]);
endmodule