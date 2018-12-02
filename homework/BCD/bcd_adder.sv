`timescale 10ns / 1ns

typedef logic [3:0] bcd_t;

module bcd_adder(
	input bcd_t a,b,
	input cin,
	output bcd_t s,
	output logic cout
);

	// TODO
	
endmodule

module bcd_adder_test;
	bcd_t a, b, s;
	logic cin, cout;

	bcd_adder uut(.*);

	task test_vector (
		input bcd_t a_test, b_test,
		input cin_test,
		input cout_expected,
		input bcd_t s_expected);

		a = a_test;
		b = b_test;
		cin = cin_test;

		#10 assert ((s_expected == s) && (cout_expected == cout))
		else $warning("%0d + %0d + %0d = expected %0d%0d but was %0d%0d",a_test, b_test, cin_test, cout_expected, s_expected,cout,s);
	endtask

	initial begin
		test_vector(0,0,0,0,0);
		test_vector(0,0,1,0,1);
		test_vector(0,1,0,0,1);
		test_vector(1,0,0,0,1);

		test_vector(1,1,0,0,2);
		test_vector(2,2,0,0,4);
		test_vector(2,3,0,0,5);
		test_vector(3,2,0,0,5);

		test_vector(1,1,1,0,3);
		test_vector(2,2,1,0,5);
		test_vector(2,3,1,0,6);
		test_vector(3,2,1,0,6);

		test_vector(5,5,0,1,0);
		test_vector(5,5,1,1,1);

		test_vector(7,8,0,1,5);
		test_vector(8,7,1,1,6);

		test_vector(9,8,0,1,7);
		test_vector(9,9,0,1,8);
		test_vector(9,9,1,1,9);
		$finish; 
	end

	initial $monitor("%0d + %0d + %0d = %0d%0d",a, b, cin, cout, s);
endmodule