module edge_detector_test1;

  logic clk, sig, tick, rst;

  edge_detector uut (.*);

  localparam T = 10;
  initial begin
    clk = 0;
    forever #(T/2) clk = ~clk;
  end

  initial begin
    sig = 0;
    rst = 1;
    #T rst = 0;

    #42 sig = 1;
    #77 sig = 0;
    #100 $finish;
  end

  initial begin
      @(posedge sig);
      @(posedge clk) assert (tick == 1'b0) else $error("tick: expected=%b, actual=%b",1'b0,tick);
      @(posedge clk) assert (tick == 1'b1) else $error("tick: expected=%b, actual=%b",1'b1,tick);
      @(posedge clk) assert (tick == 1'b0) else $error("tick: expected=%b, actual=%b",1'b0,tick);
  end

  initial begin
    $timeformat(-9, 2, " ns", 10);
    $monitor("%t sig=%b, tick=%b",$time,sig,tick);
  end
  
endmodule