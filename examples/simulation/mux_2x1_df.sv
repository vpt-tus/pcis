module mux_2x1_df(
	output Y,
	input A, B, select
	);

	assign Y = select ? A : B;

endmodule