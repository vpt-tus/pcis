module lab1_top #(parameter N = 16) (
    input clk_pin, // 100 MHz
    input rst_pin,
    output [N-1:0] led_pins
);

logic clock;

assign clk_out_pin = clock;   

lab1 #(.WIDTH(N)) u1 (
    .clock(clock), 
    .reset(rst_pin), 
    .sr(led_pins)
);

// 100 000 000 / 2 000 000 = 50 Hz
clk_div #(.DIVIDE_BY(2_000_000)) div (
    .clock_in(clk_pin),
    .clock_out(clock),
    .reset(rst_pin)
);

endmodule
