module top(
  input clk_100,
  input reset,
  output logic [3:0] an,
  output logic [6:0] seg);

  logic clock;
  logic[3:0][3:0] digits;

  decimal_counter u1 (.*, .clock(clock_10Hz));
  
  clk_div #(.SCALE(50000)) u2(
  .clock_in(clk_100),
  .clock_out(clock_500Hz),
  .reset(reset));

  clk_div #(.SCALE(25)) u3(
  .clock_in(clock_500Hz),
  .clock_out(clock_10Hz),
  .reset(reset));

  display_controller u4(
    .clock(clock_500Hz),
    .reset(reset),
    .din(digits),
    .dout(one_digit),
    .an(an));

  decoder_7seg u5(
    .digit(one_digit),
    .segments(seg));
endmodule
