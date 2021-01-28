module top_module ( 
    input clk, 
    input [7:0] d, 
    input [1:0] sel, 
    output [7:0] q 
);
    wire [7:0] q0,q1,q2;
    my_dff8 dff1(clk, d, q0);
    my_dff8 dff2(clk, q0, q1);
    my_dff8 dff3(clk, q1, q2);
    
    
    /*assign q = 	(sel==2'b00) ? d :
        (sel==2'b01) ? q0 : 
        (sel==2'b10) ? q1 : 
        (sel==2'b11) ? q2 : 2'bxx;*/
    always @(*)
        case(sel)
            2'b00: q = d;
            2'b01: q = q0;
            2'b10: q = q1;
            2'b11: q = q2;
        endcase
        
endmodule
