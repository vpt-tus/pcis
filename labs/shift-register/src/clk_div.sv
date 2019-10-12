// SCALE - pulses per half-period
module clk_div #(parameter SCALE = 2)(
	input clock_in,
	input reset,
	output logic clock_out
	);

	localparam N = $clog2(2*SCALE-1);
	logic [N-1:0] count;

	always_ff @ (posedge clock_in, posedge reset)
		if (reset) begin
			count <= '0;
			clock_out <= '0;
		end
		else if (count == SCALE-1) begin
			count <= '0;
			clock_out <= ~clock_out;
		end
		else begin
			count <= count + 1;
			clock_out <= clock_out;
		end

endmodule