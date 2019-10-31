module decimal_counter_test;
  logic clock, reset;
  logic [3:0][3:0] digits;

  decimal_counter_v3 uut(.*);

  localparam T = 100;

  initial begin
    clock = 0;
    forever #(T/2) clock = ~clock;
  end

  initial begin
    #100;
    reset = 1;
    #T reset = 0;
    for(int l=0; l<10; l++)
      for(int k=0; k<10; k++)
        for(int j=0; j<10; j++)
          for(int i=0; i<10; i++) begin
            @(negedge clock) 
            assert (digits[3]==l && digits[2]==k && digits[1]==j && digits[0]==i ) else $error("expected %1d%1d%1d%1d actual %4h ",l,k,j,i,digits);
          end

    @(negedge clock)
    assert (digits == '0) else $error("expected digits=0000 actual digits=%4d",digits);

    $finish;
  end

  initial begin
    $monitor("%4h",digits);
  end
endmodule
