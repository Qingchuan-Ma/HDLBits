module top_module (
    input clock,
    input a,
    output p,
    output q );

    reg q1;
    always @(negedge clock) begin
        if(a==1)
        	q <= 1;
        else
            q <= 0;
    end
    
    always @(*) begin
        if(clock)
            p = a;
    end
    
endmodule
