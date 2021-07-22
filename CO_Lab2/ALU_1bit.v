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
  wire A, B;
  MUX_2to1 M1(a, ~a, invertA, A);
  MUX_2to1 M2(b, ~b, invertB, B);
  
  wire Or, And, Add;
  or (Or, A, B);
  and (And, A, B);
  Full_adder M(Add, carryOut, carryIn, A, B);
  
  MUX_4to2 M3({Or, And, Add, less}, operation, result );
  //
endmodule