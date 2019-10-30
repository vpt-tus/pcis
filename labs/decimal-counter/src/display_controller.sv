  module display_controller(
    input clock, reset,
    input [3:0][3:0] din,
    output logic [3:0] an,
    output logic [3:0] dout);

  logic [1:0] addr;

  always_ff @(posedge clock or posedge reset)
    if(reset) addr <= '0;
    else addr <= addr + 1;

  assign dout = din[addr];

  always_comb
    case (addr)
      0 : an = 'b0111;
      1 : an = 'b1011;
      2 : an = 'b1101;
      3 : an = 'b1110;
    endcase

endmodule