module top_module (
    input clk,
    input w, R, E, L,
    output reg Q
);
    wire q_in;
    assign q_in = (E&L)? R:
        (~E&L)? R:
        (~E&~L)? Q:
        (E&~L)?w:0;
    always @(posedge clk) begin
          Q <= q_in;
    end

endmodule
