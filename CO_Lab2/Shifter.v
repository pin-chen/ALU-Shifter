// Class: 109暑 計算機組織 蔡文錦
// Author: 陳品劭 109550206
// Date: 20210723

module Shifter( result, leftRight, shamt, sftSrc  );
    
  output wire[31:0] result;

  input wire leftRight;
  input wire[4:0] shamt;
  input wire[31:0] sftSrc ;
  
  /*your code here*/ 
  wire [31:0] a0, a1, a2, a3, a4, b0, b1, b2, b3, b4;
  //select left or Right
  MUX_2to1_32bit M1( b4, a4, leftRight, result );
  //shift left with every control bit with MUX_2to1_32bit
  MUX_2to1_32bit A0( sftSrc, {sftSrc[30:0],1'b0}, shamt[0], a0 );
  MUX_2to1_32bit A1( a0, {a0[29:0],2'b0}, shamt[1], a1 );
  MUX_2to1_32bit A2( a1, {a1[27:0],4'b0}, shamt[2], a2 );
  MUX_2to1_32bit A3( a2, {a2[23:0],8'b0}, shamt[3], a3 );
  MUX_2to1_32bit A4( a3, {a3[15:0],16'b0}, shamt[4], a4 );
  //shift result with every control bit with MUX_2to1_32bit
  MUX_2to1_32bit B0( sftSrc, {1'b0,sftSrc[31:1]}, shamt[0], b0 );
  MUX_2to1_32bit B1( b0, {2'b0,b0[31:2]}, shamt[1], b1 );
  MUX_2to1_32bit B2( b1, {4'b0,b1[31:4]}, shamt[2], b2 );
  MUX_2to1_32bit B3( b2, {8'b0,b2[31:8]}, shamt[3], b3 );
  MUX_2to1_32bit B4( b3, {16'b0,b3[31:16]}, shamt[4], b4 );
  //
endmodule