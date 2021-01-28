module top_module(
    input clk,
    input in,
    input areset,
    output out); //

    parameter A=0, B=1, C=2, D=3; 
    reg [1:0] state, next_state;
    
    // State transition logic

    always @(*) begin
        // State transition logic
        case(state)
            A: if(in) next_state = B; else next_state = A;
            B: if(in) next_state = B; else next_state = C;
            C: if(in) next_state = D; else next_state = A;
            D: if(in) next_state = B; else next_state = C;
        endcase
    end

    // State flip-flops with asynchronous reset
    always @(posedge clk, posedge areset) begin
        // State flip-flops with asynchronous reset
        if(areset)
            state <= A;
        else
            state <= next_state;
    end


    // Output logic
    assign out = (state == D)?1:0;
endmodule
