module top_1digit(
  input clk_100,
  input reset,
  input btnU,
  output logic [3:0] an,
  output logic [6:0] seg,
  output logic dp,
  output logic [3:0] led);

  logic [3:0] digit;
  logic carry_out;

  assign led = digit;
  assign dp = ~carry_out;

  decimal_counter_1digit u1 (
    .carry_in(~btnU),
    .carry_out(carry_out),
    .clock(clock_1Hz),
    .digit(digit),
    .reset(reset));
  
  clk_div #(.SCALE(100_000)) u2(
    .clock_in(clk_100),
    .clock_out(clock_500Hz),
    .reset(reset));

  clk_div #(.SCALE(250)) u3(
    .clock_in(clock_500Hz),
    .clock_out(clock_1Hz),
    .reset(reset));

  disp_ctrl #(.D(1)) u4(
    .clock(clock_500Hz),
    .reset(reset),
    .digits({3'h0,digit}),
    .seg(seg),
    .an(an[1:0]));

  assign an[3:1] = 3'b111;

endmodule
