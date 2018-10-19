`timescale 1ns / 1ps

module shift_register  #(parameter N = 8) (
	input clock,
	input reset_n,
	input load,
	input [N-1:0] data_in,
	output [N-1:0] data_out
);

var logic [N-1:0] data;

assign data_out = data;

always_ff @(posedge clock, negedge reset_n)
	if (~reset_n)
		data <= 0;
	else if (load)
		data <= data_in;
	else
		data <= data << 1;

endmodule

module shift_register_test_1;

	localparam N = 6;
	logic clock, reset_n, load;
	logic [N-1:0] data_in, data_out;

	shift_register #(.N(N)) uut (.*);

	initial begin
		clock = 0;
		forever #50 clock = ~clock;
	end

	initial begin
		reset_n = 0;
		data_in = 1;
		load = 0;
		#100 reset_n = 1;
		#20 load = 1;
		#100 load = 0;
		#5000 $finish;
	end

	initial begin
		$monitor("%b %b %b",reset_n, load, data_out);
		$dumpfile("dump.vcd");
		$dumpvars;
	end

endmodule
