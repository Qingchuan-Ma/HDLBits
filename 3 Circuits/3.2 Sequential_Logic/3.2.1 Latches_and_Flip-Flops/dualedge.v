module top_module (
    input clk,
    input d,
    output q
);
	reg q1,q2;
    always @(posedge clk)
        q2 <= d;
    
    always @(negedge clk) begin
        q1 <= d;
    end
    
    assign q = clk ? q2:q1;
             
endmodule
