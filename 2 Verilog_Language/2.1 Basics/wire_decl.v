`default_nettype none
module top_module(
    input a,
    input b,
    input c,
    input d,
    output out,
    output out_n   ); 
wire res1 = a&b;
wire res2 = c&d;
assign out = res1 | res2;
assign out_n = ~out;
endmodule
