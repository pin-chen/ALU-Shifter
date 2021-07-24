// Class: 109暑 計算機組織 蔡文錦
// Author: 陳品劭 109550206
// Date: 20210723
`timescale 1ns / 1ps
`include "ALU.v"
`include "Shifter.v"
`include "ALU_1bit.v"
`include "Full_adder.v" 
`define test_file_ALU "test1_ALU.txt"
`define test_file_Shifter "test1_Shifter.txt"
`define answer_file_ALU "ans1_ALU.txt"
`define answer_file_Shifter "ans1_Shifter.txt"
`define numOfTest 400


module TestBench();
	integer f;
	initial
		f = $fopen("error.txt","w");
	
	reg clk;
	integer i, score;
		
	reg [67:0] mem_inp_ALU[0:`numOfTest-1], mem_inp_Shifter[0:`numOfTest-1];
	reg [33:0] mem_ans_ALU[0:`numOfTest-1], mem_ans_Shifter[0:`numOfTest-1];
	reg [67:0] inp_ALU, inp_Shifter;
	reg [33:0] ans_ALU, ans_Shifter;
	
	wire zero, overflow, invertA, invertB;
	wire [1:0] operation;
	wire [4:0] shamt;
	wire [31:0] result_ALU, result_Shifter, aluSrc1, aluSrc2, sftSrc;
 
	ALU alu(result_ALU, zero, overflow, aluSrc1, aluSrc2, invertA, invertB, operation);
	Shifter shifter(result_Shifter, leftRight, shamt, sftSrc);
	
	assign aluSrc1 = inp_ALU[63:32];
	assign aluSrc2 = inp_ALU[31:0];
	assign invertA = inp_ALU[67];
	assign invertB = inp_ALU[66];
	assign operation = inp_ALU[65:64];
	
	assign leftRight = inp_Shifter[37];
	assign shamt = inp_Shifter[36:32];
	assign sftSrc = inp_Shifter[31:0];
	
	initial begin
		$dumpfile("ALU_lab2.vcd");
        $dumpvars;
	end
	
	initial begin
		clk = 0;
		score = 0;		
	    i = 0;
	  
		$readmemb( `test_file_ALU, mem_inp_ALU);
		$readmemb( `answer_file_ALU, mem_ans_ALU);
		$readmemb( `test_file_Shifter, mem_inp_Shifter);
		$readmemb( `answer_file_Shifter, mem_ans_Shifter);
		
		#((`numOfTest + 1) * 10)
		
	    $display("Correctness = %0d\/%0d \n", score, (`numOfTest * 2));	
		$finish;
		
	end
	
	always #5 clk = ~clk;
	
	always@(negedge clk) begin
					  	  
	  ans_ALU = mem_ans_ALU[i];
  	  inp_ALU = mem_inp_ALU[i];
	  ans_Shifter = mem_ans_Shifter[i];
  	  inp_Shifter = mem_inp_Shifter[i];
	  
	  i = i + 1;
	  #1
	  if (ans_ALU[33] == overflow && ans_ALU[32] == zero && ans_ALU[31:0] == result_ALU) begin
		score = score + 1;
	  end
		  
	  else begin
		$fwrite(f,"Error case ALU:\n");
		$fwrite(f,"\t TESTCASE: %68b \n", inp_ALU);	
		$fwrite(f,"Your answer: \n");
		$fwrite(f,"\t overflow: %1b \n", overflow);	
		$fwrite(f,"\t zero: %1b \n", zero);	
		$fwrite(f,"\t result: %32b \n", result_ALU);	
		$fwrite(f,"Answer: \n");
		$fwrite(f,"\t overflow: %1b \n", ans_ALU[33]);	
		$fwrite(f,"\t zero: %1b \n", ans_ALU[32]);	
		$fwrite(f,"\t result: %32b \n", ans_ALU[31:0]);	
	    $display("ALU test data #%0d is wrong\n", i);		  
	  end
	  	  
	  #1
	  if (ans_Shifter[31:0] == result_Shifter) begin
	    score = score + 1;
		//if(sftSrc[31] == 1'b1 && leftRight == 0)begin
		//	$display("Ans #%32b \n", ans_Shifter[31:0]);	
		//	$display("data #%32b \n", result_Shifter);	
		//end
	  end
		  
	  else begin
		$fwrite(f,"Error case shifter:\n");
		$fwrite(f,"\t TESTCASE: %34b \n", inp_Shifter);	
		$fwrite(f,"Your answer:\n");
		$fwrite(f,"\t sftSrc: %32b \n", result_Shifter);	
		$fwrite(f,"Answer:\n");
		$fwrite(f,"\t sftSrc: %32b \n", ans_Shifter[31:0]);	
	    $display("Shifter test data #%0d is wrong\n", i );		  
	  end
		  	  	  
	end
	

endmodule
