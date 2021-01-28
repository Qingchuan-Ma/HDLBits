module top_module ();

    reg clk, reset, t, q;
    tff u(clk,reset,t,q);
    
    initial begin
        clk = 0;
        forever clk =  #5 ~clk;
    end
    
    initial begin
        reset = 1;
        t = 0;
        #10 reset = 0;
        t = 1;
    end
endmodule
