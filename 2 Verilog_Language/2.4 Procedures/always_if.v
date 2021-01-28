// synthesis verilog_input_version verilog_2001
module top_module(
    input a,
    input b,
    input sel_b1,
    input sel_b2,
    output wire out_assign,
    output reg out_always   ); 

    assign out_assign = ({sel_b1, sel_b2} == 2'b00)? a : 
        ({sel_b1, sel_b2} == 2'b01)? a : 
        ({sel_b1, sel_b2} == 2'b10)? a : 
        ({sel_b1, sel_b2} == 2'b11)? b : 1'bx;
    
    always @(*) begin
        if({sel_b1, sel_b2} == 2'b00)
            out_always = a;
        else if({sel_b1, sel_b2} == 2'b01)
            out_always = a;
        else if({sel_b1, sel_b2} == 2'b10)
            out_always = a;
        else 
            out_always = b;
    end
    
endmodule
