module ps2Test(

	//////////// Audio //////////
	input 		          		AUD_ADCDAT,
	inout 		          		AUD_ADCLRCK,
	inout 		          		AUD_BCLK,
	output		          		AUD_DACDAT,
	inout 		          		AUD_DACLRCK,
	output		          		AUD_XCK,

	//////////// CLOCK //////////
	input 		          		CLOCK2_50,
	input 		          		CLOCK3_50,
	input 		          		CLOCK4_50,
	input 		          		CLOCK_50,

	//////////// SDRAM //////////
	output		    [12:0]		DRAM_ADDR,
	output		     [1:0]		DRAM_BA,
	output		          		DRAM_CAS_N,
	output		          		DRAM_CKE,
	output		          		DRAM_CLK,
	output		          		DRAM_CS_N,
	inout 		    [15:0]		DRAM_DQ,
	output		          		DRAM_LDQM,
	output		          		DRAM_RAS_N,
	output		          		DRAM_UDQM,
	output		          		DRAM_WE_N,

	//////////// I2C for Audio and Video-In //////////
	output		          		FPGA_I2C_SCLK,
	inout 		          		FPGA_I2C_SDAT,

	//////////// SEG7 //////////
	output		     [6:0]		HEX0,
	output		     [6:0]		HEX1,
	output		     [6:0]		HEX2,
	output		     [6:0]		HEX3,
	output		     [6:0]		HEX4,
	output		     [6:0]		HEX5,

	//////////// IR //////////
	input 		          		IRDA_RXD,
	output		          		IRDA_TXD,

	//////////// KEY //////////
	input 		     [3:0]		KEY,

	//////////// LED //////////
	output		     [9:0]		LEDR,

	//////////// PS2 //////////
	inout 		          		PS2_CLK,
	inout 		          		PS2_CLK2,
	inout 		          		PS2_DAT,
	inout 		          		PS2_DAT2,

	//////////// SW //////////
	input 		     [9:0]		SW,

	//////////// VGA //////////
	output		          		VGA_BLANK_N,
	output		     [7:0]		VGA_B,
	output		          		VGA_CLK,
	output		     [7:0]		VGA_G,
	output		          		VGA_HS,
	output		     [7:0]		VGA_R,
	output		          		VGA_SYNC_N,
	output		          		VGA_VS
);

/*
	assign LEDR = data[9:0];
	reg[9:0] data;
	always@(negedge PS2_CLK) begin
		data[8:0] <= data[9:1];
		data[9] <= PS2_DAT;
	end*/
		
		
	bcdToHex(host_dat[3:0], HEX0);
	bcdToHex(host_dat[7:4], HEX1);
	
	wire DRW, DE;
	wire [15:0] device_dat;
	wire [15:0] host_dat;
	port #(16) testPort(CLOCK_50, 1, DE, 0, DRW, host_dat, device_dat, LEDR[9]);
	ps2Keyboard		PORT_KYB(
									.PS2_CLK(PS2_CLK),
									.PS2_DAT(PS2_DAT),
									.PS2_CLK2(PS2_CLK2),
									.PS2_DAT2(PS2_DAT2),
									
									.CLOCK_50(CLOCK_50),
									.DRW(DRW),
									.DE(DE),
									.port_data(device_dat),
									
									.LED(LEDR[7:0])
									);
endmodule
