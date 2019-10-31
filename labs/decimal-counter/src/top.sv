module top(
  input clk_100,
  input reset,
  output logic [3:0] an,
  output logic [6:0] seg,
  output logic [15:0] led);

  logic clock_5Hz;
  logic clock_500Hz;
  logic[3:0][3:0] digits;

  assign led = digits;

  decimal_counter u1 (.*, .clock(clock_5Hz));
  
  clk_div #(.SCALE(100_000)) u2(
    .clock_in(clk_100),
    .clock_out(clock_500Hz),
    .reset(reset));

  clk_div #(.SCALE(50)) u3(
    .clock_in(clock_500Hz),
    .clock_out(clock_5Hz),
    .reset(reset));

  disp_ctrl #(.D(4))  u4(
    .clock(clock_500Hz),
    .reset(reset),
    .digits(digits),
    .seg(seg),
    .an(an));

endmodule
