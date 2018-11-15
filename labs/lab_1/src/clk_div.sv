module clk_div #(parameter DIVIDE_BY = 2)(
	input clock_in,
	input reset,
	output logic clock_out
);
 
	integer counter;
	const integer max_count = DIVIDE_BY / 2 - 1;
	
	always_ff @ (posedge clock_in, posedge reset) begin
		if (reset) begin
			counter <= 0;
			clock_out <= 0;
		end
		else if (counter == max_count) begin
			counter <= 0;
			clock_out <= ~clock_out;
		end
		else begin
			counter <= counter + 1;
			clock_out <= clock_out;
		end
	end
 
endmodule
