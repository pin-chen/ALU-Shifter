module MUX_2to1(input data0, data1, select, output data );
	wire X, Y;
	
	and (X, data0, ~select),
		(Y, data1, select);
	or	(data, X, Y);
	
endmodule