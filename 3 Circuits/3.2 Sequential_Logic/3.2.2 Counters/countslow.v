module top_module (
    input clk,
    input slowena,
    input reset,
    output [3:0] q);

    always @(posedge clk)
        if(reset)
            q <= 0;
    	else if(slowena)
            if(q == 9)
                q <= 0;
    		else
                q <= q + 1;
        
endmodule
