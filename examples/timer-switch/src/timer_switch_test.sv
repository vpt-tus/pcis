module timer_switch_test;
  localparam T = 10;

  logic clock = 0;
  logic reset, btn, light;

  timer_switch uut(.clock_1Hz(clock), .*);

  always #(T/2) clock = ~clock;

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

  // Check state after reset
  assert property(@(posedge clock) reset |-> uut.state == uut.OFF and ~light);
  
  // Pressing the button turns on the lights
  assert property(@(posedge clock) $rose(btn) |=> light);

  // Check ON duration
  property light_is_on_for_at_least_20cycles;
    @(posedge clock) $rose(btn) |=> light [*20];
  endproperty;
  assert property (light_is_on_for_at_least_20cycles);
  
   
  // Check ON duration - alternative
  property light_remains_on_exactly_20cycles_after_the_last_btn_rise;
    @(posedge clock) disable iff (reset) $fell(light) |-> $past(btn, 21);
  endproperty;
  assert property (light_remains_on_exactly_20cycles_after_the_last_btn_rise);

endmodule