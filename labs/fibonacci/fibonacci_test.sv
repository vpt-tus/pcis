`timescale 10ns / 1ns

module fibonacci_test;

	localparam N = 16;

	logic clk = 0;
	logic reset;
	logic [N-1:0] fn;

	fibonacci #(.N(N)) uut(.*);

	initial forever #50 clk = ~clk;
	initial $display("Max number: %d",uut.MAX_NUMBER);
	initial begin
		reset = 1;
		#100 reset = 0;
	end

	always @ (posedge(clk)) begin
		$display("fn=%d", fn);
		if(uut.stop_r) $finish;
	end
endmodule
