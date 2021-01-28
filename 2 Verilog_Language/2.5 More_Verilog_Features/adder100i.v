module top_module( 
    input [99:0] a, b,
    input cin,
    output [99:0] cout,
    output [99:0] sum );

    wire [99:0] cout_t;
    genvar i;
    generate begin
        for(i=0;i<100;i++) begin: u
            if(i==0)
                add1 u1(a[i], b[i], cin, sum[i], cout[i]);
            else
                add1 u2(a[i], b[i], cout[i-1], sum[i], cout[i]);
        end
    end
    endgenerate
        
    
endmodule

module add1 ( input a, input b, input cin,   output sum, output cout );

    assign {cout, sum} = a + b + cin;
// Full adder module here

endmodule