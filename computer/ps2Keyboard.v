module ps2Keyboard(
	inout 		          		PS2_CLK,
	inout 		          		PS2_CLK2,
	inout 		          		PS2_DAT,
	inout 		          		PS2_DAT2,
	input								CLOCK_50,
	output 							DRW,
	output							DE,
	input								port_service,
	output [15:0]					port_data,
	output [7:0]					LED
	);
	reg [7:0] data;
	reg [2:0] shifts;
	reg parity_generated;
	reg parity_recieved;
	wire byteReadyForWrite, bufferEmpty, readByte;
	wire [7:0] fifoOut, bytesUsed;
	
	reg[2:0] state;
	parameter IDLE_START = 0, DATA = 1, PARITY = 2, STOP = 3, PARITY_ERROR = 4, STOP_ERROR = 5, START_ERROR = 6;
	reg error;
	
	assign LED = data;
	
	fifoBuffer	fifoBuffer_inst (
		.data ( data ),
		.rdclk ( CLOCK_50 ),
		.rdreq ( readByte ),
		.wrclk ( CLOCK_50 ),
		.wrreq ( byteReadyForWrite ),
		.q ( fifoOut ),
		.rdempty ( bufferEmpty ),
		.rdusedw (bytesUsed)
		
	);
	
	
	assign port_data = {8'b0, fifoOut};
	assign DRW = readByte;
	assign DE = readByte;
	assign readByte = (!bufferEmpty) & (!port_service);
	
	always @(negedge PS2_CLK) begin
		if(state == IDLE_START) begin
			if(~PS2_DAT) begin
				state <= DATA;
				parity_generated <= 1;
			end
		end
		else if(state == DATA) begin
			parity_generated <= parity_generated^PS2_DAT;
			data[6:0] <= data[7:1];
			data[7] <= PS2_DAT;
			
			shifts <= shifts + 1;
			
			if(((shifts + 1)&3'b111) == 3'b0)
				state <= PARITY;
			else
				state <= DATA;
		end
		else if(state == PARITY) begin
			parity_recieved <= PS2_DAT;
			state <= STOP;
		end
		else if(state == STOP) begin
				state <= IDLE_START;
		end
	end
	
	edgeDetect(state == STOP, CLOCK_50, byteReadyForWrite);
	
endmodule

module edgeDetect(input x, clk, output z);
	reg pastValue[1:0];
	assign z = pastValue[0]&(~pastValue[1]);
	
	always @(posedge clk) begin
		pastValue[0] <= x;
		pastValue[1] <= pastValue[0];
	end
	
endmodule

