module lfsr_memoryMap(
	input								CLOCK_50,
	inout [15:0]					BUS,
	input [31:0]					address,
	input writeEn,
	input outputEn,
	output readDone
	);
	parameter BASE = 0;
	
	reg readDone_internal;
	reg [31:0] d;

	assign cs = (address == BASE);
	
	always @(posedge CLOCK_50) begin
		if(writeEn&cs) begin
			d <= BUS;
		end
		else begin
			d <= {
			d[0],
			d[31],
			d[30]^d[0],
			d[29],
			d[28],
			d[27],
			d[26]^d[0],
			d[25]^d[0],
			d[24],
			d[23],
			d[22],
			d[21],
			d[20],
			d[19],
			d[18],
			d[17],
			d[16],
			d[15],
			d[14],
			d[13],
			d[12],
			d[11],
			d[10],
			d[9],
			d[8],
			d[7],
			d[6],
			d[5],
			d[4],
			d[3],
			d[2],
			d[1]};
		end
			
	end
	//Only takes 1 clock cycle to read
	always @ (posedge CLOCK_50) begin
		readDone_internal <= cs&!writeEn;
	end
	assign readDone = cs?readDone_internal:'bz;
	
	triState(.bus(BUS), .data(d[15:0]), .en(outputEn&cs));
	
endmodule
