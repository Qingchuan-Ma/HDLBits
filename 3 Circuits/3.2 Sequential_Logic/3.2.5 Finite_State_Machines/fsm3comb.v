module top_module(
    input in,
    input [1:0] state,
    output [1:0] next_state,
    output out); //

    parameter A=0, B=1, C=2, D=3;

    // State transition logic: next_state = f(state, in)
    always @(*) begin
        case(state)
            A: if(in) next_state = B; else next_state = A;
            B: if(in) next_state = B; else next_state = C;
            C: if(in) next_state = D; else next_state = A;
            D: if(in) next_state = B; else next_state = C;
        endcase
    end

    // Output logic:  out = f(state) for a Moore state machine
    assign out = (state == A) ? 0:
        (state == B) ? 0:
        (state == C) ? 0:
        (state == D) ? 1: 1'bx;
        

endmodule
