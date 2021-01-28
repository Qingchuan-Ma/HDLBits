module top_module (
    input a,
    input b,
    input c,
    input d,
    output q );//

    assign q = (a&d)|(c&b)|(~a&b&d)|(a&~b&c); // Fix me

endmodule
