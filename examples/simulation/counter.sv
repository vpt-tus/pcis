
module counter #(parameter N = 8) (
  input logic clock,
  input logic reset_n,
  output logic [N-1:0] cnt
);

always_ff @(posedge clock, negedge reset_n)
  if (~reset_n)
    cnt <= 0;
  else
    cnt <= cnt+1;

endmodule

module counter_test_1;

  localparam size = 4;

  logic clock, reset_n;
  logic [size-1:0] cnt;

  // Instantiate the Unit Under Test (UUT)
  counter #(.N(size)) uut (.*);

  initial begin
    clock = 0;
    forever #5 clock = ~clock;
  end

  initial begin
    reset_n = 0;
    #20 reset_n = 1;
    #200;
    reset_n = 0;
    #50;    
    $finish;
  end

  initial begin
    $display("reset_n clock   cnt  cnt ");
    $monitor("  %b      %b     %b   %d", reset_n, clock, cnt, cnt);
    $dumpfile("dump.vcd");
    $dumpvars;
  end

endmodule