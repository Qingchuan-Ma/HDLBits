module top_module (
    input clk,
    input [7:0] in,
    output reg [7:0] pedge
);

    reg [7:0] in_reg;
    always @(posedge clk) begin
        in_reg <= in;
        if(in[0]&~in_reg[0])
            pedge[0] <= in[0];
        else
            pedge[0] <= 0;
        
        if(in[1]&~in_reg[1])
            pedge[1] <= in[1];
        else
            pedge[1] <= 0;
        
        if(in[2]&~in_reg[2])
            pedge[2] <= in[2];
        else
            pedge[2] <= 0;
        
        if(in[3]&~in_reg[3])
            pedge[3] <= in[3];
        else
            pedge[3] <= 0;
        
        if(in[4]&~in_reg[4])
            pedge[4] <= in[4];
        else
            pedge[4] <= 0;
                
        if(in[5]&~in_reg[5])
            pedge[5] <= in[5];
        else
            pedge[5] <= 0;
        
        if(in[6]&~in_reg[6])
            pedge[6] <= in[6];
        else
            pedge[6] <= 0;
        
        if(in[7]&~in_reg[7])
            pedge[7] <= in[7];
        else
            pedge[7] <= 0;
    end
    
endmodule
