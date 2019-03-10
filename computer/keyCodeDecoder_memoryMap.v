module keyCodeDecoder_memoryMap(
	input								CLOCK_50,
	inout [15:0]					BUS,
	input [31:0]					address,
	input writeEn,
	input outputEn,
	output readDone
	);
	parameter BASE = 0;
		
	wire cs_input;
	wire cs_output;
	wire cs;
	reg readDone_internal;
	
	assign cs_input = (address == BASE);
	assign cs_output = (address == (BASE + 1));
	assign cs = cs_input|cs_output;
	
	
	reg[15:0] keycode;
	wire[15:0] ascii; 
	
	always @(posedge CLOCK_50) begin
		if(cs_input && writeEn)
			keycode <= BUS;
	end
	//Only takes 1 clock cycle to read
	always @ (posedge CLOCK_50) begin
		readDone_internal <= cs&!writeEn;
	end
	assign readDone = cs?readDone_internal:'bz;
	
	
	triState(.bus(BUS), .data(ascii), .en(outputEn&cs_output));
	triState(.bus(BUS), .data(keycode), .en(outputEn&cs_input));
	keyCodeDecoder(keycode, ascii);
	
endmodule
	
module keyCodeDecoder(input[7:0] data, output reg[7:0]ascii);
	always @ (*) begin
		case (data)
			'h00 : ascii = 0;
			'h01 : ascii = 0;
			'h02 : ascii = 0;
			'h03 : ascii = 0;
			'h04 : ascii = 0;
			'h05 : ascii = 0;
			'h06 : ascii = 0;
			'h07 : ascii = 0;
			'h08 : ascii = 0;
			'h09 : ascii = 0;
			'h0a : ascii = 0;
			'h0b : ascii = 0;
			'h0c : ascii = 0;
			'h0d : ascii = 0;
			'h0e : ascii = 96;
			'h0f : ascii = 0;
			'h10 : ascii = 0;
			'h11 : ascii = 0;
			'h12 : ascii = 0;
			'h13 : ascii = 0;
			'h14 : ascii = 0;
			'h15 : ascii = 113;
			'h16 : ascii = 49;
			'h17 : ascii = 0;
			'h18 : ascii = 0;
			'h19 : ascii = 0;
			'h1a : ascii = 0;
			'h1b : ascii = 115;
			'h1c : ascii = 97;
			'h1d : ascii = 119;
			'h1e : ascii = 50;
			'h1f : ascii = 0;
			'h20 : ascii = 0;
			'h21 : ascii = 99;
			'h22 : ascii = 120;
			'h23 : ascii = 100;
			'h24 : ascii = 101;
			'h25 : ascii = 52;
			'h26 : ascii = 51;
			'h27 : ascii = 0;
			'h28 : ascii = 0;
			'h29 : ascii = 0;
			'h2a : ascii = 118;
			'h2b : ascii = 102;
			'h2c : ascii = 116;
			'h2d : ascii = 114;
			'h2e : ascii = 53;
			'h2f : ascii = 0;
			'h30 : ascii = 0;
			'h31 : ascii = 110;
			'h32 : ascii = 98;
			'h33 : ascii = 104;
			'h34 : ascii = 103;
			'h35 : ascii = 121;
			'h36 : ascii = 54;
			'h37 : ascii = 0;
			'h38 : ascii = 0;
			'h39 : ascii = 0;
			'h3a : ascii = 109;
			'h3b : ascii = 106;
			'h3c : ascii = 117;
			'h3d : ascii = 55;
			'h3e : ascii = 56;
			'h3f : ascii = 0;
			'h40 : ascii = 0;
			'h41 : ascii = 44;
			'h42 : ascii = 107;
			'h43 : ascii = 105;
			'h44 : ascii = 111;
			'h45 : ascii = 48;
			'h46 : ascii = 57;
			'h47 : ascii = 0;
			'h48 : ascii = 0;
			'h49 : ascii = 46;
			'h4a : ascii = 47;
			'h4b : ascii = 108;
			'h4c : ascii = 59;
			'h4d : ascii = 112;
			'h4e : ascii = 45;
			'h4f : ascii = 0;
			'h50 : ascii = 0;
			'h51 : ascii = 0;
			'h52 : ascii = 0;
			'h53 : ascii = 0;
			'h54 : ascii = 91;
			'h55 : ascii = 0;
			'h56 : ascii = 0;
			'h57 : ascii = 0;
			'h58 : ascii = 0;
			'h59 : ascii = 0;
			'h5a : ascii = 0;
			'h5b : ascii = 93;
			'h5c : ascii = 0;
			'h5d : ascii = 92;
			'h5e : ascii = 0;
			'h5f : ascii = 0;
			default : ascii = 0;
		endcase
	end
endmodule
