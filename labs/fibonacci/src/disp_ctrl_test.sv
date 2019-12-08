`timescale 1ns / 1ps

module disp_ctrl_test;

	logic clk, reset;
	logic [15:0] fn;

	logic [3:0] an;
	logic [6:0] seg;

	disp_ctrl uut(.digits(fn),.*);

	initial begin
		clk = 0;
		forever #50 clk = ~clk;
	end

	initial begin
		fn = {4'h7, 4'h8, 4'h9, 4'ha};
		reset = 1;
		#100 reset = 0;
		
		#800 $finish;   
	end

	always @ (seg) $display("digits[%0d]=%h an=%b seg=%b", uut.addr, uut.digits[uut.addr], an, seg);
endmodule

