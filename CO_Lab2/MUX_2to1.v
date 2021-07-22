// Class: 109暑 計算機組織 蔡文錦
// Author: 陳品劭 109550206
// Date: 20210723
module MUX_2to1(input data0, data1, select, output data );
	wire X, Y;
	
	and (X, data0, ~select),
		(Y, data1, select);
	or	(data, X, Y);
	
endmodule