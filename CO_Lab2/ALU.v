// Class: 109暑 計算機組織 蔡文錦
// Author: 陳品劭 109550206
// Date: 20210723

`include "MUX_4to2.v" 
`include "MUX_2to1.v" 
`include "ALU31.v" 
`include "MUX_2to1_32bit.v" 
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
	wire [32:1] carry; 
	wire set;
	//ALU0 carryIn is invertB, Get set from ALU31
	ALU_1bit ALU0( result[0], carry[1], aluSrc1[0], aluSrc2[0], invertA, invertB, operation, invertB, set );
	//Generate 1~30ALU
	genvar i;
	generate
		for(i = 1; i < 31; i = i + 1)
			ALU_1bit ALU_bit( result[i], carry[i + 1], aluSrc1[i], aluSrc2[i], invertA, invertB, operation, carry[i], 1'b0 );
	endgenerate
	//ALU31
	ALU31 ALU_31( result[31], carry[32], aluSrc1[31], aluSrc2[31], invertA, invertB, operation, carry[31], 1'b0 , set, overflow );
	//Get zero
	nor (zero, result[0], result[1], result[2], result[3], result[4], result[5], result[6], result[7], result[8], result[9], result[10], result[11], result[12], result[13], result[14], result[15], result[16], result[17], result[18], result[19], result[20], result[21], result[22], result[23], result[24], result[25], result[26], result[27], result[28], result[29], result[30], result[31]);
	//
endmodule