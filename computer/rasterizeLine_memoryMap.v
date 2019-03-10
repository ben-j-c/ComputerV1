module rasterizeLine_memoryMap(
	input								CLOCK_50,
	inout [15:0]					BUS,
	input [31:0]					address,
	input writeEn,
	input outputEn
	);
	parameter BASE = 0;
	parameter WAIT = 0, ROW1_MULT1 = 1, ROW1_MULT2 = 2, ROW1_SUM1 = 3, ROW1_SUM2 = 4;
	
	reg [15:0] inputMemory[16];
	reg [15:0] outputMemory[2];
	reg [15:0] outputBuffer_in, outputBuffer_out, m1, m2, m3;
	reg [7:0] state;
	reg [255:0] pipePosition;
	reg zChange, matChange;
	wire [15:0] inBankAddress, outBankAddress, ax, ay, az, bx, by, bz, cx, cy, cz, ez;
	wire [15:0] matR1 [3];
	wire [15:0] matR2 [3];
	wire [15:0] matR3 [3];
	wire cs_input;
	wire cs_output;
	
	assign cs_input = (address >= BASE) & (address < (BASE + 19));
	assign cs_output = (address == (BASE + 19)) | (address == (BASE + 20));
	
	assign inBankAddress = address - BASE; 
	assign outBankAddress = address - (BASE + 16);
	
	triState(.BUS(BUS), .data(outputBuffer_in), .en(cs_input));
	triState(.BUS(BUS), .data(outputBuffer_out), .en(cs_output));
	
	assign ax = inputMemory[0];
	assign ay = inputMemory[1];
	assign az = inputMemory[2];
	
	assign bx = inputMemory[3];
	assign by = inputMemory[4];
	assign bz = inputMemory[5];
	
	assign matR1[0] = inputMemory[6];
	assign matR1[1] = inputMemory[7];
	assign matR1[2] = inputMemory[8];
	assign matR2[0] = inputMemory[9];
	assign matR2[1] = inputMemory[10];
	assign matR2[2] = inputMemory[11];
	assign matR3[0] = inputMemory[12];
	assign matR3[1] = inputMemory[13];
	assign matR3[2] = inputMemory[14];
	
	assign ez = inputMemory[15];
	
	assign cx = inputMemory[16];
	assign cy = inputMemory[17];
	assign cz = inputMemory[18];
	
	
	always @ (posedge CLOCK_50) begin
		if(cs_input) begin
			if(writeEn) begin
				inputMemory[inBankAddress] <= BUS;
			end
			
			outputBuffer_in <= inputMemory[inBankAddress];
		end
		else if(cs_output) begin
			if(writeEn)
				outputMemory[inBankAddress] <= BUS;
			
			outputBuffer_out <= outputMemory[outBankAddress];
		end
	end
	
endmodule

module clipToZPlane(input[15:0] ax, ay, az, bx, by, bz, input clk, output[15:0] newBx, newBy, newBz, input reset);
	wire [15:0] dxResult, dyResult, dzResult, dxBuf, dyBuf, dzBuf, scaleZ, azBuf, axLong, ayLong, azLong;
	wire [15:0] relativeX, relativeY, relativeZ;
	
	sub_half dx(clk, reset, bx, ax, dxResult);
	sub_half dy(clk, reset, by, ay, dxResult);
	sub_half dz(clk, reset, bz, az, dxResult);
	pipeProgress #(16,2) delayAz({!az[15],az[14:0]}, clk, azBuf);
	
	div_half rescaleFact(clk, reset, azBuf, dzResult, scaleZ);
	pipeProgress #(16,2) delayDx(dxResult[15:0], clk, reset, dxBuf);
	pipeProgress #(16,2) delayDy(dyResult[15:0], clk, reset, dyBuf);
	pipeProgress #(16,2) delayDz(dzResult[15:0], clk, reset, dzBuf);
	
	mult_half rescaleX(clk, reset, dxBuf, scaleZ, relativeX);
	mult_half rescaleY(clk, reset, dyBuf, scaleZ, relativeY);
	mult_half rescaleZ(clk, reset, dzBuf, scaleZ, relativeZ);
	pipeProgress #(16,6) longAx(ax[15:0], clk, axLong);
	pipeProgress #(16,6) longAy(ay[15:0], clk, ayLong);
	pipeProgress #(16,6) longAz(az[15:0], clk, azLong);
	
	add_half resultx(clk, reset, axLong, relativeX, newBx);
	add_half resulty(clk, reset, ayLong, relativeY, newBy);
	add_half resultz(clk, reset, azLong, relativeZ, newBz);
	
endmodule
