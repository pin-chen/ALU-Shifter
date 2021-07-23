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
	//ALU1~AlU30 generate
	genvar i;
	generate
		for(i = 1; i < 31; i = i + 1)
			ALU_1bit ALU_bit( result[i], carry[i + 1], aluSrc1[i], aluSrc2[i], invertA, invertB, operation, carry[i], 1'b0 );
	endgenerate
	//ALU31 
	reg A, B;
	reg Result;
	always@(*)
	case(invertA)
		1'b0 : A = aluSrc1[31];
		1'b1 : A = ~aluSrc1[31];
	endcase
	always@(*)
	case(invertB)
		1'b0 : B = aluSrc2[31];
		1'b1 : B = ~aluSrc2[31];
	endcase
	//ALU31 get set from adder
	Full_adder M(set, carry[32], carry[31], A, B);
	always@(*)
	case(operation)
		2'b00 : Result = A | B;
		2'b01 :	Result = A & B;
		2'b10 :	Result = set;
		2'b11 :	Result = 1'b0;
	endcase
	assign result[31] = Result;
	//Get overflow
	assign overflow = carry[31] ^ carry[32];
	//Get zero
	reg Zero;
	always@(*)
		if(result == 32'b0) Zero = 1'b1;
		else Zero = 1'b0;
	assign zero = Zero;
	//
endmodule