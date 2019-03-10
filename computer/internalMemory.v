module internalMemory(
	input[31:0] address,
	inout[15:0] data,
	output [2:0] aluState,
	input clk,
	input addressDataEn,
	input writeEn,
	input outputEn,
	output readDone
	);
	parameter BASE = 0;
	parameter LENGTH = 32768;
	wire[15:0] q;
	wire cs;
	assign cs = (address >= BASE) && ((address - BASE) < LENGTH);
	reg readDone_internal;
	
	assign data = outputEn&cs? q:'bz;
	assign aluState = q[2:0];
	
	dataMemory DM(address - BASE, data, clk, cs, writeEn&cs, q);
	
	//Only takes 1 clock cycle to read
	always @ (posedge clk) begin
		readDone_internal <= cs&!writeEn;
	end
	assign readDone = cs?readDone_internal:'bz;
	
endmodule
