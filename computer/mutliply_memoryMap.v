module multiply_memoryMap(
	input								CLOCK_50,
	inout [15:0]					BUS,
	input [31:0]					address,
	input writeEn,
	input outputEn,
	output readDone
	);
	parameter BASE = 0;
		
	wire cs_input1, cs_input2;
	wire cs_output;
	wire cs;
	reg readDone_internal;
	
	reg [15:0] input1, input2;
	reg [15:0] result;
	
	assign cs_input1 = (address == BASE);
	assign cs_input2 = (address == (BASE + 1));
	assign cs_output = (address == (BASE + 2));
	assign cs = cs_input1|cs_output|cs_input2;
	
	always @(posedge CLOCK_50) begin
		result <= input1*input2;
		
		if(cs_input1 && writeEn)
			input1 <= BUS;
		if(cs_input2 && writeEn)
			input2 <= BUS;
	end
	//Only takes 1 clock cycle to read
	always @ (posedge CLOCK_50) begin
		readDone_internal <= cs&!writeEn;
	end
	assign readDone = cs?readDone_internal:'bz;
	
	
	triState(.bus(BUS), .data(input1), .en(outputEn&cs_input1));
	triState(.bus(BUS), .data(input2), .en(outputEn&cs_input2));
	triState(.bus(BUS), .data(result), .en(outputEn&cs_output1));
endmodule

