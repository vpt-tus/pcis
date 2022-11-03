module flip_flop_test2;
  logic clock, reset_n, q, d;

  flip_flop uut (.*);

  initial begin
    clock = 0;
    forever #50 clock = ~clock;
  end

  initial begin
    reset_n = 0;
    d = 1;
    #1 assert (q == 0) else $error("test 1 - q: expected=%1d, actual=%1d",0,q);

    #100 reset_n = 1;
    #1 assert (q == 0) else $error("test 2.1 - q: expected=%1d, actual=%1d",0,q); 
    @(negedge clock); assert (q == 1) else $error("test 2.2 - q: expected=%1d, actual=%1d",1,q);
    
    #335 d = 0;
    assert (q == 1) else $error("test 3.1 - q: expected=%1d, actual=%1d",1,q); 
    @(negedge clock); assert (q == 0) else $error("test 3.2 - q: expected=%1d, actual=%1d",0,q);    
    
    #200;
    $finish;
  end

  initial begin
    $display("reset_n clock  d   q");
    $monitor("  %b      %b     %b   %b", reset_n, clock, d, q);
  end

endmodule