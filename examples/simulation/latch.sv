
module latch (
  input logic d,
  input logic enable,  
  output logic q
);

always_ff @(*)
  if (enable)
    q <= d;
  else
    q <= q;

endmodule

module latch_test1;
  logic enable, q, d;

  latch uut (.*);

  initial begin
    enable = 0; d = 1;
    #50 enable = 1;
    #50 d = 0;
    #50 d = 1;
    #50 enable = 0;
    #50 d = 0;
    #50 d = 1;
    #100;
    $finish;
  end

  initial begin
    $display("enable  d    q");
    $monitor("  %b     %b   %b", enable, d, q);
    $dumpfile("dump.vcd");
    $dumpvars;
  end
endmodule
