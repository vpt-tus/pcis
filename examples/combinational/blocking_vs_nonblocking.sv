module ex1(
  output logic [2:0] q,
  input clk, d);

  always @ (posedge clk) begin
    q[0] = d;
    q[1] = q[0];
    q[2] = q[1];
  end
endmodule

module ex2(
  output logic [2:0] q,
  input clk, d);

  always @ (posedge clk) begin
    q[0] <= d;
    q[1] <= q[0];
    q[2] <= q[1];
  end
endmodule

module ex3(
  output logic [2:0] q,
  input clk, d);

  always @ (posedge clk) begin
    q <= q << 1;
    q[0] <= d;
  end
endmodule

module ex4(
  output logic [2:0] q,
  input clk, d);

  always @ (posedge clk) begin
    q[0] <= d;
    q <= q << 1;
  end
endmodule

module blocking_vs_nonblocking_test;
  parameter T = 100;
  logic clk = 0;
  logic d;
  logic [2:0] q_ex1, q_ex2, q_ex3, q_ex4;

  ex1 D1 (q_ex1, clk, d);
  ex2 D2 (q_ex2, clk, d);
  ex3 D3 (q_ex3, clk, d);
  ex4 D4 (q_ex4, clk, d);

  always #(T/2) clk = ~clk;
  // always @(posedge clk) $display("%t d=%b q_ex1=%b q_ex2=%b",$time,d,q_ex1,q_ex2);
  always @(posedge clk) $display("%t d=%b q_ex1=%b q_ex2=%b q_ex3=%b q_ex4=%b",$time,d,q_ex1,q_ex2,q_ex3,q_ex4);

  initial begin
    $timeformat(-9, 0, "ns");
    d = 1;
    #(T*3);
    d = 0;
    #(T*3) $finish;
  end

endmodule
