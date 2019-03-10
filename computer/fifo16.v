module fifo16(
	input [15:0] writeData,
	input clk, write, read,
	output [15:0] readData,
	output [3:0] numel
);
	reg[15:0] data[16];
	reg[3:0] inAddr, outAddr;
	wire canWrite, canRead;
	
	assign numel = inAddr - outAddr;
	assign canWrite = numel != 15;
	assign canRead = numel != 0;
	assign readData = data[outAddr];
	
	always @ (posedge clk) begin
		if(write&canWrite) begin
			data[inAddr] <= writeData;
			inAddr <= inAddr + 1;
		end
		if(read&canRead)
			outAddr <= outAddr + 1;
	end
endmodule