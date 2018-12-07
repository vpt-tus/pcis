module disp_ctrl #(parameter D=4)(
	input clk,
	input reset,
	input [D-1:0][3:0] digits,
	output logic [D-1:0] an,
	output logic [6:0] seg
	);
	localparam ADDR_SIZE = $clog2(D);
	logic [ADDR_SIZE-1:0] addr;
	logic [3:0] active_digit;

	always_ff @(posedge clk, posedge reset) 
		if(reset)
			addr = 3;
		else
			addr = addr - 1;

	assign active_digit = digits[addr];

	always_comb
		case (addr)
			3 : an = 'b0111;
			2 : an = 'b1011;
			1 : an = 'b1101;
			0 : an = 'b1110;
		endcase

	// segment encoding
	//      0
	//     ---  
	//  5 |   | 1
	//     ---   <- 6
	//  4 |   | 2
	//     ---
	//      3	
	always_comb
		case (active_digit)
			0 : seg = 7'b1000000;
			1 : seg = 7'b1111001;
			2 : seg = 7'b0100100;
			3 : seg = 7'b0110000;
			4 : seg = 7'b0011001;
			5 : seg = 7'b0010010;
			6 : seg = 7'b0000010;
			7 : seg = 7'b1111000;
			8 : seg = 7'b0000000;
			9 : seg = 7'b0010000;
			'hA : seg = 7'b0001000;
			'hB : seg = 7'b0000011;
			'hC : seg = 7'b1000110;
			'hD : seg = 7'b0100001;
			'hE : seg = 7'b0000110;
			'hF : seg = 7'b0001110;
			default : seg = 7'b1111111;
		endcase
endmodule