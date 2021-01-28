module top_module (
    input [6:1] y,
    input w,
    output Y2,
    output Y4);

    //parameter A=6'b000001, B=6'b000010, C=6'b000100, D=6'b001000, E=6'b010000, F=6'b100000;
    parameter A=1, B=2, C=3, D=4, E=5, F=6;
    reg [6:1] Y;
    
    assign Y[B] = (y[A]&~w);
    assign Y[D] = (y[B]&w)|(y[C]&w)|(y[E]&w)|(y[F]&w);
    
    assign Y2 = Y[B];
    assign Y4 = Y[D];
endmodule
