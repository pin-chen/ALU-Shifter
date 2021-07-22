// Class: 109暑 計算機組織 蔡文錦
// Author: 陳品劭 109550206
// Date: 20210723
#include <iostream>
#include <fstream>

using namespace std;

int main(){
	string s = "ALU_1bit ALU1( result[1], carry[2], aluSrc1[1], aluSrc2[1], invertA, invertB, operation, carry[1], 0 );";
	fstream fout;
	
	fout.open("ALU.txt", ios::out);
	//Generate
	for(int i = 0; i < 32; i++){
		fout << "ALU_1bit ALU"<<i<<"( result["<<i<<"], carry["<<i+1<<"], aluSrc1["<<i<<"], aluSrc2["<<i<<"], invertA, invertB, operation, carry["<<i<<"], 1'b0 );\n";
	}
	for(int i = 0; i < 32; i++){
		fout << ", result["<<i<<"]";
	}
	fout<<"\n";
	fout.close();
	return 0;
} 
