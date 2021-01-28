module top_module(
    input a,
    input b,
    input c,
    input d,
    output out  ); 

    assign out = (~a&~d)|(c&d&b)|(~c&~a&~b)|(~b&~c&~d)|(d&a&~b);
endmodule
