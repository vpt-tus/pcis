
module shot_test;
  logic clock, q, d;

  shot uut (.*);

  initial begin
    clock = 0;
    forever #50 clock = ~clock;
  end

  initial begin
    d = 0;
    
    @(posedge clock);
    @(posedge clock) #1 d = 1;      
    @(posedge clock) assert (q == 1) else $error("test 1 - q: expected=%1d, actual=%1d",1,q);
    @(negedge clock); assert (q == 0) else $error("test 2 - q: expected=%1d, actual=%1d",0,q);
    
    @(posedge clock); 
    @(posedge clock) #1 d = 0;
    @(negedge clock); assert (q == 0) else $error("test 3 - q: expected=%1d, actual=%1d",0,q);    
    
    #200;
    $finish;
  end

  initial begin
    $dumpfile("dump.vcd");
    $dumpvars;
  end

endmodule