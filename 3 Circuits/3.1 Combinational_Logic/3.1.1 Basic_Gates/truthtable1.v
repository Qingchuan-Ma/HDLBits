module top_module( 
    input x3,
    input x2,
    input x1,  // three inputs
    output f   // one output
);
    
    assign f = ({x3, x2, x1}==3'b000) ?0 :
        ({x3, x2, x1}==3'b001) ?0  :
        ({x3, x2, x1}==3'b010) ?1  :
        ({x3, x2, x1}==3'b011) ?1  :
        ({x3, x2, x1}==3'b100) ?0  :
        ({x3, x2, x1}==3'b101) ?1  :
        ({x3, x2, x1}==3'b110) ?0  :
        ({x3, x2, x1}==3'b111) ?1  : 0;

endmodule
