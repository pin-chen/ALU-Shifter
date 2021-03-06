// Class: 109暑 計算機組織 蔡文錦
// Author: 陳品劭 109550206
// Date: 20210723
#include <iostream>
#include <fstream>
#include <time.h>
#include <bitset>
#include <string> 
#define num_of_test 400
using namespace std;

int main(){
	string s = "ALU_1bit ALU1( result[1], carry[2], aluSrc1[1], aluSrc2[1], invertA, invertB, operation, carry[1], 0 );";
	fstream fout;
	fstream AnsOut;
	
	fstream Sout;
	fstream AnsShift;
	
	fout.open("test1_ALU.txt", ios::out);
	AnsOut.open("ans1_ALU.txt", ios::out);
	
	Sout.open("test1_Shifter.txt", ios::out);
	AnsShift.open("ans1_Shifter.txt", ios::out);
	
	string OP[] = {"0010","0110","0001","0000","1100","1101","0111"};
	
	int T = 1;
	
	srand(time(NULL));
	for(int j= 0 ; j < num_of_test;j ++){
		unsigned int sht = 0, shamt = 0;
		for(int i = 0; i < 32; i++){
			int x = rand()%(2) - 0;
			if(x) sht += T << i; 
		}
		for(int i = 0; i < 5; i++){
			int x = rand()%(2) - 0;
			if(x) shamt += T << i; 
		}
		int leftRight = rand()%(2) - 0;
		Sout << leftRight << bitset<5>(shamt) << bitset<32>(sht) << endl;
		int result;
		if(leftRight==0) result = sht >> shamt;
		else result = sht << shamt;
		AnsShift << bitset<32>(result) << '\n'; 
	}
	
	for(int j= 0 ; j < num_of_test;j ++){
		
		int z = rand()%(7) - 0;
		fout << OP[z];
		
		int src1 = 0;
		int src2 = 0;
		for(int i = 0; i < 32; i++){
			int x = rand()%(2) - 0;
			int y = rand()%(2) - 0;
			if(x) src1 += T << i; 
			if(y) src2 += T << i;
		}
		fout  << bitset<32>(src1) << bitset<32>(src2) << endl;
		int result;
		int overflow = 0;
		if(z == 0){
			result = src1 + src2;
			if(src1 > 0 && src2 > 0 && result < 0) overflow = 1;
			else if(src1 < 0 && src2 < 0 && result > 0) overflow = 1;
		}else if(z==1){
			result = src1 - src2;
			if(src1 > 0 && src2 < 0 && result < 0) overflow = 1;
			else if(src1 < 0 && src2 > 0 && result > 0) overflow = 1;
		}else if(z==2){
			result = src1 & src2;
		}else if(z==3){
			result = src1 | src2;
		}else if(z==4){
			result = ~(src1 & src2);
		}else if(z==5){
			result = ~(src1 | src2);
		}else{
			result = src1 - src2;
			if(src1 > 0 && src2 < 0 && result < 0) overflow = 1;
			else if(src1 < 0 && src2 > 0 && result > 0) overflow = 1;
			result = (src1 < src2) ? 1 : 0;
		}
		int zero;
		if(result == 0) zero = 1;
		else zero = 0;
		AnsOut << overflow << zero << bitset<32>(result)<<'\n';
	}
	AnsShift.close();
	Sout.close();
	AnsOut.close();
	fout.close();
	system("iverilog -o Lab2 Testbench.v");
	system("vvp Lab2");
	system("PAUSE");
	return 0;
} 
