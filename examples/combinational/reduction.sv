module reduction(
  output logic xorA, andA, nandA, orA, norA,
  input logic [3:0] A);

  assign xorA = ^A;   // A[0] ^ A[1] ^ A[2] ^ A[3]
  assign andA = &A;   // A[0] & A[1] & A[2] & A[3]
  assign orA = |A;    // A[0] | A[1] | A[2] | A[3]
  assign nandA = ~&A; // ~(A[0] & A[1] & A[2] & A[3])
  assign norA = ~|A;  // ~(A[0] | A[1] | A[2] | A[3])  
endmodule

module reduction_test;
  logic [3:0] A;
  logic xorA, andA, nandA, orA, norA;
 
  reduction uut (.*);

  initial $display("   A -> xorA, andA, nandA,  orA, norA");
  initial $monitor("%b ->    %b     %b      %b     %b     %b", A, xorA, andA, nandA, orA, norA);

  initial begin
    for(int i=0; i<16; i++)begin
      #10 A = i;      
    end
    #10 $finish;
  end
endmodule
