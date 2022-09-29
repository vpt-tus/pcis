module counter_dec #(parameter N) (
  input clock,
  input reset,
  output var logic [N-1:0] cnt
);

always_ff @(posedge clock, posedge reset)
  if (reset)
    cnt <= 0;
  else if (cnt==9) 
    cnt <= 0;
  else 
    cnt <= cnt+1;
endmodule

module counter_dec_test_2;

  localparam size = 4;

  logic clock = 0;
  logic reset = 0;
  logic [size-1:0] cnt;

  counter_dec #(.N(size)) uut (.*);

  always #50 clock = ~clock;

  initial begin
    $display("reset  cnt  cnt ");
    $monitor("  %b   %b %d", reset, cnt, cnt);
  end

  initial begin
    reset = 1;
    #100 reset = 0;
    @(negedge clock); assert (cnt == 0) else $error("cnt: expected=%1d, actual=%1d",0,cnt);
    @(negedge clock); assert (cnt == 1) else $error("cnt: expected=%1d, actual=%1d",1,cnt);
    @(negedge clock); assert (cnt == 2) else $error("cnt: expected=%1d, actual=%1d",2,cnt);
    @(negedge clock); assert (cnt == 3) else $error("cnt: expected=%1d, actual=%1d",3,cnt);
    @(negedge clock); assert (cnt == 4) else $error("cnt: expected=%1d, actual=%1d",4,cnt);
    @(negedge clock); assert (cnt == 5) else $error("cnt: expected=%1d, actual=%1d",5,cnt);
    @(negedge clock); assert (cnt == 6) else $error("cnt: expected=%1d, actual=%1d",6,cnt);   
    @(negedge clock); assert (cnt == 7) else $error("cnt: expected=%1d, actual=%1d",7,cnt);
    @(negedge clock); assert (cnt == 8) else $error("cnt: expected=%1d, actual=%1d",8,cnt);
    @(negedge clock); assert (cnt == 9) else $error("cnt: expected=%1d, actual=%1d",9,cnt); 
    @(negedge clock); assert (cnt == 0) else $error("cnt: expected=%1d, actual=%1d",0,cnt);
    $display("Test passed");
    $finish;
  end

endmodule
