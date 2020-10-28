
module shift_reg #(parameter N) (
  input clock, reset,
  output logic [N-1:0] sr
);
  
  always_ff @(posedge clock, posedge reset) 
    if(reset)
      sr <= 0;
    else begin
      sr <= {sr[N-2:0], ~sr[N-1]};
    end

endmodule