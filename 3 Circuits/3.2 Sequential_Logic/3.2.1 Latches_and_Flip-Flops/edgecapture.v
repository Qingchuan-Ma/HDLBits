module top_module (
    input clk,
    input reset,
    input [31:0] in,
    output [31:0] out
);

    reg [31:0] in_reg;
    integer i;
    always @(posedge clk) begin
        in_reg <= in;
        if(reset)
            out <= 0;
        else begin
            for(i = 0; i < 32; i=i+1) begin
                if(in_reg[i]&~in[i])
                    out[i] <= 1;
            end
        end
    end
endmodule
