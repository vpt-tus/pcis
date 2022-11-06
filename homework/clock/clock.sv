module clock(
    input	clk_1min, reset,
    output 	logic[3:0] m1,
    output 	logic[2:0] m10,
    output 	logic[3:0] h1,
    output 	logic[1:0] h10
  );

    logic m10_carry, m1_carry;
    
    assign m1_carry = m1==9;
    assign m10_carry = m10==5 && m1_carry;

    // minutes
    always @(posedge clk_1min, posedge reset)
        if(reset)
            m1 <= 0;
        else if(m1_carry)
            m1 <= 0;
        else
            m1 <= m1 + 1;

    // minutes x 10
      always @(posedge clk_1min, posedge reset)
        if(reset)
            m10 <= 0;
        else if(m10_carry)
            m10 <= 0;
        else if(m1_carry)
            m10 <= m10 + 1;

endmodule