// Class: 109暑 計算機組織 蔡文錦
// Author: 陳品劭 109550206
// Date: 20210723
module ALU_1bit( result, carryOut, a, b, invertA, invertB, operation, carryIn, less ); 
  
  output wire result;
  output wire carryOut;
  
  input wire a;
  input wire b;
  input wire invertA;
  input wire invertB;
  input wire[1:0] operation;
  input wire carryIn;
  input wire less;
  
  /*your code here*/ 
  reg A, B;
  reg Result;
  //InvertA select
  always@(*)
	case(invertA)
		1'b0 : A = a;
		1'b1 : A = ~a;
	endcase
  //InvertB select
  always@(*)
	case(invertB)
		1'b0 : B = b;
		1'b1 : B = ~b;
	endcase
  //Doing adder
  wire add;
  Full_adder FA(add, carryOut, carryIn, A, B);
  //select the result of 4 type data bt operation
  always@(*)
	case(operation)
		2'b00 : Result = A | B;
		2'b01 :	Result = A & B;
		2'b10 :	Result = add;
		2'b11 :	Result = less;
	endcase
  //Get result
  assign result = Result;
  //
endmodule