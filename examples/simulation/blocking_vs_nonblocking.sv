module blocking_example(
  output logic q,
  input clk, d);

  logic q_next;

  always @ (posedge clk) begin
    q_next = d; 
    q = q_next;    
  end
endmodule

module nonblocking_example(
  output logic q,
  input clk, d);

  logic q_next;

  always @ (posedge clk) begin
    q_next <= d; 
    q <= q_next;    
  end
endmodule

module blocking_vs_nonblocking_test;
  parameter T = 100;
  logic clk = 0;
  logic d, q_block, q_nonblock;

  blocking_example D1 (q_block, clk, d);
  nonblocking_example D2 (q_nonblock, clk, d);

  initial forever #(T/2) clk = ~clk;

  initial begin
    d = 1;
    #(T*3);
    d = 0;
    #(T*3) $finish; 
  end

  initial $monitor("%t %b %b %b %b",$time,clk,d,D1.q_next,q_block,q_nonblock);
endmodule
