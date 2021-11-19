module timer_light_test;
  localparam CLOCK_T = 2;
  localparam ON_PERIOD = 30;

  logic clock = 0;
  logic reset, push_btn, light;

  timer_light #(.T(ON_PERIOD-1)) uut(.*);

  always #(CLOCK_T/2) clock = ~clock;

  initial begin
    push_btn = 0;
    reset = 1;
    #(CLOCK_T/2) reset = 0;
    #(50*CLOCK_T) push_btn = 1; #($urandom_range(15, 1)) push_btn = 0;
    #(50*CLOCK_T) push_btn = 1; #($urandom_range(15, 1)) push_btn = 0;
    #(10*CLOCK_T) push_btn = 1; #($urandom_range(15, 1)) push_btn = 0; 
    #(30*CLOCK_T) $finish();
  end

  initial begin
    $timeformat(-9,0,"ns",5);
    $monitor("%t push_btn=%b light=%b state=%3s timer=%0d", $realtime, push_btn, light, uut.state.name, uut.timer);
  end

  // After reset, the FSM is in state ON and the signal light is '1'
  assert property(@(posedge clock) reset |=> uut.state == uut.ON and light);
  
  // Pressing the button turns on the lights
  assert property(@(posedge clock) ~push_btn ##1 push_btn |=> light);
  
  // Pressing the button turns on the lights - alternative with $rose
  assert property(@(posedge clock) $rose(push_btn) |=> light);
    
  // ON state duration
  property light_is_on_for_ON_PERIOD_clock_periods;
    @(posedge clock) uut.state == uut.OFF and $rose(push_btn) |=> light [*ON_PERIOD] ##1 ~light;
  endproperty
  assert property (light_is_on_for_ON_PERIOD_clock_periods);

  property light_is_on_in_state_ON;
    @(posedge clock) uut.state == uut.ON |-> light;
  endproperty
  assert property (light_is_on_in_state_ON);

  property light_is_off_in_state_OFF;
    @(posedge clock) uut.state == uut.OFF |-> ~light;
  endproperty
  assert property (light_is_off_in_state_OFF);    
endmodule
