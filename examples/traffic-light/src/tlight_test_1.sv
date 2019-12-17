module tlight_test_1;
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

    test(uut.s1.name, uut.YELLOW, uut.YELLOW);

    #(3*T)
    test(uut.s2.name, uut.RED, uut.GREEN);

    #(15*T)
    test(uut.s3.name, uut.YELLOW, uut.YELLOW);

    #(3*T)
    test(uut.s4.name, uut.GREEN, uut.RED);

    #(15*T)
    test(uut.s1.name, uut.YELLOW, uut.YELLOW);
  end

  // initial begin
  // 	$monitor("reset=%b clock=%b state=%s timer=%d",reset, clock, uut.state.name, uut.timer);
  // end

  initial begin
    #(50*T) $finish();
  end

  task test (string expected_state, logic [2:0] expected_ns, expected_we);
    @(negedge clock);
    assert(uut.state.name == expected_state) else $error("state - expected: %s, actual: %s", expected_state, uut.state.name);
    assert(ns == expected_ns) else $error("ns - expected: %b, actual: %b", expected_ns, ns);
    assert(we == expected_we) else $error("we - expected: %b, actual: %b", expected_we, we);
  endtask
endmodule