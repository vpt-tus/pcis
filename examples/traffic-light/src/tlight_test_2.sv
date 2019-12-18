module tlight_test_2;
  logic clock, reset;
  logic [2:0] ns, we;

  tlight uut(.*);

  parameter T = 10;

  initial begin
    clock = 0;
    forever begin
      #(T/2) clock = ~clock;
    end
  end

  initial begin
    reset = 1;
    #T reset = 0;
    #(50*T) $finish;
  end

  property after_reset_state;
    @(posedge clock) $fell(reset) |-> uut.state == uut.RESET;
  endproperty;
  ap_after_reset_state: assert property(after_reset_state);

  property check_WE_READY_TO_GO_duration;
    @(posedge clock) uut.state == uut.RESET ##1 uut.state == uut.WE_READY_TO_GO |-> uut.state==uut.WE_READY_TO_GO [*3] ##1 uut.state==uut.WE_GO;
  endproperty;
  property check_WE_READY_TO_GO_duration_alt;
    @(posedge clock) uut.state == uut.WE_READY_TO_GO ##1 uut.state == uut.WE_GO |-> $past(uut.state==uut.WE_READY_TO_GO,2);
  endproperty;
  ap_check_WE_READY_TO_GO_duration: assert property(check_WE_READY_TO_GO_duration);
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

  ap_check_lights_RESET: assert property( @(posedge clock) uut.state==uut.RESET |-> ns==uut.RED and we==uut.RED);
  ap_check_lights_WE_READY_TO_GO: assert property( @(posedge clock) uut.state==uut.WE_READY_TO_GO |-> ns==uut.RED and we==uut.YELLOW);
  ap_check_lights_WE_GO: assert property( @(posedge clock) uut.state==uut.WE_GO |-> ns==uut.RED and we==uut.GREEN);
  ap_check_lights_WE_PREPARE_TO_STOP: assert property( @(posedge clock) uut.state==uut.WE_PREPARE_TO_STOP |-> ns==uut.RED and we==uut.YELLOW);
  ap_check_lights_NS_READY_TO_GO: assert property( @(posedge clock) uut.state==uut.NS_READY_TO_GO |-> ns==uut.YELLOW and we==uut.RED);
  ap_check_lights_NS_GO: assert property( @(posedge clock) uut.state==uut.NS_GO |-> ns==uut.GREEN and we==uut.RED);

  // initial $monitor("%s %b", uut.state.name, clock);
endmodule