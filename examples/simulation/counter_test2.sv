
module counter_test_2;

  localparam size = 4;

  logic clock, reset_n, expected;
  logic [size-1:0] cnt;

  counter #(.N(size)) uut (.*);

  initial begin
    clock = 0;
    forever #5 clock = ~clock;
  end

  initial begin
    reset_n = 0;
    #1 assert (cnt == 0) else $error("cnt: expected=%1d, actual=%1d",expected,cnt);  
    #20 reset_n = 1;
    @(negedge clock) assert (cnt == 1) else $error("cnt: expected=%1d, actual=%1d",1,cnt); 
    @(negedge clock) assert (cnt == 2) else $error("cnt: expected=%1d, actual=%1d",2,cnt);     
    @(negedge clock) assert (cnt == 3) else $error("cnt: expected=%1d, actual=%1d",3,cnt);    
    #200;
    reset_n = 0;
    #50 assert (cnt == 0) else $error("cnt: expected=%1d, actual=%1d",expected,cnt);  
    $finish;
  end

  initial begin
    $display("reset_n   cnt  cnt");
  end

 always @(negedge clock) $display("  %b      %b   %d", reset_n, cnt, cnt);

endmodule
