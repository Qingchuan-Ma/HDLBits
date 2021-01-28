module top_module (
    input clk,
    input reset,   // Synchronous reset
    input x,
    output z
);

    reg [2:0] state, next_state;
    
    always @(posedge clk) begin
        if(reset)
            state <= 3'b000;
        else
            state <= next_state;
    end
    
    always @(*)
        case(state)
            3'b000: if(x) next_state = 3'b001; else next_state = 3'b000;
            3'b001: if(x) next_state = 3'b100; else next_state = 3'b001;
            3'b010: if(x) next_state = 3'b001; else next_state = 3'b010;
            3'b011: if(x) next_state = 3'b010; else next_state = 3'b001;
            3'b100: if(x) next_state = 3'b100; else next_state = 3'b011;
            default: ;
        endcase
    
    assign z = (state==3'b100)|(state==3'b011);
endmodule
