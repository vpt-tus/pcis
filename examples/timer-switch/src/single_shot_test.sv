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
  
  assert property(@(posedge clock) reset |=> (uut.state == uut.IDLE) and ~tick);
  
  // the next two assertions a re equivalent
  assert property(@(posedge clock) uut.state == uut.EDGE |-> ##1 uut.state == uut.WAIT_ZERO);
  assert property(@(posedge clock) uut.state == uut.EDGE |=> uut.state == uut.WAIT_ZERO);

  assert property(@(posedge clock) sig ##1 ~sig |-> uut.state == uut.WAIT_ZERO ##1 uut.state == uut.IDLE);

  sequence sig_rise;
    ~sig ##1 sig;
  endsequence;
  sequence one_period_pulse_on_tick;
    ~tick ##1 tick ##1 ~tick;
  endsequence;
  assert property(@(posedge clock) sig_rise |-> one_period_pulse_on_tick);

  // initial $monitor("%b %b %b", clock, sig, tick);
endmodule