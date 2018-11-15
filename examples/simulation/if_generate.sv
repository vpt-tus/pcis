module multiplier #(parameter a_width = 8, b_width = 8) (
	input [a_width-1:0] a;
	input [b_width-1:0] b;
	output [a_width+b_width-1:0] product
);

generate
	if((a_width < 8) || (b_width < 8)) begin: mult
		foo #(a_width,b_width) u1(a, b, product);
	end
	else begin: mult
		bar #(a_width,b_width) u1(a, b, product);
	end
endgenerate
endmodule

module foo #(parameter a_width = 8, b_width = 8) (
	input [a_width-1:0] a;
	input [b_width-1:0] b;
	output [a_width+b_width-1:0] product
);
	product = a * b;
endmodule

module bar #(parameter a_width = 8, b_width = 8) (
	input [a_width-1:0] a;
	input [b_width-1:0] b;
	output [a_width+b_width-1:0] product
);
	product = a * (-b);
endmodule

module top (
	input [3:0] a;
	input [3:0] b;
	output [5:0] product
);
	multiplier #(4,4) m1 (.*);
endmodule