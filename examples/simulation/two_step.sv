`timescale 10ns / 1ns

module two_step;
	parameter T = 100;
	logic a = 0;
	logic b = 1;
	logic clk = 0;

	always clk = #5 ~clk;

	always @ (posedge clk) begin
		a <= b; 
		b <= a;
	end

	initial $monitor("%t %b %b",$time,a,b);
	initial #50 $finish;
endmodule