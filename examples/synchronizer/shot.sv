
module shot (
  input d, clock,  
  output q
);

logic d1;
assign q = ~d1 & d;
always_ff @(posedge clock)
    d1 <= d;

endmodule