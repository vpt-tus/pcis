// Parameter: N - register width
module shift_reg #(parameter N = 4) (
  input clock, 
  input reset, // Active high
  output logic [N-1:0] sr // Shift register content
);
  
  always_ff @(posedge clock, posedge reset) 
    if (reset)
      sr <= 0;
    else begin
      sr <= {sr[N-2:0], ~sr[N-1]};
    end

endmodule