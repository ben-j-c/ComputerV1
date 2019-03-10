module vector_memoryMap(
	input								CLOCK_50,
	inout [15:0]					BUS,
	input [31:0]					address,
	input writeEn,
	input outputEn,
	output readDone
	);
	parameter BASE = 0;
	
	wire cs_x1 ,cs_y1, cs_z1, cs_x2, cs_y2, cs_z2, cs_dot, cs_crossX, cs_crossY, cs_crossZ, cs;
	reg readDone_internal;
	
	
	reg [15:0] x1, y1, z1, x2, y2, z2;
	reg [15:0] result_crossX, result_crossY, result_crossZ, result_dot;
	
	assign cs_x1 = (address == BASE);
	assign cs_y1 = (address == (BASE + 1));
	assign cs_z1 = (address == (BASE + 2));
	assign cs_x2 = (address == (BASE + 3));
	assign cs_y2 = (address == (BASE + 4));
	assign cs_z2 = (address == (BASE + 5));
	assign cs_dot = (address == (BASE + 6));
	assign cs_crossX = (address == (BASE + 7));
	assign cs_crossY = (address == (BASE + 8));
	assign cs_crossZ = (address == (BASE + 9));
	assign cs = ((address >= BASE) & (address <= (BASE + 9)));
	
	always @(posedge CLOCK_50) begin
		result_crossX <= y1*z2 - z1*y2;
		result_crossY <= z1*x2 - x1*z2;
		result_crossZ <= x1*y2 - y1*x2;
		
		result_dot <= x1*x2 + y1*y2 + z1*z2;
	
		if(cs_x1 && writeEn)
			x1 <= BUS;
		if(cs_y1 && writeEn)
			y1 <= BUS;
		if(cs_z1 && writeEn)
			z1 <= BUS;
			
		if(cs_x2 && writeEn)
			x2 <= BUS;
		if(cs_y2 && writeEn)
			y2 <= BUS;
		if(cs_z2 && writeEn)
			z2 <= BUS;
	end
	//Only takes 1 clock cycle to read
	always @ (posedge CLOCK_50) begin
		readDone_internal <= cs&!writeEn;
	end
	assign readDone = cs?readDone_internal:'bz;
	
	triState(.bus(BUS), .data(x1), .en(outputEn&cs_x1));
	triState(.bus(BUS), .data(y1), .en(outputEn&cs_y1));
	triState(.bus(BUS), .data(z1), .en(outputEn&cs_z1));
	
	triState(.bus(BUS), .data(x2), .en(outputEn&cs_x2));
	triState(.bus(BUS), .data(y2), .en(outputEn&cs_y2));
	triState(.bus(BUS), .data(z2), .en(outputEn&cs_z2));
	
	triState(.bus(BUS), .data(result_dot), .en(outputEn&cs_dot));
	triState(.bus(BUS), .data(result_crossX), .en(outputEn&cs_crossX));
	triState(.bus(BUS), .data(result_crossY), .en(outputEn&cs_crossY));
	triState(.bus(BUS), .data(result_crossZ), .en(outputEn&cs_crossZ));
	
endmodule
