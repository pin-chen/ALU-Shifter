// Class: 109暑 計算機組織 蔡文錦
// Author: 陳品劭 109550206
// Date: 20210723
module ALU( result, zero, overflow, aluSrc1, aluSrc2, invertA, invertB, operation );
   
	output wire[31:0] result;
	output wire zero;
	output wire overflow;

	input wire[31:0] aluSrc1;
	input wire[31:0] aluSrc2;
	input wire invertA;
	input wire invertB;
	input wire[1:0] operation;

	/*your code here*/
	wire set;
	wire [32:1] carry; 
	//ALU0 carryIn is invertB and Get set from ALU31
	ALU_1bit ALU0( result[0], carry[1], aluSrc1[0], aluSrc2[0], invertA, invertB, operation, invertB, set );
	//ALU1~AlU31 generate
	genvar i;
	generate
		for(i = 1; i < 32; i = i + 1)
			ALU_1bit ALU_bit( result[i], carry[i + 1], aluSrc1[i], aluSrc2[i], invertA, invertB, operation, carry[i], 1'b0 );
	endgenerate
	//Get set
	reg SET;
	always@(*)
		case({aluSrc1[31], aluSrc2[31]})
			2'b00 : SET = aluSrc1 < aluSrc2 ? 1'b1 : 1'b0;
			2'b01 : SET = 1'b0;
			2'b10 : SET = 1'b1;
			2'b11 : SET = aluSrc1 < aluSrc2 ? 1'b1 : 1'b0;
		endcase
	assign set = SET;
	//Get overflow
	assign overflow = (carry[31] ^ carry[32]) & operation[1] & ~operation[0];
	//Get zero
	reg Zero;
	always@(*)
		if(result == 32'b0) Zero = 1'b1;
		else Zero = 1'b0;
	assign zero = Zero;
	//
endmodule