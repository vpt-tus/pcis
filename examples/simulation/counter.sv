
module counter #(parameter N = 8) (
  input logic clock,
  input logic reset,
  output logic [N-1:0] cnt
);

always_ff @(posedge clock, posedge reset)
  if (reset)
    cnt <= 0;
  else
    cnt <= cnt+1;

endmodule

module counter_test_1;

  localparam size = 8;

  logic clock, reset;
  logic [size-1:0] cnt;

  // Instantiate the Unit Under Test (UUT)
  counter #(.N(size)) uut (.*);

  initial begin
    clock = 0;
    forever #50 clock = ~clock;
  end

  initial begin
    reset = 1;
    #100 reset = 0;
    #1000;
    $finish;
  end

  initial begin
    $display("reset clock   cnt  cnt ");
    $monitor("  %b      %b     %b   %d", reset, clock, cnt, cnt);
    $dumpfile("dump.vcd");
    $dumpvars;
  end

endmodule

module counter_test_2;

  localparam size = 2;

  logic clock, reset;
  logic [size-1:0] cnt, expected;

  // Instantiate the Unit Under Test (UUT)
  counter #(.N(size)) uut (.*);

  initial begin
    clock = 0;
    forever #50 clock = ~clock;
  end

  initial begin
    reset = 1;
    #100 reset = 0;

    @(negedge clock); expected=0; assert (cnt == expected) else $error("cnt: expected=%1d, actual=%1d",expected,cnt);    
    @(negedge clock); expected=1; assert (cnt == expected) else $error("cnt: expected=%1d, actual=%1d",expected,cnt);
    @(negedge clock); expected=2; assert (cnt == expected) else $error("cnt: expected=%1d, actual=%1d",expected,cnt);
    @(negedge clock); expected=3; assert (cnt == expected) else $error("cnt: expected=%1d, actual=%1d",expected,cnt);     
    @(negedge clock); expected=0; assert (cnt == expected) else $error("cnt: expected=%1d, actual=%1d",expected,cnt);       
    $display("Test passed");
    $finish;
  end

endmodule
