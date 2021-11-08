
module number_of_bits;

localparam n = 8;
localparam x = $clog2(n)+1;

initial $display("%d %d",n,x);

endmodule
