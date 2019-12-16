module timer_switch_test_1;
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

	assert property(@(posedge clock_1Hz) reset |-> uut.state == uut.OFF and ~light);
	assert property(@(posedge clock_1Hz) ~btn ##1 btn |=> light);
	assert property(@(posedge clock_1Hz) ~btn ##1 btn |=> light [*20]);
endmodule