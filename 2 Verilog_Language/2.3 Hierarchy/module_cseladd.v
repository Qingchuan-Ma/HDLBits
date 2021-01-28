module top_module(
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);

	wire cin;
    assign cin = 0;
    wire cout;
    add16 u1(a[15:0],b[15:0],cin,sum[15:0], cout);
    
    wire [15:0] sum1;
    wire [15:0] sum2;
    add16 u2(a[31:16],b[31:16],0,sum1);
    add16 u3(a[31:16],b[31:16],1,sum2);
    
    assign sum[31:16] = (cout == 1'b0) ? sum1: sum2;
    
endmodule
