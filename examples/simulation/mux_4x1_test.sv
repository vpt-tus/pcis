module mux_4x1_test;
  logic [7:0] A0,A1,A2,A3,Q;
  logic [1:0] SEL;

  mux_4x1 uut (.*);

  initial begin
    $display("SEL  A0  A1  A2  A3 ->   Q");
    $monitor(" %d: %d %d %d %d -> %d",SEL,A0,A1,A2,A3,Q);
  end

  initial begin
    SEL = 0; A0 = 0; A1 = 1; A2 = 2; A3 = 3;
    #10 SEL = 1;
    #10 SEL = 2;
    #10 SEL = 3;
    #10 SEL = 0;    
    #10 SEL = 1;
    #10 $finish;
  end
endmodule
