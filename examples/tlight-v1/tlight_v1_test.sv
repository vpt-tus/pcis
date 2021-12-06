import tlight_package::*;

module tlight_v1_test;
  localparam TCLOCK = 10;

  logic clock = 0;
  logic reset;
  tlight_control_t ns, we;

  tlight_v1 uut(.*);

  always #(TCLOCK/2) clock = ~clock;

  initial begin
    reset = 1;
    #3 reset = 0;
    #(50*TCLOCK) $finish;
  end

  // Check the initial state
  ap_reset: assert property
    (@(posedge clock) $fell(reset) |-> uut.state == uut.S1);
  //
  // Check state duration and next state transition
  //
  ap_check_S2_duration: assert property
    (@(posedge clock) uut.state == uut.S1 ##1 uut.state == uut.S2 |=> uut.state==uut.S2 [*T_RED] ##1 uut.state==uut.S3);

  ap_check_S3_duration: assert property
    (@(posedge clock) uut.state == uut.S2 ##1 uut.state == uut.S3 |=> uut.state==uut.S3 [*T_YELLOW] ##1 uut.state==uut.S4);

  ap_check_S4_duration: assert property
    (@(posedge clock) uut.state == uut.S3 ##1 uut.state == uut.S4 |=> uut.state==uut.S4 [*T_RED] ##1 uut.state==uut.S1);

  ap_check_S1_duration: assert property
    (@(posedge clock) uut.state == uut.S4 ##1 uut.state == uut.S1 |=> uut.state==uut.S1 [*T_YELLOW] ##1 uut.state==uut.S2);
  //
  // Verify state -> lights relations
  //
  ap_check_lights_S1: assert property
    (@(posedge clock) uut.state==uut.S1 |-> ns==YELLOW and we==YELLOW);

  ap_check_lights_S2: assert property
    (@(posedge clock) uut.state==uut.S2 |-> ns==RED and we==GREEN);

  ap_check_lights_S3: assert property
    (@(posedge clock) uut.state==uut.S3 |-> ns==YELLOW and we==YELLOW);

  ap_check_lights_S4: assert property
    (@(posedge clock) uut.state==uut.S4 |-> ns==GREEN and we==RED);

  initial begin
    $display("%20s%6s%7s%7s","STATE","TIMER","WE","NS");
    $monitor("%20s%6d%7s%7s", uut.state.name, uut.timer, ns.name, we.name);
  end
endmodule
