//
// Single digit decimal counter
//
// When reset==0 and carry_in==1, the counter's output "digit" is incremented by one on each rising edge of the clock.
// When digit==9, the carry_out signal is 1.
//
module decimal_counter_1digit(
  input clock, 
  input reset, 
  input carry_in, 
  output logic carry_out, 
  output logic [3:0] digit); 

// TODO

endmodule