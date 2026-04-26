module rca_4bit_top (
    input        clk,
    input  [3:0] A,
    input  [3:0] B,
    input        Cin,
    output reg [3:0] Sum,
    output reg       Cout
);

    wire [3:0] sum_w;
    wire       cout_w;

    rca_4bit u_rca (
        .A(A),
        .B(B),
        .Cin(Cin),
        .Sum(sum_w),
        .Cout(cout_w)
    );

    always @(posedge clk) begin
        Sum  <= sum_w;
        Cout <= cout_w;
    end

endmodule
