module NAND_3 (
    input wire A, B, C,  
    output wire Y);
	 
assign Y = ~(A & B & C);

endmodule


module three_input_NAND (
    input wire A, B, C,  
    output wire Y);

wire A_inv;

assign A_inv = ~A;


NAND_3 g1 (
    .A(A_inv),
	 .B(B),
	 .C(C), 
	 .Y(Y)
	       );

endmodule
