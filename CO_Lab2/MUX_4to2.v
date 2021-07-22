// Class: 109暑 計算機組織 蔡文錦
// Author: 陳品劭 109550206
// Date: 20210723
module MUX_4to2(input [0:3] Data, input [1:0] select, output data );

	wire X, Y;
	//Combine with 3 MUX_2to1
	MUX_2to1 M1( X, Y, select[1], data );
	MUX_2to1 M2( Data[0], Data[1], select[0], X );
	MUX_2to1 M3( Data[2], Data[3], select[0], Y );
	
endmodule