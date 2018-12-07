module fibonacci #(parameter N=16) (
	input clk, reset,
	output logic [N-1:0] fn
);

	logic [N:0] fn_plus_1, fn_plus_2;
	logic stop, stop_r;

	assign fn_plus_2 = fn + fn_plus_1;
	assign stop = fn_plus_2 > 2**N-1;

	always @(posedge clk or posedge reset)
		if(reset) begin
			fn_plus_1 <= 1;
			fn <= 0;
		end
		else if (~stop_r) begin
			fn_plus_1 <= fn_plus_2;
			fn <= fn_plus_1;
		end

	always @(posedge clk or posedge reset)
		if(reset) 
			stop_r <= 0;
		else if (stop) 
			stop_r <= stop;
endmodule