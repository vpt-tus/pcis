module johnson #(parameter N = 4) (
  input clock,
  input reset, // Active high
  output logic [N-1:0] Q // Shift register content
);
 
  always_ff @(posedge clock, posedge reset)
    if (reset)
      Q <= 0;
    else begin
      Q <= {Q[N-2:0], ~Q[N-1]};
    end

endmodule


module johnson_test;

  localparam N = 5;

  logic clock = 0;
  logic reset;
  logic [N-1:0] Q;

  johnson #(.WIDTH(N)) uut(.*);

  initial forever #50 clock = ~clock;
  initial $monitor("%b",Q);

  initial begin
    reset = 1;
    #100 reset = 0;
    #2000 $finish;
  end

endmodule