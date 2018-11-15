`timescale 10ns / 1ns

module gray2bin #(parameter SIZE = 8)(
	output [SIZE-1:0] bin,
	input [SIZE-1:0] gray
);
	for (genvar i=0; i<SIZE; i=i+1)
		assign bin[i] = ^gray[SIZE-1:i];

endmodule

module gray2bin_5bit (
	output [4:0] bin,
	input [4:0] gray
);
	gray2bin #(.SIZE(5)) uut (.*);

endmodule

module gray2bin_test_1;
	localparam DELAY=1;

	logic [4:0] bin, gray;

	gray2bin_5bit uut (.*);

	initial begin
		gray = 5'b00000;
		#DELAY gray = 5'b00001;
		#DELAY gray = 5'b10000;
		#DELAY gray = 5'b11111;

		$finish;
	end

	initial $monitor("%b %b",gray, bin);
endmodule