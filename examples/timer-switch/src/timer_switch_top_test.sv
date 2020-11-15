module timer_switch_top_test;
  localparam T = 10;

  logic clock_1Hz = 0;
  logic reset, btn_ext, light;

  timer_switch_top uut(.*);

  always #(T/2) clock_1Hz = ~clock_1Hz;

  initial begin
    btn_ext = 0;
    reset = 0;

    #T reset = 1;
    #T reset = 0;

    #T btn_ext = 1;
    #(4*T) btn_ext = 0;

    #(30*T) btn_ext = 1;
    #(5*T) btn_ext = 0;

    #(10*T) btn_ext = 1;
    #(3*T) btn_ext = 0;

    #(30*T) $finish;
  end

  // Check the initial state
  assert property(@(posedge clock_1Hz) reset |-> ~light);

  // Check that:
  // * pressing the button turns on the light
  // * the light stays on for at least 20 seconds
  assert property(@(posedge clock_1Hz) ~btn_ext ##1 btn_ext |=> light [*20]);
  // equivalent to the previous property
  assert property(@(posedge clock_1Hz) $rose(btn_ext) |=> light [*20]);
endmodule