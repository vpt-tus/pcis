module timer_switch_top(
  input clock_1Hz, reset, btn_ext,
  output logic light);

single_shot u1 (.clock(clock_1Hz),.reset(reset),.sig(btn_ext),.tick(btn));
  timer_switch u2 (.*);

endmodule