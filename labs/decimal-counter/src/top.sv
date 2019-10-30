module top(
  input clk_100,
  input reset,
  input btnU,
  output logic an[3:0],
  output logic seg[6:0]);

  logic rest, clock;
  logic [3:0][3:0] digits;
  assign reset = btnU;

  decimal_counter u1 (.*, .clock(clock_500Hz));
  
  clk_div #(.SCALE(50000)) u2(
  .clock_in(clk_100),
  .clock_out(clock_500Hz),
  .reset(reset));

  clk_div #(.SCALE(25)) u3(
  .clock_in(clock_500Hz),
  .clock_out(clock_10Hz),
  .reset(reset);

  display_controller u4(
    .clock(clock_500Hz),
    .reset(reset),
    .din(digits),
    .dout(one_digit));

  decoder_7seg u5(
    .digit(one_digit),
    .segments(seg));
endmodule
