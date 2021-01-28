module top_module (
    input clk,
    input reset,
    input enable,
    output [3:0] Q,
    output c_enable,
    output c_load,
    output [3:0] c_d
); //

    count4 the_counter (clk, c_enable, c_load, c_d, Q  /*, ... */ );
    
    assign c_enable = enable;
    assign c_load = reset ? 1:
        ((Q == 4'd12)&enable)? 1: 0;
    assign c_d = 1;

endmodule
