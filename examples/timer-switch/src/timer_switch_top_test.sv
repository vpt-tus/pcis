module timer_switch_top_test;
  logic clock_1Hz, reset, btn_ext;
  logic light;

  timer_switch_top uut(.*);

  parameter Tclock_1Hz = 10;

  initial begin
    clock_1Hz = 0;
    forever begin
      #(Tclock_1Hz/2) clock_1Hz = ~clock_1Hz;
    end
  end

  initial begin
    btn_ext = 0;
    reset = 1;
    #Tclock_1Hz reset = 0;

    test(0);
    #(2*Tclock_1Hz) test(0);

    btn_ext = 1;
    #(4*Tclock_1Hz) btn_ext = 0;

    test(1);
    #(19*Tclock_1Hz) test(1);
    #(Tclock_1Hz) test(0);

    #(2*Tclock_1Hz) btn_ext = 1;
    #(5*Tclock_1Hz) btn_ext = 0;

    #(10*Tclock_1Hz) btn_ext = 1;
    #(3*Tclock_1Hz) btn_ext = 0;

    #(19*Tclock_1Hz) test(1);
    #(Tclock_1Hz) test(0);
  end

  initial begin
    #(80*Tclock_1Hz) $finish();
  end

  task test (logic expected_light);
    @(negedge uut.clock_1Hz);
    assert(light == expected_light) else $error("light - expected: %b, actual: %b", expected_light, light);
  endtask
endmodule