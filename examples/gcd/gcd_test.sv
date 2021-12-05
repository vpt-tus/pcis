module gcd_test;
  logic clk, reset, ready, done_tick, start;
  integer a_in, b_in, gcd_out;

  gcd uut(.*);

  localparam T = 100;
  initial begin
    clk = '0;
    forever #(T/2) clk=~clk;
  end

  initial begin
    reset = '1;
    #T reset = '0;

    check_gcd(6,15,3);
    @(posedge ready)check_gcd(0,1,0);
    @(posedge ready)check_gcd(40,60,20);
    @(posedge ready)check_gcd(1,0,0);
    @(posedge ready)check_gcd(128,64,64);
    @(posedge ready)check_gcd(588,1352,4);
    @(posedge ready)check_gcd(0,0,0);

    #T $finish;
  end

  task check_gcd(input integer a, b, expected);
    a_in = a; b_in = b;
    #20 start = 1;
    #(T+10) start = 0;
    @(posedge done_tick)
      assert (gcd_out == expected) $display("gcd(%0d,%0d)=%0d",a_in,b_in,gcd_out);
        else $error("a=%0d, b=%0d, expected=%0d, actual=%0d",a_in,b_in,expected, gcd_out);
  endtask

endmodule
