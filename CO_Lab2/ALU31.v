// Class: 109暑 計算機組織 蔡文錦
// Author: 陳品劭 109550206
// Date: 20210723
module ALU31( result, carryOut, a, b, invertA, invertB, operation, carryIn, less, set, overflow ); 
  
  output wire result;
  output wire carryOut;
  output wire set;
  output wire overflow;
  
  input wire a;
  input wire b;
  input wire invertA;
  input wire invertB;
  input wire[1:0] operation;
  input wire carryIn;
  input wire less;
  
  /*your code here*/ 
  wire A, B;
  //select invert with MUX_2to1
  MUX_2to1 M1(a, ~a, invertA, A);
  MUX_2to1 M2(b, ~b, invertB, B);
  //or and adder gate set
  wire Or, And, Add;
  or (Or, A, B);
  and (And, A, B);
  Full_adder FA(Add, carryOut, carryIn, A, B);
  //select set
  MUX_4to2 M3({Add, 1'b0, 1'b1, Add}, {a, b}, set );
  //select result by operation with MUX_4to2
  MUX_4to2 M4({Or, And, Add, less}, operation, result );
  //Know overflow from the higher two carry
  wire Over;
  xor (Over, carryIn, carryOut);
  MUX_4to2 M5({1'b0, 1'b0, Over, Over}, operation, overflow);
  //
endmodule