`timescale 1ns / 1ps
module bitwise_operators_test;

logic [3:0] A, B;
logic [3:0] A_or_B, A_and_B, not_A;

bitwise_operators uut(.*);

initial begin
    $display("   A    B -> A_or_B A_and_B not_A");
    $monitor("%b %b ->  %b   %b    %b", A, B, A_or_B, A_and_B, not_A);
    #100 A = 4'b0000; B = 4'b0000;
    #100 A = 4'b1111; B = 4'b0000;
    #100 A = 4'b0001; B = 4'b0001;
    #100 A = 4'b1010; B = 4'b0101;
    #100;
    $finish;
end
endmodule

module bitwise_operators(
    input  [3:0] A, B,
    output [3:0] A_or_B, A_and_B, not_A
    );

    assign A_or_B = A | B;
    assign A_and_B = A & B;
    assign not_A = ~A;

endmodule