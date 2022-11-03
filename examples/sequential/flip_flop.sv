
module flip_flop (
  input logic d,
  input logic clock,  
  input logic reset_n,
  output logic q
);

always_ff @(posedge clock, negedge reset_n)
  if (~reset_n)
    q <= 0;
  else
    q <= d;

endmodule

module flip_flop_test1;
  logic clock, reset_n, q, d;

  flip_flop uut (.*);

  initial begin
    clock = 0;
    forever #50 clock = ~clock;
  end

  initial begin
    reset_n = 0;
    d = 1;
    #100 reset_n = 1;
    #335 d = 0;
    #200;
    $finish;
  end

  initial begin
    $display("reset_n clock  d   q");
    $monitor("  %b      %b     %b   %b", reset_n, clock, d, q);
    $dumpfile("dump.vcd");
    $dumpvars;
  end
endmodule
