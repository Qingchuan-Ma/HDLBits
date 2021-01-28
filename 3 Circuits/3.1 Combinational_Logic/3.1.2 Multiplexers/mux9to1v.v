module top_module( 
    input [15:0] a, b, c, d, e, f, g, h, i,
    input [3:0] sel,
    output [15:0] out );

    assign out = (sel==4'h0)?a:
        (sel==4'h1)?b:
        (sel==4'h2)?c:
        (sel==4'h3)?d:
        (sel==4'h4)?e:
        (sel==4'h5)?f:
        (sel==4'h6)?g:
        (sel==4'h7)?h:
        (sel==4'h8)?i:16'hffff;
endmodule
