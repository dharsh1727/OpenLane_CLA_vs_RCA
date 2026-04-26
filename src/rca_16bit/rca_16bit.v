module rca_16bit (
    input  [15:0] A,
    input  [15:0] B,
    input         Cin,
    output [15:0] Sum,
    output        Cout
);

    wire c1, c2, c3, c4, c5, c6, c7, c8;
    wire c9, c10, c11, c12, c13, c14, c15;

    assign Sum[0] = A[0] ^ B[0] ^ Cin;
    assign c1     = (A[0] & B[0]) | (A[0] & Cin) | (B[0] & Cin);

    assign Sum[1] = A[1] ^ B[1] ^ c1;
    assign c2     = (A[1] & B[1]) | (A[1] & c1) | (B[1] & c1);

    assign Sum[2] = A[2] ^ B[2] ^ c2;
    assign c3     = (A[2] & B[2]) | (A[2] & c2) | (B[2] & c2);

    assign Sum[3] = A[3] ^ B[3] ^ c3;
    assign c4     = (A[3] & B[3]) | (A[3] & c3) | (B[3] & c3);

    assign Sum[4] = A[4] ^ B[4] ^ c4;
    assign c5     = (A[4] & B[4]) | (A[4] & c4) | (B[4] & c4);

    assign Sum[5] = A[5] ^ B[5] ^ c5;
    assign c6     = (A[5] & B[5]) | (A[5] & c5) | (B[5] & c5);

    assign Sum[6] = A[6] ^ B[6] ^ c6;
    assign c7     = (A[6] & B[6]) | (A[6] & c6) | (B[6] & c6);

    assign Sum[7] = A[7] ^ B[7] ^ c7;
    assign c8     = (A[7] & B[7]) | (A[7] & c7) | (B[7] & c7);

    assign Sum[8] = A[8] ^ B[8] ^ c8;
    assign c9     = (A[8] & B[8]) | (A[8] & c8) | (B[8] & c8);

    assign Sum[9] = A[9] ^ B[9] ^ c9;
    assign c10    = (A[9] & B[9]) | (A[9] & c9) | (B[9] & c9);

    assign Sum[10] = A[10] ^ B[10] ^ c10;
    assign c11     = (A[10] & B[10]) | (A[10] & c10) | (B[10] & c10);

    assign Sum[11] = A[11] ^ B[11] ^ c11;
    assign c12     = (A[11] & B[11]) | (A[11] & c11) | (B[11] & c11);

    assign Sum[12] = A[12] ^ B[12] ^ c12;
    assign c13     = (A[12] & B[12]) | (A[12] & c12) | (B[12] & c12);

    assign Sum[13] = A[13] ^ B[13] ^ c13;
    assign c14     = (A[13] & B[13]) | (A[13] & c13) | (B[13] & c13);

    assign Sum[14] = A[14] ^ B[14] ^ c14;
    assign c15     = (A[14] & B[14]) | (A[14] & c14) | (B[14] & c14);

    assign Sum[15] = A[15] ^ B[15] ^ c15;
    assign Cout    = (A[15] & B[15]) | (A[15] & c15) | (B[15] & c15);

endmodule
