`timescale 1ns / 1ps
module full_adder(
    input a,
    input b,
    output s,
    input cin,
    output cout
    );
    
    assign s = a ^ b ^ cin;
    assign cout = (a & b)  |  (a & cin)  |  (b & cin);
    
endmodule
