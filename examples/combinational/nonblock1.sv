`timescale 1ns / 1ps

module nonblock1;
  logic a, b, c, d, e, f;
  
  // blocking assignments
  initial begin
    a = #10 1; // a will be assigned 1 at time 10
    b = #2 0; // b will be assigned 0 at time 12
    c = #4 1; // c will be assigned 1 at time 16
  end
  
  // nonblocking assignments
  initial begin
    d <= #10 1; // d will be assigned 1 at time 10
    e <= #2 0; // e will be assigned 0 at time 2
    f <= #4 1; // f will be assigned 1 at time 4
  end

  initial $monitor(a,b,c,d,e,f);
  initial #20 $finish;
endmodule
