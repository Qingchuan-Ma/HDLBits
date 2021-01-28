module top_module (
    input clk,
    input [7:0] in,
    output [7:0] anyedge
);

    reg [7:0] in_reg;
    always @(posedge clk) begin
        in_reg <= in;
        if((in[0]&~in_reg[0])|(~in[0]&in_reg[0]))
            anyedge[0] <= 1;
        else
            anyedge[0] <= 0;
        
        if((in[1]&~in_reg[1])|(~in[1]&in_reg[1]))
            anyedge[1] <= 1;
        else
            anyedge[1] <= 0;
        
        if((in[2]&~in_reg[2])|(~in[2]&in_reg[2]))
            anyedge[2] <= 1;
        else
            anyedge[2] <= 0;
        
        if((in[3]&~in_reg[3])|(~in[3]&in_reg[3]))
            anyedge[3] <= 1;
        else
            anyedge[3] <= 0;
        
        if((in[4]&~in_reg[4])|(~in[4]&in_reg[4]))
            anyedge[4] <= 1;
        else
            anyedge[4] <= 0;
                
        if((in[5]&~in_reg[5])|(~in[5]&in_reg[5]))
            anyedge[5] <= 1;
        else
            anyedge[5] <= 0;
        
        if((in[6]&~in_reg[6])|(~in[6]&in_reg[6]))
            anyedge[6] <= 1;
        else
            anyedge[6] <= 0;
        
        if((in[7]&~in_reg[7])|(~in[7]&in_reg[7]))
            anyedge[7] <= 1;
        else
            anyedge[7] <= 0;
    end
    
endmodule
