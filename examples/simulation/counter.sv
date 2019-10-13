`timescale 1ns / 1ps

module counter	#(parameter N = 8) (
  input clock,
  input reset,
  output var logic [N-1:0] cnt
);

always_ff @(posedge clock, posedge reset)
  if (reset)
    cnt <= 0;
  else
    cnt <= cnt+1;

endmodule

module counter_test_1;

  localparam size = 2;

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
    #600;
    $finish;
  end

  initial begin
    $display("clock  reset  cnt  cnt ");
    $monitor("  %b      %b     %b   %d", reset, clock, cnt, cnt);
    $dumpfile("dump.vcd");
    $dumpvars;
  end

endmodule

module counter_test_2;

  localparam size = 2;

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
    @(negedge clock); assert (cnt == 0) else $error("cnt: expected=%1d, actual=%1d",0,cnt);
    @(negedge clock); assert (cnt == 1) else $error("cnt: expected=%1d, actual=%1d",1,cnt);
    @(negedge clock); assert (cnt == 2) else $error("cnt: expected=%1d, actual=%1d",2,cnt);
    @(negedge clock); assert (cnt == 3) else $error("cnt: expected=%1d, actual=%1d",3,cnt);
    @(negedge clock); assert (cnt == 0) else $error("cnt: expected=%1d, actual=%1d",0,cnt);
    $display("Test passed");
    $finish;
  end

endmodule
