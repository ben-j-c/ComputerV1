module hex_output(input CLOCK_50, service, output[6:0] HEX0, HEX1, HEX2, HEX3, input [15:0] data, output DE, DRW);
	
	assign DE = 1;
	assign DRW = 0;
	
	bcdToHex(data[3:0], HEX0);
	bcdToHex(data[7:4], HEX1);
	bcdToHex(data[11:8], HEX2);
	bcdToHex(data[15:12], HEX3);
	
endmodule
