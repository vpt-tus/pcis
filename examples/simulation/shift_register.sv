`timescale 10ns / 1ns

module shift_register  #(parameter N = 8) (
	input clock,
	input [2:0] mode,
	input [N-1:0] data_in,
	output logic [N-1:0] data_out
);

always_ff @(posedge clock)
	case(mode)
		3'b000: data_out <= 0; // clear
		3'b111: data_out <= data_in; // load
		3'b100: data_out <= data_out << 1; // shift left
		3'b001: data_out <= data_out >> 1; // shift right
		default: data_out <= data_out; // hold
	endcase
endmodule

module shift_register_test_1;

	localparam N = 6;
	localparam T = 10;
	logic clock = 0;
	logic [2:0] mode;
	logic [N-1:0] data_in, data_out;

	shift_register #(.N(N)) uut (.*);

	initial forever #(T/2) clock = ~clock;

	initial begin
		mode = 3'b000;
		data_in = 1;		
		#T mode = 3'b111; // load
		#T mode = 3'b100; // shift left
		#(4*T) mode = 3'b001; // shift right
		#(3*T) mode = 3'b101; // hold
		#(2*T) mode = 3'b000; // clear
		#(2*T) $finish;
	end

	initial begin
		$monitor("%t %b %b %b",$time, mode, data_in, data_out);
		$dumpfile("dump.vcd");
		$dumpvars;
	end

endmodule
