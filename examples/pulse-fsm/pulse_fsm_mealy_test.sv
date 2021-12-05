module pulse_fsm_mealy_test;

  logic clock, sig, pulse, reset;

  localparam PW=5;
  pulse_fsm_mealy #(.PULSE_WIDTH(PW)) uut  (.*);

  localparam T = 10;
  initial begin
    clock = 0;
    forever #(T/2) clock = ~clock;
  end

  initial begin
    sig <= 0;
    reset <= #6 1;
    reset <= #22 0;
    sig <= #47 1;
    sig <= #113 0;
    sig <= #132 1;
    sig <= #138 0;    
    #200 $finish;
  end

  property pulse_is_high_for_PW_clock_periods;
    @(posedge clock) $rose(sig) |=> pulse [*PW] ##1 ~pulse;
  endproperty
  assert property (pulse_is_high_for_PW_clock_periods) else $error("Test 6");

  initial begin
    $timeformat(-9, 2, "ns", 10);
    $monitor("%t clock=%b sig=%b %s pulse=%b", $time, clock, sig, uut.state.name, pulse);
    $dumpfile("dump.vcd"); $dumpvars;
  end

endmodule
