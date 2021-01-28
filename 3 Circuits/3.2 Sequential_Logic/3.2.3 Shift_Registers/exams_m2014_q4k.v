module top_module (
    input clk,
    input resetn,   // synchronous reset
    input in,
    output out);

    reg q0,q1,q2;
    always @(posedge clk) begin
        if(~resetn) begin
            out <= 0;
        	q0 <= 0;
        	q1 <= 0;
        	q2 <= 0;
        end else begin
            q0 <= in;
            q1 <= q0;
            q2 <= q1;
            out <= q2;
        end
    end
endmodule
