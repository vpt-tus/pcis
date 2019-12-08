module fibonacci #(parameter N=13) (
	input clk, reset,
	output logic [N-1:0] fn
);
	localparam STOP = 0, RUN = 1;
	localparam MAX_NUMBER = 2**N-1;
	
	logic [N:0] fn_plus_1, fn_plus_2;
	logic overflow, mode;

	assign fn_plus_2 = fn + fn_plus_1;
	assign overflow = fn_plus_2 > MAX_NUMBER;

	always @(posedge clk or posedge reset)
		if(reset) begin
			fn_plus_1 <= 1;
			fn <= 0;
		end
		else if (mode == RUN) begin
			fn_plus_1 <= fn_plus_2;
			fn <= fn_plus_1;
		end

	always @(posedge clk or posedge reset)
		if(reset) 
			mode <= RUN;
		else if (overflow) 
			mode <= STOP;
endmodule