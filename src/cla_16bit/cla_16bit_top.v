module cla_16bit_top (
    input         clk,
    input  [15:0] A,
    input  [15:0] B,
    input         Cin,
    output reg [15:0] Sum,
    output reg        Cout
);

    wire [15:0] sum_w;
    wire        cout_w;

    cla_16bit u_cla (
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
