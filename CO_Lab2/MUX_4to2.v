module MUX_4to2(input [0:3] Data, input [1:0] select, output data );

	wire X, Y;
	
	MUX_2to1 M1( X, Y, select[1], data );
	MUX_2to1 M2( Data[0], Data[1], select[0], X );
	MUX_2to1 M3( Data[2], Data[3], select[0], Y );
	
endmodule