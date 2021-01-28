module top_module (
    input [2:0] a,
    output [15:0] q ); 

    always @(*) begin
        if(a==0)
            q = 16'h1232;
        else if(a==1)
            q = 16'haee0;
        else if(a==2)
            q = 16'h27d4;
        else if(a==3)
            q = 16'h5a0e;
        else if(a==4)
            q = 16'h2066;
        else if(a==5)
            q = 16'h64ce;
        else if(a==6)
            q = 16'hc526;
        else if(a==7)
            q = 16'h2f19;
    end
endmodule
