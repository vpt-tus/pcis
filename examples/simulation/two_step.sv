
module two_step;
    logic a = 0, b = 1;
    logic c = 0, d = 1;    
    logic clk = 0;

    always clk = #10 ~clk;

    // non-blocking
    always @(posedge clk) begin
        a <= b; 
        b <= a;
    end

    // blocking
    always @(posedge clk) begin
        c = d; 
        d = c;
    end

    initial $monitor("%t a=%b b=%b  c=%b d=%b",$time,a,b,c,d);
    initial #100 $finish;
endmodule
