module timer_switch_test;
  logic clock_1Hz, reset, btn;
  logic light;

  timer_switch uut(.*);

  parameter T = 10;

  initial begin
    clock_1Hz = 0;
    forever begin
      #(T/2) clock_1Hz = ~clock_1Hz;
    end
  end
  
  // Test with immediate assertionst
  initial begin
    btn = 0;
    reset = 1;
    #T reset = 0;

    test(uut.OFF.name, 0);
    #(2*T) test(uut.OFF.name, 0);

    btn = 1;
    #(T) btn = 0;

    test(uut.ON.name, 1);
    #(19*T)	test(uut.ON.name, 1);
    #(T) test(uut.OFF.name, 0);

    #(2*T) btn = 1;
    #(T) btn = 0;

    #(10*T) btn = 1;
    #(T) btn = 0;

    #(19*T) test(uut.ON.name, 1);
    #(T) test(uut.OFF.name, 0);
  end

  initial begin
    #(65*T) $finish();
  end

  task test (string expected_state, logic expected_light);
    @(negedge clock_1Hz);
    assert(uut.state.name == expected_state) else $error("state - expected: %s, actual: %s", expected_state, uut.state.name);
    assert(light == expected_light) else $error("light - expected: %b, actual: %b", expected_light, light);
  endtask
endmodule