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
  always@(*)
	case(invertA)
		1'b0 : A = a;
		1'b1 : A = ~a;
	endcase
  
  always@(*)
	case(invertB)
		1'b0 : B = b;
		1'b1 : B = ~b;
	endcase
  
  wire add;
  Full_adder M(add, carryOut, carryIn, A, B);
  
  always@(*)
	case(operation)
		2'b00 : Result = A | B;
		2'b01 :	Result = A & B;
		2'b10 :	Result = add;
		2'b11 :	Result = less;
	endcase
	
  assign result = Result;
  //
endmodule