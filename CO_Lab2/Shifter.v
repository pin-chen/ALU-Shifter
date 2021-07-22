module Shifter( result, leftRight, shamt, sftSrc  );
    
  output wire[31:0] result;

  input wire leftRight;
  input wire[4:0] shamt;
  input wire[31:0] sftSrc ;
  
  /*your code here*/ 
  reg [31:0] Result;
  always@(*)
  case(leftRight)
	1'b0 : Result = sftSrc >> shamt;
	1'b1 : Result = sftSrc << shamt;
  endcase
  assign result = Result;
  
endmodule