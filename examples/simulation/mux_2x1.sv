module mux_2x1_df #(parameter N = 8)(
  output logic [N-1:0] q,
  input [N-1:0] a,b,
  input select);

  assign q = ~select ? a : b;
endmodule

module mux_2x1_proc #(parameter N = 8)(
  output logic [N-1:0] q,
  input [N-1:0] a,b,
  input select);

  always_comb
    if (~select) q = a;
    else q = b;
endmodule

module mux_2x1_test;
  logic [7:0] a,b,q1,q2;
  logic select;

  mux_2x1_df D1 (.q(q1), .*);
  mux_2x1_proc D2 (.q(q2), .*);

  initial $monitor("%b: %h %h -> %h %h",select,a,b,q1,q2);

  initial begin
    select = 1'b0; a = 8'h0f; b = 8'hf0;
    #10 select = 1'b1; a = 8'h0f; b = 8'hf0;
    #10 select = 1'b0; a = 8'h5a; b = 8'ha5;
    #10 select = 1'b1; a = 8'h5a; b = 8'ha5;
    #10 select = 1'b0; a = 8'h00; b = 8'hff;    
    #10 select = 1'b1; a = 8'h00; b = 8'hff;
    #10 $finish;
  end
endmodule
