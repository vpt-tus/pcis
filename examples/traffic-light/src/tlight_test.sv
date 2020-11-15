import tlight_package::*;

module tlight_test;
  localparam T = 10;

  logic clock = 0;
  logic reset;
  tlight_control_t ns, we;

  tlight_v2 uut(.*);

  always #(T/2) clock = ~clock;

  initial begin
    reset = 1;
    #T reset = 0;
    #(100*T) $finish;
  end

  // Check the initial state
  property after_reset_state;
    @(posedge clock) $fell(reset) |-> uut.state == uut.RESET;
  endproperty;
  ap_after_reset_state: assert property(after_reset_state);

  // Check state durations
  property check_WE_READY_TO_GO_duration;
    @(posedge clock) uut.state == uut.RESET ##1 uut.state == uut.WE_READY_TO_GO |-> uut.state==uut.WE_READY_TO_GO [*3] ##1 uut.state==uut.WE_GO;
  endproperty;
  ap_check_WE_READY_TO_GO_duration: assert property(check_WE_READY_TO_GO_duration);

  property check_WE_READY_TO_GO_duration_alt;
    @(posedge clock) uut.state == uut.WE_READY_TO_GO ##1 uut.state == uut.WE_GO |-> $past(uut.state==uut.WE_READY_TO_GO,2);
  endproperty;
  ap_check_WE_READY_TO_GO_duration_alt: assert property(check_WE_READY_TO_GO_duration_alt);

  property check_WE_GO_duration;
    @(posedge clock) uut.state == uut.WE_READY_TO_GO ##1 uut.state == uut.WE_GO |-> uut.state==uut.WE_GO [*15] ##1 uut.state==uut.WE_PREPARE_TO_STOP;
  endproperty;
  ap_check_WE_GO_duration: assert property(check_WE_GO_duration);

  property check_WE_PREPARE_TO_STOP_duration;
    @(posedge clock) uut.state == uut.WE_GO ##1 uut.state == uut.WE_PREPARE_TO_STOP |-> uut.state==uut.WE_PREPARE_TO_STOP ##1 uut.state==uut.NS_READY_TO_GO;
  endproperty;
  ap_check_WE_PREPARE_TO_STOP_duration: assert property(check_WE_PREPARE_TO_STOP_duration);

  property check_NS_READY_TO_GO_duration;
    @(posedge clock) uut.state == uut.WE_PREPARE_TO_STOP ##1 uut.state == uut.NS_READY_TO_GO |-> uut.state==uut.NS_READY_TO_GO [*3] ##1 uut.state==uut.NS_GO; 
  endproperty;
  ap_check_NS_READY_TO_GO_duration: assert property(check_NS_READY_TO_GO_duration);

  property check_NS_GO_duration;
    @(posedge clock) uut.state == uut.NS_READY_TO_GO ##1 uut.state == uut.NS_GO |-> uut.state==uut.NS_GO [*15] ##1 uut.state==uut.NS_PREPARE_TO_STOP; 
  endproperty;
  ap_check_NS_GO_duration: assert property(check_NS_GO_duration);

  // Verify state -> lights relations
  ap_check_lights_RESET: assert property( @(posedge clock) uut.state==uut.RESET |-> ns==RED and we==RED);
  ap_check_lights_WE_READY_TO_GO: assert property( @(posedge clock) uut.state==uut.WE_READY_TO_GO |-> ns==RED and we==YELLOW);
  ap_check_lights_WE_GO: assert property( @(posedge clock) uut.state==uut.WE_GO |-> ns==RED and we==GREEN);
  ap_check_lights_WE_PREPARE_TO_STOP: assert property( @(posedge clock) uut.state==uut.WE_PREPARE_TO_STOP |-> ns==RED and we==YELLOW);
  ap_check_lights_NS_READY_TO_GO: assert property( @(posedge clock) uut.state==uut.NS_READY_TO_GO |-> ns==YELLOW and we==RED);
  ap_check_lights_NS_GO: assert property( @(posedge clock) uut.state==uut.NS_GO |-> ns==GREEN and we==RED);

  initial 
  begin
    $display("%20s%6s%7s%7s","STATE","TIMER","WE","NS");
    $monitor("%20s%6d%7s%7s", uut.state.name, uut.timer, ns.name, we.name);
  end
endmodule