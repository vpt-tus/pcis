module latch_test2;
  logic enable, q, d;

  latch uut (.*);

  initial begin
    enable = 0; d = 1;
    #1 assert (q === 1'bx) else $error("test 1 - q: expected=%1d, actual=%1d",1'bx,q);   

    #50 enable = 1;
    #1 assert (q == 1) else $error("test 2 - q: expected=%1d, actual=%1d",1,q);    

    #50 d = 0;
    #1 assert (q == 0) else $error("test 3 - q: expected=%1d, actual=%1d",0,q);    

    #50 d = 1;
    #1 assert (q == 1) else $error("test 4 - q: expected=%1d, actual=%1d",1,q);    

    #50 enable = 0;
    #50 d = 0;
    #1 assert (q == 1) else $error("test 5 - q: expected=%1d, actual=%1d",1,q);    

    #50 d = 1;
    #1 assert (q == 1) else $error("test 6 - q: expected=%1d, actual=%1d",1,q);    

    #100;
    $finish;
  end

   initial begin
    $display("enable  d    q");
    $monitor("  %b     %b   %b", enable, d, q);
  end

endmodule