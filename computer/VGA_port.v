module VGA_PORT(
	input CLOCK_50,
	inout[15:0] device_dat1, device_dat2, //data and address
	input service1, service2,
	output[7:0] VGA_R, VGA_G, VGA_B,
	output VGA_CLK, VGA_BLANK, VGA_HS, VGA_VS, VGA_SYNC, DRW1, DRW2,
	output DE1, DE2);
	
	reg rr;//read ready
	initial
		rr = 0;
	wire addrR, we, readVidMem;//address ready, write enabled, readVidMemory
	//port configuration
	
	assign DRW1 = rr; // only write to the port when the read is ready
	assign DRW2 = 0; //This device never needs to write
	
	wire DE; //link the two read lines together
	assign DE2 = ~DISP;//only read the ports when not displaying and there is a new value in the address port
	assign DE1 = (addrR&~readVidMem)|rr;// only enable when you are ready to write and want to or when the read is ready
	
	//VGA
	wire[7:0] C_R;
	wire[7:0] C_B;
	wire[7:0] C_G;
	wire[9:0] X, Y;
	
	wire VGA_CLK_internal, DISP;
	
	assign VGA_CLK = VGA_CLK_internal;
	
	//Link the vga controller to the internal colour chanels and the external VGA connections
	VGA display(C_R, C_G, C_B,CLOCK_50, VGA_R, VGA_G, VGA_B, VGA_CLK_internal, VGA_BLANK, VGA_HS, VGA_VS, VGA_SYNC, X, Y, DISP);
	
	//END OF VGA
	//MEMORY
	wire[12:0] readAddr;
	wire[12:0] addr, service_addr;
	wire[7:0] qText, qColour, dText, dColour;//qText: text, qColour: colour
	
	
	
	assign readVidMem = device_dat2[15];
	assign addrR = (~DISP)&service2;//address is ready when not displaying and there was a service request on the second port
	assign we = addrR&~readVidMem;
	
	assign dText = device_dat1[7:0];
	assign dColour = device_dat1[15:8];
	assign device_dat1 = rr? {qColour, qText}:16'hzzzz;
	
	assign service_addr = device_dat2[12:0];//The address used for the service request
	addrConversion linearMapping(X[9:3],Y[9:3],readAddr);//map the grid address to a linear address
	assign addr = DISP? readAddr:service_addr;//When not displaying, read the service request
	
	textPage text(addr, dText, CLOCK_50, we, qText);//character memory
	textPage colour(addr, dColour, CLOCK_50, we, qColour);//colour memory
	
	always@(posedge CLOCK_50) //buffer read ready by 1 clock cycle to get registers loaded
		rr <= addrR&readVidMem;
	
	//DECODING
	wire[7:0] FG_RED,FG_GREEN,FG_BLUE, BG_RED, BG_GREEN, BG_BLUE;
	wire[7:0] pixels[7:0];
	wire[63:0] pixelLine;
	
	textDecode asciiTable(qText, pixelLine);//Text font
	colourDecode vgaColour(qColour, FG_RED, FG_GREEN, FG_BLUE, BG_RED, BG_GREEN, BG_BLUE);
	
	assign pixels[0] = pixelLine[7:0];
	assign pixels[1] = pixelLine[15:8];
	assign pixels[2] = pixelLine[23:16];
	assign pixels[3] = pixelLine[31:24];
	assign pixels[4] = pixelLine[39:32];
	assign pixels[5] = pixelLine[47:40];
	assign pixels[6] = pixelLine[55:48];
	assign pixels[7] = pixelLine[63:56];
	//END OF MEMORY AND DECODING
	//CONTROL SIGNALS
	wire pixelOn;
	assign pixelOn = pixels[Y[2:0]][~X[2:0]];
	
	assign C_R = pixelOn? FG_RED: BG_RED;
	assign C_G = pixelOn? FG_GREEN: BG_GREEN;
	assign C_B = pixelOn? FG_BLUE: BG_BLUE;
	
endmodule

module addrConversion(input[6:0] X,Y, output[12:0] addr);

	assign addr = (80*Y)+X;//This will be simplified to Y<<4+Y<<6+X
endmodule


