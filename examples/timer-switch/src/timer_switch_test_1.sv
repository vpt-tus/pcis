module timer_switch_test_1;
  logic clock, reset, btn;
  logic light;

  timer_switch uut(.clock_1Hz(clock), .*);

  parameter T = 10;

  initial begin
    clock = 0;
    forever begin
      #(T/2) clock = ~clock;
    end
  end

  // Test with concurrent assertions
  initial begin
    btn = 0;
    reset = 1;
    #T reset = 0;

    #T btn = 1;
    #T btn = 0;

    #(25*T) btn = 1;
    #T btn = 0;

    #(10*T) btn = 1;
    #(T) btn = 0;
    
    #(30*T) $finish();
  end

  assert property(@(posedge clock) reset |-> uut.state == uut.OFF and ~light);
  
  property light_is_on_for_at_least_20cycles;
    @(posedge clock) ~btn ##1 btn |=> light [*20];
  endproperty;
  
  property light_remains_on_exactly_20cycles_after_the_last_btn_rise;
    @(posedge clock) disable iff (reset) $fell(light) |-> $past(btn, 21);
  endproperty;
  
  assert property (light_is_on_for_at_least_20cycles);
  assert property (light_remains_on_exactly_20cycles_after_the_last_btn_rise);
endmodule