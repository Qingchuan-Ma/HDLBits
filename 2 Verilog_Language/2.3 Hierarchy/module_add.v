module top_module(
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);
	wire cin;
    assign cin = 0;
    wire cout;
    add16 u1(a[15:0],b[15:0],cin,sum[15:0], cout);
    add16 u2(a[31:16],b[31:16],cout,sum[31:16]);
endmodule
