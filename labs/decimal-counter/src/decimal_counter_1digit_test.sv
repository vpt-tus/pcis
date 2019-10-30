module decimal_counter_1digit_test;
  logic clock, reset;
  logic carry_in, carry_out;
  logic [3:0] digit;

  decimal_counter_1digit uut(.*);

  localparam T = 100;

  initial begin
    clock = 0;
    forever #(T/2) clock = ~clock;
  end

  initial begin
    #100;
    reset = 1;
    #T reset = 0;

    carry_in = 1;
    for(int i=0; i<9; i++) begin
      @(negedge clock)
      assert (digit==i && carry_out==0) else $error("expected digit=%1d, carry_out=0 actual digit=%1d, carry_out=%b",i,digit,carry_out);
    end
    @(negedge clock)
    assert (digit==9 && carry_out==1) else $error("expected digit=9, carry_out=1 actual digit=%d, carry_out=%b ",digit,carry_out);
    
    reset = 1;
    #T reset = 0;

    carry_in = 0;
    for(int i=0; i<10; i++) begin
      @(negedge clock)
      assert (digit==0 && carry_out==0) else $error("expected digit=0, carry_out=0 actual digit=%d, carry_out=%b",digit,carry_out);
    end

    $finish;
  end

  initial begin
    $monitor("%b %d",carry_out, digit);
  end
endmodule