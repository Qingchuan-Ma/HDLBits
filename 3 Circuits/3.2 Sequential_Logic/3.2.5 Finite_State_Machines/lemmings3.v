module top_module(
    input clk,
    input areset,    // Freshly brainwashed Lemmings walk left.
    input bump_left,
    input bump_right,
    input ground,
    input dig,
    output walk_left,
    output walk_right,
    output aaah,
    output digging ); 

    parameter LEFT=0, RIGHT=1, FALLING=2, DIGGING=3; 
    reg [1:0] state, next_state, save_state;

    always @(*) begin
        // State transition logic
        case (state)
            LEFT: begin
                if(~ground) next_state = FALLING;
                else if(dig) next_state = DIGGING;
            	else if((bump_left|(bump_left&bump_right))) next_state = RIGHT; 
            	else next_state = LEFT;
            end
            RIGHT: begin
                if(~ground) next_state = FALLING;
                else if(dig) next_state = DIGGING;
            	else if((bump_right|(bump_left&bump_right))) next_state = LEFT; 
            	else next_state = RIGHT;
            end
            FALLING: if(ground) next_state = save_state;
            else next_state = FALLING;
            DIGGING: if(~ground) next_state = FALLING;
            else next_state = DIGGING;
        endcase
    end
    
    always @(posedge clk) begin
        if(state == LEFT)
            save_state = LEFT;
        else if(state == RIGHT)
            save_state = RIGHT;
    end

    always @(posedge clk, posedge areset) begin
        // State flip-flops with asynchronous reset
        if(areset) begin
            state = LEFT;
        end else begin
            state = next_state;
        end
    end
    

    // Output logic
    assign walk_left = (state == LEFT);
    assign walk_right = (state == RIGHT);
    assign aaah = (state == FALLING);
    assign digging = (state == DIGGING);
    
endmodule
