module sync(
	input din, reset, clk, 
	output dout
	);

	logic [1:0] tmp;

	always_ff @ (posedge clk, posedge reset)
		if(reset) 
			tmp <= '0;
		else 
			tmp <= {tmp[0], din};

	assign dout = ~tmp[1] & tmp[0];

endmodule