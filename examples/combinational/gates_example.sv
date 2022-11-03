module gates_example(
    output [3:0] D,
    input A, B, enable);

    logic A_not, B_not, E_not;

    not G1 (A_not, A);
    not G2 (B_not, B);
    not G3 (E_not, enable);
    nand G4 (D[3], A_not, B_not, E_not);
    nand G5 (D[2], A_not, B, E_not);
    nand G6 (D[1], A, B_not, E_not);
    nand G7 (D[0], A, B, E_not);
endmodule
