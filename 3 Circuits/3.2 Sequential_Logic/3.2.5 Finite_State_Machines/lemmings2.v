module top_module(
    input clk,
    input areset,    // Freshly brainwashed Lemmings walk left.
    input bump_left,
    input bump_right,
    input ground,
    output walk_left,
    output walk_right,
    output aaah ); 

    parameter LEFT=0, RIGHT=1, FALLING=2; 
    reg [1:0] state, next_state, save_state;

    always @(*) begin
        // State transition logic
        case (state)
            LEFT: begin save_state = LEFT;
                if(~ground) begin next_state = FALLING; end
            	else if((bump_left|(bump_left&bump_right))) next_state = RIGHT; 
            	else next_state = LEFT;
            end
            RIGHT: begin save_state = RIGHT;
                if(~ground) begin next_state = FALLING; end
            	else if((bump_right|(bump_left&bump_right))) next_state = LEFT; 
            	else next_state = RIGHT;
            end
            FALLING: if(ground) next_state = save_state;
            else next_state = FALLING;
        endcase
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

endmodule
