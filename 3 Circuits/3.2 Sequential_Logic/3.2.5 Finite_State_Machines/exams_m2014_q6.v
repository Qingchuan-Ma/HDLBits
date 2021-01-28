module top_module (
    input clk,
    input reset,     // synchronous reset
    input w,
    output z);

    parameter A=3'b000, B=3'b001, C=3'b010, D=3'b011, E=3'b100, F=3'b101;
    reg [3:1] y, Y;
    always @(*) begin
        case(y)
            A: if(w) Y=A; else Y=B;
            B: if(w) Y=D; else Y=C;
            C: if(w) Y=D; else Y=E;
            D: if(w) Y=A; else Y=F;
            E: if(w) Y=D; else Y=E;
            F: if(w) Y=D; else Y=C;
        endcase
    end
    
    always @(posedge clk) begin
        if(reset)
            y <= A;
        else
            y <= Y;
    end
    
    assign z = (y==E)|(y==F);
    
endmodule
