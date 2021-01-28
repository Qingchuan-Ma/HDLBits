module top_module (
    input clk,
    input reset,   // Synchronous reset
    input s,
    input w,
    output z
);

    parameter A=1'b0, B=1'b1;
    reg state, next_state;
    always @(posedge clk) begin
        if(reset)
            state <= A;
        else
            state <= next_state;
    end
    
    always @(*) begin
        case(state)
            A: if(s) next_state = B; else next_state = A;
            B: next_state = B;
        endcase
    end
    
    reg [1:0] counter;
    always @(posedge clk) begin
        if(reset)
            counter <= 2'b0;
        else if(state==B)
            if(counter == 2'b10)
                counter <= 2'b0;
        	else
                counter <= counter + 1'b1;
    end
    
    reg [2:0] w_sample;
    always @(posedge clk) begin
        if(reset)
            w_sample <= 3'b000;
        if(state==B) begin
            w_sample[0] <= w;
            w_sample[2:1] <= w_sample[1:0];
        end
    end
    
    reg w_true;
    always @(w_sample)
        case(w_sample)
            3'b011, 3'b110, 3'b101: w_true = 1;
            default: w_true = 0;
        endcase
    
    always @(posedge clk) begin
        if(reset)
            z <= 0;
        else if(counter == 2'b10)
            case({w_sample[1:0],w})
                3'b011, 3'b110, 3'b101: z <= 1;
                default: z <= 0;
        	endcase
        else 
            z <= 0;
    end
    
endmodule
