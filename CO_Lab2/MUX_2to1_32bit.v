module MUX_2to1_32bit(input [31:0] data0, data1, input select, output [31:0] data );
	
	MUX_2to1 M0( data0[0], data1[0], select, data[0] );
	MUX_2to1 M1( data0[1], data1[1], select, data[1] );
	MUX_2to1 M2( data0[2], data1[2], select, data[2] );
	MUX_2to1 M3( data0[3], data1[3], select, data[3] );
	MUX_2to1 M4( data0[4], data1[4], select, data[4] );
	MUX_2to1 M5( data0[5], data1[5], select, data[5] );
	MUX_2to1 M6( data0[6], data1[6], select, data[6] );
	MUX_2to1 M7( data0[7], data1[7], select, data[7] );
	MUX_2to1 M8( data0[8], data1[8], select, data[8] );
	MUX_2to1 M9( data0[9], data1[9], select, data[9] );
	MUX_2to1 M10( data0[10], data1[10], select, data[10] );
	MUX_2to1 M11( data0[11], data1[11], select, data[11] );
	MUX_2to1 M12( data0[12], data1[12], select, data[12] );
	MUX_2to1 M13( data0[13], data1[13], select, data[13] );
	MUX_2to1 M14( data0[14], data1[14], select, data[14] );
	MUX_2to1 M15( data0[15], data1[15], select, data[15] );
	MUX_2to1 M16( data0[16], data1[16], select, data[16] );
	MUX_2to1 M17( data0[17], data1[17], select, data[17] );
	MUX_2to1 M18( data0[18], data1[18], select, data[18] );
	MUX_2to1 M19( data0[19], data1[19], select, data[19] );
	MUX_2to1 M20( data0[20], data1[20], select, data[20] );
	MUX_2to1 M21( data0[21], data1[21], select, data[21] );
	MUX_2to1 M22( data0[22], data1[22], select, data[22] );
	MUX_2to1 M23( data0[23], data1[23], select, data[23] );
	MUX_2to1 M24( data0[24], data1[24], select, data[24] );
	MUX_2to1 M25( data0[25], data1[25], select, data[25] );
	MUX_2to1 M26( data0[26], data1[26], select, data[26] );
	MUX_2to1 M27( data0[27], data1[27], select, data[27] );
	MUX_2to1 M28( data0[28], data1[28], select, data[28] );
	MUX_2to1 M29( data0[29], data1[29], select, data[29] );
	MUX_2to1 M30( data0[30], data1[30], select, data[30] );
	MUX_2to1 M31( data0[31], data1[31], select, data[31] );
	
endmodule