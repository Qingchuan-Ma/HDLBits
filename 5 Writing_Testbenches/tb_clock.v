module top_module ( );

    reg clk;
    
    dut d(clk);
    
    initial begin
        clk = 0;
        forever clk = #5 ~clk;
    end
    
endmodule
