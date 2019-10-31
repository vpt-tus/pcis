  module decoder_7seg(
    input [3:0] digit,
    output logic [6:0] segments);

  // segment encoding
  //      0
  //     ---
  //  5 |   | 1
  //     ---   <- 6
  //  4 |   | 2
  //     ---
  //      3
  always_comb
    case (digit)
      0 : segments = 7'b1000000;
      1 : segments = 7'b1111001;
      2 : segments = 7'b0100100;
      3 : segments = 7'b0110000;
      4 : segments = 7'b0011001;
      5 : segments = 7'b0010010;
      6 : segments = 7'b0000010;
      7 : segments = 7'b1111000;
      8 : segments = 7'b0000000;
      9 : segments = 7'b0010000;
      'hA : segments = 7'b0001000;
      'hB : segments = 7'b0000011;
      'hC : segments = 7'b1000110;
      'hD : segments = 7'b0100001;
      'hE : segments = 7'b0000110;
      'hF : segments = 7'b0001110;
      default : segments = 7'b1111111;
    endcase

endmodule
