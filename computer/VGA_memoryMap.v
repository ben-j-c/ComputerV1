module VGA_memoryMap(
	input CLOCK_50,
	inout[15:0] data, //bus
	input[31:0] address,
	input addressDataEn,
	input writeEn,
	input outputEn,
	output[7:0] VGA_R, VGA_G, VGA_B,
	output VGA_CLK, VGA_BLANK, VGA_HS, VGA_VS, VGA_SYNC,
	output readDone
	);
	parameter BASE = 32768;
	parameter LENGTH = 4800;
	parameter BASE2 = 65536;
	
	wire cs, DISP, VGA_CLK_internal;
	wire[7:0] qText, qColour, crDelay_q, cgDelay_q, cbDelay_q;
	wire[7:0] C_R, S_R;// Colour red, secondary red
	wire[7:0] C_G, S_G;
	wire[7:0] C_B, S_B;
	wire[9:0] X, Y, xDelay_q, yDelay_q;
	wire[12:0] readAddr;
	wire[15:0] q_a, q_b, charDelay_q;
	reg readDone_internal;
	
	assign cs = (address >= BASE) && ((address - BASE) < LENGTH);
	assign data = (outputEn&cs)? q_a:'bz;
	assign qText = q_b[7:0];
	assign qColour = q_b[15:8];
	
	MemoryMapped textPage(
		.clock_a(CLOCK_50),
		.clock_b(VGA_CLK),
		.address_a(address),
		.address_b(readAddr),
		.data_a(data),
		.data_b(0),
		.wren_a(writeEn&cs),
		.wren_b(0),
		.q_a(q_a),
		.q_b(q_b)
	);
	//Only takes 1 clock cycle to read
	always @ (posedge CLOCK_50) begin
		readDone_internal <= cs&!writeEn;
	end
	assign readDone = cs?readDone_internal:'bz;
	
	addrConversion linearMapping(X[9:3],Y[9:3],readAddr);
	VGA display(
		.C_R(crDelay_q ^ {S_R, 4'b0}),
		.C_G(cgDelay_q ^ {S_G, 4'b0}),
		.C_B(cbDelay_q ^ {S_B, 4'b0}),
		.CLOCK_50(CLOCK_50),
		.VGA_R(VGA_R),
		.VGA_G(VGA_G),
		.VGA_B(VGA_B),
		.VGA_CLK(VGA_CLK),
		.VGA_BLANK(VGA_BLANK),
		.VGA_HS(VGA_HS),
		.VGA_VS(VGA_VS),
		.VGA_SYNC(VGA_SYNC),
		.X(X),
		.Y(Y),
		.DISP(DISP)
		
	);
	
	pipeProgress #(10,2) xDelay(.clk(VGA_CLK), .reset(0), .d(X), .q(xDelay_q));
	pipeProgress #(10,2) yDelay(.clk(VGA_CLK), .reset(0), .d(Y), .q(yDelay_q));
	//pipeProgress #(16,1) charDelay(.clk(VGA_CLK), .reset(0), .d(q_b), .q(charDelay_q));
	
	pipeProgress #(8,1) crDelay(.clk(VGA_CLK), .reset(0), .d(C_R), .q(crDelay_q));
	pipeProgress #(8,1) cgDelay(.clk(VGA_CLK), .reset(0), .d(C_G), .q(cgDelay_q));
	pipeProgress #(8,1) cbDelay(.clk(VGA_CLK), .reset(0), .d(C_B), .q(cbDelay_q));
	
	pixelDecode(
		.C_R(C_R),
		.C_G(C_G),
		.C_B(C_B),
		.X(xDelay_q),
		.Y(yDelay_q),
		.colour_select(qColour),
		.char_select(qText)
	);
	
	pixelMap(
		.clk_a(CLOCK_50),
		.clk_b(VGA_CLK),
		.X(xDelay_q),
		.Y(yDelay_q),
		
		.R(S_R),
		.G(S_G),
		.B(S_B),
		
		.data(data),
		.address(address),
		.addressDataEn(addressDataEn),
		.writeEn(writeEn),
		.outputEn(outputEn)
	);
	
endmodule

module pixelDecode(
	output[7:0] C_R, C_G, C_B,
	input [9:0] X, Y,
	input [7:0] colour_select, char_select
	);
	
	wire[7:0] FG_RED,FG_GREEN,FG_BLUE, BG_RED, BG_GREEN, BG_BLUE;
	wire[7:0] pixels[7:0];
	wire[63:0] pixelLine;
	
	textDecode asciiTable(char_select, pixelLine);//Text font
	colourDecode vgaColour(colour_select, FG_RED, FG_GREEN, FG_BLUE, BG_RED, BG_GREEN, BG_BLUE);
	
	assign pixels[0] = pixelLine[7:0];
	assign pixels[1] = pixelLine[15:8];
	assign pixels[2] = pixelLine[23:16];
	assign pixels[3] = pixelLine[31:24];
	assign pixels[4] = pixelLine[39:32];
	assign pixels[5] = pixelLine[47:40];
	assign pixels[6] = pixelLine[55:48];
	assign pixels[7] = pixelLine[63:56];
	
	wire pixelOn;
	assign pixelOn = pixels[Y[2:0]][~X[2:0]];
	
	assign C_R = pixelOn? FG_RED: BG_RED;
	assign C_G = pixelOn? FG_GREEN: BG_GREEN;
	assign C_B = pixelOn? FG_BLUE: BG_BLUE;
	
	
	
endmodule

module pixelMap(
	input clk_a, clk_b,
	input [9:0] X, Y,
	output reg [3:0] R, G, B,
	
	inout[15:0] data, //bus
	input[31:0] address,
	input addressDataEn,
	input writeEn,
	input outputEn
	);
	parameter BASE = 'h10000;
	
	reg [3:0] red[65535:0];
	reg [3:0] green[65535:0];
	reg [3:0] blue[65535:0];
	
	reg[15:0] pixelAddress, busSide;
	
	always @(posedge clk_b) begin
		pixelAddress <= X + 256*Y;
		if((X < 256) & (Y < 256)) begin
			R <= red[pixelAddress];
			G <= green[pixelAddress];
			B <= blue[pixelAddress];
		end
		else begin
			R <= 0;
			G <= 0;
			B <= 0;
		end
		
		
	end
	
	wire cs;
	wire[32:0] internal_address;
	assign cs = (address >= BASE) && ((address - BASE) < 'h20000);
	assign internal_address = address - BASE;
	always @(posedge clk_a) begin
		if(cs) begin
			if(writeEn) begin
				red[internal_address] <= data[3:0];
				green[internal_address] <= data[7:4];
				blue[internal_address] <= data[11:8];
			end
			if(addressDataEn) begin
				busSide <= {4'b0, blue[internal_address[15:0]], green[internal_address[15:0]], red[internal_address[15:0]]};
			end
		end
	end
	
	triState read(.bus(data), .data(busSide), .en(outputEn&cs));
	
endmodule
