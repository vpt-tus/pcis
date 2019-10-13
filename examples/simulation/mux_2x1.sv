module mux_2x1_proc(
  output logic [7:0] y,
  input [7:0] a,b,
  input select);

  always_comb
    if (select) y = a;
    else y = b;
endmodule

module mux_2x1_cont(
  output logic [7:0] y,
  input [7:0] a,b,
  input select);

  assign y = select ? a : b;
endmodule

module mux_2x1_test;
  logic [7:0] a,b,y;
  logic select;

  mux_2x1_proc uut (.*);

  initial $monitor("%b %b %b",a,b,y);

  initial begin
    a = 8'b00001111;
    b = 8'b10101010;
    select = 1'b0;
    #10;
    select = 1'b1;
    #10;
    $finish;
  end
endmodule