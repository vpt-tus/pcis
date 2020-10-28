module tilda_test;

	logic [7:0] foo = 42;
	logic [7:0] tilda_foo;
	logic [7:0] not_foo;
	logic baz = 0;	

	assign tilda_foo = ~foo;
	assign not_foo = !foo;

	always_comb
		if(tilda_foo)
			$display("foo=%b ~foo=%b is true",foo,~foo);
		else
			$display("foo=%b ~foo=%b is false",foo,~foo);

	always_comb
		if(not_foo)
			$display("foo=%b !foo=%b is true",foo,!foo);
		else
			$display("foo=%b !foo=%b is false",foo,!foo);
		
	initial begin
		#10 foo = 1;
		#10 foo = 255;
		#10 foo = 0;
		#10 foo = 3;
	end

endmodule