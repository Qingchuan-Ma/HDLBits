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
    reg [2:0] state, next_state, save_state;

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
    
    reg isSplatter;
    reg [5:0] counter;
    reg splatter;
    /*
    always @(*) begin
        if(state!=FALLING&isSplatter)
            
    end*/
    
    always @(posedge clk, posedge areset) begin
        if(areset) begin
            counter <= 0;
            splatter <= 0;
            isSplatter = 0;
        end else if(next_state == FALLING) begin
            counter <= counter + 1;
            if(counter == 5'd20)
                isSplatter = 1;
        end else begin
            counter <= 0;
            if(isSplatter)
                splatter <= 1;
        end 
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
    assign walk_left = (state == LEFT)&~splatter;
    assign walk_right = (state == RIGHT)&~splatter;
    assign aaah = (state == FALLING)&~splatter;
    assign digging = (state == DIGGING)&~splatter;
    
endmodule
