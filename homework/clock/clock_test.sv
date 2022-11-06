module clock_test;

    logic[3:0] m1;
    logic[2:0] m10;
    logic[3:0] h1;
    logic[1:0] h10;

    logic clk_1min = 0;
    logic reset;

    clock uut(.*);

    always #1 clk_1min = ~clk_1min;

    initial begin
        reset = 1;
        #1 reset = 0;
        #3000 $finish;
    end

    initial $monitor("%1d%1d:%1d%1d", h10,h1,m10,m1);
endmodule
