module top_module(
    input clk,
    input in,
    input reset,    // Synchronous reset
    output [7:0] out_byte,
    output done
); //

    // Use FSM from Fsm_serial
    parameter idle = 2'd0, wrong = 2'd1, data = 2'd2, don = 2'd3;
    reg [1:0] state, next_state;
    
    always @(posedge clk) begin
        if(reset)
            state <= 2'b0;
        else
            state <= next_state;
    end
    
    reg in_reg;
    always @(posedge clk) begin
        in_reg <= in;
    end
    
    wire done_cap, reset_cap;
    assign done_cap = (state==don) & in;
    assign reset_cap = (state==wrong) & in;
    always @(*) begin
        case(state)
            idle: if(~in) next_state = data; else next_state = idle;
            data: if(data_done) next_state = don; else next_state = data;
            don: if(done_cap) next_state = idle; else next_state = wrong;
            wrong: if(reset_cap) next_state=idle; else next_state = wrong;
        endcase
    end
    
    reg [2:0] data_counter;
    wire data_done;
    assign data_done = (data_counter == 3'd7);
    always @(posedge clk) begin
        if(state==data)
            data_counter <= data_counter + 1'b1;
        else
            data_counter <= 3'b0;
    end
    
    always @(posedge clk) begin
        if(state==don)
            if(in==1'b1) begin
                done <= 1;
                out_byte <= recvdata;
            end else begin
                out_byte <= 0;
                done <= 0;
            end
        else begin
            out_byte <= 0;
            done <= 0;
        end
    end

    // New: Datapath to latch input bits.
    reg [7:0] recvdata;
    always @(posedge clk) begin
        if(state==idle)
            recvdata <= 0;
    	else if(state==data)
            recvdata <= {in, recvdata[7:1]};
    end

endmodule
