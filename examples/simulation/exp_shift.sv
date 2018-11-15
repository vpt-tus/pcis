`timescale 1ns / 1ps

module exp_shift_test_1;

	logic [3:0] din, dout;
	logic [2:0] a;

	exp_shift uut(.*);

	initial $monitor($time," din=",din," dout=",dout);
	initial #300 $finish;
	initial begin
		din = 8'b00000001;
		a = 3'b110;
	end
endmodule

module exp_shift(
	input [3:0] din,
	input [2:0] a,
	output [3:0] dout
	);

	assign dout = (din << 3);
endmodule