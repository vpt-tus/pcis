
// Assignment examples 

// continuous
module ex1(
    input logic a0,a1,a2,a3,
    output logic z);
    logic tmp;
    assign tmp = ((a0 | ~a1) & (a2 | a3));
    assign z = tmp ^ a0;
endmodule

// procedural, non-blocking
module ex2(
    input logic a0,a1,a2,a3,
    output logic z);    
    logic tmp;
 
    always_comb begin
        tmp = ((a0 | ~a1) & (a2 | a3));
        z = tmp ^ a0; 
    end
endmodule

// procedural, non-blocking, clocked
module ex3(
    input logic a0,a1,a2,a3,clk,
    output logic z);
    logic tmp;
    
    always_ff @(posedge clk) begin
        tmp = ((a0 | ~a1) & (a2 | a3));
        z = tmp ^ a0; 
    end
endmodule

// procedural, blocking, clocked
module ex4(
    input logic a0,a1,a2,a3,clk,
    output logic z);
    logic tmp;
    
    always_ff @(posedge clk) begin
        tmp <= ((a0 | ~a1) & (a2 | a3));
        z <= tmp ^ a0; 
    end
endmodule

module top(
    input logic a0,a1,a2,a3,clk,
    output logic z1,z2,z3,z4);

    ex1 D1 (.z(z1), .*);
    ex2 D2 (.z(z2), .*);
    ex3 D3 (.z(z3), .*);
    ex4 D4 (.z(z4), .*);    
endmodule
