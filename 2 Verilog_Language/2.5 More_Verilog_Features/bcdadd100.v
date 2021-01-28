module top_module( 
    input [399:0] a, b,
    input cin,
    output cout,
    output [399:0] sum );

    wire [99:0] cout_t;
    genvar i;
    generate begin
        for(i=0;i<100;i=i+1) begin: u
            if(i==0)
                bcd_fadd add1(a[3:0], b[3:0], cin, cout_t[0], sum[3:0]);
            else
                bcd_fadd add2(a[4*i+3:4*i], b[4*i+3:4*i], cout_t[i-1], cout_t[i], sum[4*i+3:4*i]);
        end
    end
    endgenerate
    assign cout = cout_t[99];
endmodule
