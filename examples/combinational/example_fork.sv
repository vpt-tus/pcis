`timescale 10ns / 1ns

module example_fork;
  logic foo, bar, baz, quux;

  initial $monitor($time, " foo=", foo, " bar=", bar, " baz=", baz, " quux=", quux);
  initial #300 $finish;
  
  initial begin
    fork
      foo = 0;
      #100 foo = 1;
      #120 foo = 0;
      #130 foo = 1;
      #170 foo = 0;
      #220 foo = 1;
  	join;
  end
  initial begin
    bar <= 0;
    bar <= #100 1;
    bar <= #120 0;
    bar <= #130 1;
    bar <= #170 0;
    bar <= #220 1;
  end
  initial begin
    baz = 0;
    #100 baz = 1;
    #20 baz = 0;
    #10 baz = 1;
    #40 baz = 0;
    #50 baz = 1;
  end;
  initial begin
    quux <= 0;
    #100 quux <= 1;
    #20 quux <= 0;
    #10 quux <= 1;
    #40 quux <= 0;
    #50 quux <= 1;
  end;
endmodule