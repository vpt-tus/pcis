module single_shot_test;

  logic clock, reset, sig;
  logic tick;

  single_shot uut (.*);

  parameter T=10;

  initial begin
    clock = 0;
    forever #(T/2) clock = ~clock;
  end

  initial begin
    sig = 0;
    reset = 1;
    #T reset = 0;

    #T sig = 1;
    #(3*T) sig = 0;

    #(5*T) sig = 1;
    #(5*T) sig = 0;
    
    #(5*T) $finish();
  end;
  
  // check FSM state after reset
  property after_reset_state_is_idle;
    @(posedge clock) reset |=> (uut.state == uut.IDLE) and ~tick;
  endproperty
  ap_after_reset_state_is_idle: assert property(after_reset_state_is_idle);

  // check FSM state transition IDLE -> EDGE
  property after_sig_goes_up_the_state_is_EDGE;
    disable iff (reset)
    @(posedge clock) ~sig ##1 sig |=> uut.state == uut.EDGE;
  endproperty;
  ap_after_sig_goes_up_the_state_is_EDGE: assert property(after_sig_goes_up_the_state_is_EDGE);

  // check FSM state transition EDGE -> WAIT_ZERO
  ap_state_edge_duration_is_one_cycle: assert property(
    @(posedge clock) uut.state == uut.EDGE |-> ##1 uut.state == uut.WAIT_ZERO);


  // check FSM state transition WAIT_ZERO -> IDLE
  property after_sig_goes_down_the_state_is_IDLE;
    @(posedge clock) sig ##1 ~sig |-> uut.state == uut.WAIT_ZERO ##1 uut.state == uut.IDLE;
  endproperty;
  ap_after_sig_goes_down_the_state_is_IDLE: assert property(after_sig_goes_down_the_state_is_IDLE);

  // check that 0 -> 1 on 'sig' leads to pulse on 'tick'
  sequence sig_rise;
    ~sig ##1 sig;
  endsequence;
  
  sequence one_period_pulse_on_tick;
    ~tick ##1 tick ##1 ~tick;
  endsequence;
  
  property sig_rise_causes_pulse_on_tick;
    @(posedge clock) sig_rise |-> one_period_pulse_on_tick;
  endproperty

  ap_sig_rise_causes_pulse_on_tick: assert property(sig_rise_causes_pulse_on_tick);

  // initial $monitor("sig=%b state=%s", sig, uut.state.name);
endmodule