`timescale 1ns / 1ps

module blocking_vs_nonblocking(
  output logic q1,q2,
  input clk, d);

  logic q1_tmp, q2_tmp;

  always @ (posedge clk) begin
    q1_tmp = d; 
    q1 = q1_tmp;    
  end

  always @ (posedge clk) begin
    q2_tmp <= d; 
    q2 <= q2_tmp;
  end
endmodule

module blocking_vs_nonblocking_test;
  parameter T = 100;
  logic clk = 0;
  logic d, q1, q2;

  blocking_vs_nonblocking uut(.*);

  initial forever #(T/2) clk = ~clk;

  initial begin
    d = 1;
    #(T*3) $finish; 
  end

  initial $monitor("%t %b %b %b %b",$time,clk,d,q1,q2);
endmodule