
module lab1a #(parameter WIDTH = 8) (
	input clock, reset,
	output logic [WIDTH-1:0] sr
);

	always_ff @(posedge clock, posedge reset) 
		if(reset) 
			sr <= 0;
		else 
			sr <= {sr[WIDTH-2:0], ~sr[WIDTH-1]};

endmodule

module lab1b #(parameter WIDTH = 8) (
	input clock, reset,
	output logic [WIDTH-1:0] sr
);

	//TODO

endmodule

module lab1c #(parameter WIDTH = 8) (
	input clock, reset,
	output logic [WIDTH-1:0] sr
);

	// TODO

endmodule
