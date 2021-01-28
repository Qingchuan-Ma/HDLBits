module top_module();

    reg clk, in; 
    reg [2:0] s;
    wire out;
    q7 u(clk, in, s, out);
    
    initial begin
        clk = 0;
        forever clk = #5 ~clk;
    end
    initial begin
        in = 0;
        #20 in = 1;
        #10 in = 0;
        #10 in = 1;
        #30 in = 0;
    end
    initial begin
        s = 2;
        #10 s = 6;
        #10 s = 2;
        #10 s = 7;
        #10 s = 0;
    end
    
endmodule
