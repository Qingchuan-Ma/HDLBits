module top_module(
    input clk,
    input load,
    input [511:0] data,
    output [511:0] q
); 

    wire [511:0] Q2,Q1,Q0;
    assign Q2 = {1'b0, q[511:1]};
    assign Q1 = q;
    assign Q0 = {q[510:0],1'b0};
    always @(posedge clk) begin
        if(load)
            q <= data;
        else
            //    left Q2             rightQ0          center Q1
            //   {1'b0, q[511:1]} {q[510:0],1'b0} q;
            q <=  (~Q1&Q0)|(~Q2&Q1)|(Q1&~Q0);
    end
endmodule
