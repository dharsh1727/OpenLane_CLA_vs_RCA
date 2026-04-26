module cla_16bit (
    input  [15:0] A,
    input  [15:0] B,
    input         Cin,
    output [15:0] Sum,
    output        Cout
);

    wire c4, c8, c12;

    cla_4bit_block u0 (
        .A(A[3:0]),
        .B(B[3:0]),
        .Cin(Cin),
        .Sum(Sum[3:0]),
        .Cout(c4)
    );

    cla_4bit_block u1 (
        .A(A[7:4]),
        .B(B[7:4]),
        .Cin(c4),
        .Sum(Sum[7:4]),
        .Cout(c8)
    );

    cla_4bit_block u2 (
        .A(A[11:8]),
        .B(B[11:8]),
        .Cin(c8),
        .Sum(Sum[11:8]),
        .Cout(c12)
    );

    cla_4bit_block u3 (
        .A(A[15:12]),
        .B(B[15:12]),
        .Cin(c12),
        .Sum(Sum[15:12]),
        .Cout(Cout)
    );

endmodule
