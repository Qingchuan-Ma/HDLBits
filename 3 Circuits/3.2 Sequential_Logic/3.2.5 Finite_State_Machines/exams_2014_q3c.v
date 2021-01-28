module top_module (
    input clk,
    input [2:0] y,
    input x,
    output Y0,
    output z
);
    
    
    reg [2:0] next_state;
    
    assign Y0 = next_state[0];
    /*
    always @(posedge clk) begin
        Y0 <= next_state[0];
    end*/
    
    always @(*)
        case(y)
            3'b000: if(x) next_state = 3'b001; else next_state = 3'b000;
            3'b001: if(x) next_state = 3'b100; else next_state = 3'b001;
            3'b010: if(x) next_state = 3'b001; else next_state = 3'b010;
            3'b011: if(x) next_state = 3'b010; else next_state = 3'b001;
            3'b100: if(x) next_state = 3'b100; else next_state = 3'b011;
            default: next_state = 3'b000;
        endcase
    
    assign z = (y==3'b100)|(y==3'b011);

endmodule
