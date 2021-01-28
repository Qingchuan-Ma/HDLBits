module top_module( 
    input [15:0] a, b,
    input cin,
    output cout,
    output [15:0] sum );
    
    wire [3:0] cout_t;
	bcd_fadd add1(a[3:0], b[3:0], cin, cout_t[0], sum[3:0]);
    bcd_fadd add2(a[7:4], b[7:4], cout_t[0], cout_t[1], sum[7:4]);
    bcd_fadd add3(a[11:8], b[11:8], cout_t[1], cout_t[2], sum[11:8]);
    bcd_fadd add4(a[15:12], b[15:12], cout_t[2], cout, sum[15:12]);
    
endmodule
