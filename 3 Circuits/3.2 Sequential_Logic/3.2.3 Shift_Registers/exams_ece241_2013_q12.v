module top_module (
    input clk,
    input enable,
    input S,
    input A, B, C,
    output Z ); 

    reg [7:0] mem;
    always @(posedge clk) begin
        if(enable)
            mem <= {mem[6:0], S};
    end
    
    always @(*)
        case({A,B,C})
            3'b000: Z = mem[0];
            3'b001: Z = mem[1];
            3'b010: Z = mem[2];
            3'b011: Z = mem[3];
            3'b100: Z = mem[4];
            3'b101: Z = mem[5];
            3'b110: Z = mem[6];
            3'b111: Z = mem[7];
        endcase
endmodule
