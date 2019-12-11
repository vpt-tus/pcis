module fsm_cc4_2_test;

  logic gnt;
  logic dly, done, req, clk, rst_n;

  fsm_cc4_2 uut(.*);

  parameter T = 100;

  initial begin
    clk = 0;
    forever #(T/2) clk = ~clk;
  end

  initial begin
    {dly,done,req,rst_n} = '0;

    #T rst_n = 1;
    #T req = 1;
    #T req = 0;
    #(3*T) done = 1; dly = 1;
    #T done = 0;
    #(2*T) dly = 0;
    #(4*T) $finish;
  end

endmodule
