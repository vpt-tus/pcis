`timescale 1ns / 1ps

module disp_ctrl_test;
  localparam T = 100;
  logic clk, reset;
  logic [15:0] digits;

  logic [3:0] an;
  logic [6:0] seg;

  disp_ctrl #(.D(1)) uut(.*);

  initial begin
    clk = 0;
    forever #(T/2) clk = ~clk;
  end

  initial begin
    $display("D=%d ADDR_SIZE=%d",uut.D, uut.ADDR_SIZE);
    reset = 1;
    #T reset = 0;
    digits = {4'h0, 4'h0, 4'h0, 4'h1};
    #(10*T) digits = {4'h0, 4'h0, 4'h1, 4'h0};
    #(10*T) digits = {4'h0, 4'h1, 4'h0, 4'h0};
    #(10*T) digits = {4'h1, 4'h0, 4'h0, 4'h0};
    #(10*T) $finish;
  end

  initial $monitor("digits=%4h addr=%d an=%b seg=%b", digits, uut.addr, an, seg);

  // always @(uut.addr) $display("digits=%4h addr=%d an=%b seg=%b", digits, uut.addr, an, seg);
endmodule

