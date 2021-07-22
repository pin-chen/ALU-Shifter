module MUX_2to1(input data0, data1, select, output data );
	wire _select;
	wire X, Y;
	
	not (_select, select);
	and (X, data0, _select),
		(Y, data1, select);
	or	(data, X, Y);
endmodule