#include <iostream>
#include <fstream>

using namespace std;

int main(){
	string s = "	MUX_2to1 M0(input data0[0], data1[0], select, output data[0] );";
	fstream fout;
	
	fout.open("Shifter.txt", ios::out);
	
	for(int i = 0; i < 32; i++){
		fout << "	MUX_2to1 M"<<i<<"( data0["<<i<<"], data1["<<i<<"], select, data["<<i<<"] );\n";
	}
	fout.close();
	return 0;
} 
