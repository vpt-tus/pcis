module timer_switch_top_test;

  logic clock_1Hz, reset, btn_ext;
  logic light;

  timer_switch_top uut(.*);

  parameter T = 10;

  initial begin
    clock_1Hz = 0;
    forever begin
      #(T/2) clock_1Hz = ~clock_1Hz;
    end
  end

  initial begin
    btn_ext = 0;
    reset = 0;

    #T reset = 1;
    #T reset = 0;

    #T btn_ext = 1;
    #(4*T) btn_ext = 0;

    #(30*T) btn_ext = 1;
    #(5*T) btn_ext = 0;

    #(10*T) btn_ext = 1;
    #(3*T) btn_ext = 0;

    #(30*T) $finish;
  end

  assert property(@(posedge clock_1Hz) reset |-> ~light);
  assert property(@(posedge clock_1Hz) ~btn_ext ##1 btn_ext |=> light [*20]);

endmodule