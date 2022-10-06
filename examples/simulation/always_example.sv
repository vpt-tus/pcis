module always_example(
    input [3:0] a,b,
    input mode,
    output logic [3:0] o1, o2
    );

always @(mode,a,b)
    if (mode)
        o1 = a - b;
    else
        o2 = a + b;                
endmodule

module always_comb_example(
    input [3:0] a,b,
    input mode,
    output reg [3:0] o1, o2
    );
    
always_comb
    if (mode)
        o1 = a - b;
    else
        o2 = a + b;
endmodule
