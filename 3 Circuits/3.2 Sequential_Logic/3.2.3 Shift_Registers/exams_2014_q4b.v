module top_module (
    input [3:0] SW,
    input [3:0] KEY,
    output [3:0] LEDR
); //
    
    MUXDFF d0(KEY[0], LEDR[1], SW[0], KEY[1], KEY[2], LEDR[0]);
    MUXDFF d1(KEY[0], LEDR[2], SW[1], KEY[1], KEY[2], LEDR[1]);
    MUXDFF d2(KEY[0], LEDR[3], SW[2], KEY[1], KEY[2], LEDR[2]);
    MUXDFF d3(KEY[0], KEY[3], SW[3], KEY[1], KEY[2], LEDR[3]);

endmodule

module MUXDFF (
    input clk,
    input w, R, E, L,
    output reg Q);
    
    wire q_in;
    assign q_in = (E&L)? R:
        (~E&L)? R:
        (~E&~L)? Q:
        (E&~L)? w : 0;
    always @(posedge clk) begin
          Q <= q_in;
    end
endmodule
