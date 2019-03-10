module textDecode(charCode, pixelsExternal);
	input[7:0] charCode;
	
	output[63:0] pixelsExternal;
	reg[7:0] pixels[7:0];
	
	assign pixelsExternal[7:0] = pixels[0];
	assign pixelsExternal[15:8] = pixels[1];
	assign pixelsExternal[23:16] = pixels[2];
	assign pixelsExternal[31:24] = pixels[3];
	assign pixelsExternal[39:32] = pixels[4];
	assign pixelsExternal[47:40] = pixels[5];
	assign pixelsExternal[55:48] = pixels[6];
	assign pixelsExternal[63:56] = pixels[7];
	
	always @* begin
		case(charCode[7:0])
			0: begin //null char
				pixels[0] = 8'b00000000;
				pixels[1] = 8'b00000000;
				pixels[2] = 8'b00000000;
				pixels[3] = 8'b00000000;
				pixels[4] = 8'b00000000;
				pixels[5] = 8'b00000000;
				pixels[6] = 8'b00000000;
				pixels[7] = 8'b00000000;
			end
			5: begin //White char
				pixels[0] = 8'b11111111;
				pixels[1] = 8'b11111111;
				pixels[2] = 8'b11111111;
				pixels[3] = 8'b11111111;
				pixels[4] = 8'b11111111;
				pixels[5] = 8'b11111111;
				pixels[6] = 8'b11111111;
				pixels[7] = 8'b11111111;
			end
			12: begin //Chessboard char
				pixels[0] = 8'b10101010;
				pixels[1] = 8'b01010101;
				pixels[2] = 8'b10101010;
				pixels[3] = 8'b01010101;
				pixels[4] = 8'b10101010;
				pixels[5] = 8'b01010101;
				pixels[6] = 8'b10101010;
				pixels[7] = 8'b01010101;
			end
			32: begin //space
				pixels[0] = 8'b00000000;
				pixels[1] = 8'b00000000;
				pixels[2] = 8'b00000000;
				pixels[3] = 8'b00000000;
				pixels[4] = 8'b00000000;
				pixels[5] = 8'b00000000;
				pixels[6] = 8'b00000000;
				pixels[7] = 8'b00000000;
			end
			33: begin
				pixels[0] = 8'b00000000;
				pixels[1] = 8'b10000000;
				pixels[2] = 8'b10000000;
				pixels[3] = 8'b10000000;
				pixels[4] = 8'b10000000;
				pixels[5] = 8'b10000000;
				pixels[6] = 8'b00000000;
				pixels[7] = 8'b10000000;
			end
			34: begin
				pixels[0] = 8'b00000000;
				pixels[1] = 8'b10100000;
				pixels[2] = 8'b10100000;
				pixels[3] = 8'b00000000;
				pixels[4] = 8'b00000000;
				pixels[5] = 8'b00000000;
				pixels[6] = 8'b00000000;
				pixels[7] = 8'b00000000;
			end
			35: begin
				pixels[0] = 8'b00000000;
				pixels[1] = 8'b01000100;
				pixels[2] = 8'b11111110;
				pixels[3] = 8'b01000100;
				pixels[4] = 8'b01000100;
				pixels[5] = 8'b01000100;
				pixels[6] = 8'b11111110;
				pixels[7] = 8'b01000100;
			end
			36: begin
				pixels[0] = 8'b00000000;
				pixels[1] = 8'b00101000;
				pixels[2] = 8'b01111110;
				pixels[3] = 8'b10101000;
				pixels[4] = 8'b01111100;
				pixels[5] = 8'b00101010;
				pixels[6] = 8'b11111100;
				pixels[7] = 8'b00101000;
			end
			37: begin
				pixels[0] = 8'b00000000;
				pixels[1] = 8'b01000010;
				pixels[2] = 8'b10100100;
				pixels[3] = 8'b01001000;
				pixels[4] = 8'b00010000;
				pixels[5] = 8'b00100100;
				pixels[6] = 8'b01001010;
				pixels[7] = 8'b10000100;
			end
			38: begin
				pixels[0] = 8'b00000000;
				pixels[1] = 8'b00111100;
				pixels[2] = 8'b01000000;
				pixels[3] = 8'b10000000;
				pixels[4] = 8'b01000100;
				pixels[5] = 8'b10101000;
				pixels[6] = 8'b10010000;
				pixels[7] = 8'b01101000;
			end
			39: begin
				pixels[0] = 8'b00000000;
				pixels[1] = 8'b10000000;
				pixels[2] = 8'b10000000;
				pixels[3] = 8'b00000000;
				pixels[4] = 8'b00000000;
				pixels[5] = 8'b00000000;
				pixels[6] = 8'b00000000;
				pixels[7] = 8'b00000000;
			end
			48: begin //0
				pixels[0] = 8'b00000000;
				pixels[1] = 8'b01111100;
				pixels[2] = 8'b10000110;
				pixels[3] = 8'b10001010;
				pixels[4] = 8'b10010010;
				pixels[5] = 8'b10100010;
				pixels[6] = 8'b11000010;
				pixels[7] = 8'b01111100;
			end
			49: begin //1
				pixels[0] = 8'b00000000;
				pixels[1] = 8'b01110000;
				pixels[2] = 8'b01010000;
				pixels[3] = 8'b00010000;
				pixels[4] = 8'b00010000;
				pixels[5] = 8'b00010000;
				pixels[6] = 8'b00010000;
				pixels[7] = 8'b11111110;
			end
			50: begin//2
				pixels[0] = 8'b00000000;
				pixels[1] = 8'b01111000;
				pixels[2] = 8'b10000100;
				pixels[3] = 8'b00000100;
				pixels[4] = 8'b00001000;
				pixels[5] = 8'b00010000;
				pixels[6] = 8'b00100000;
				pixels[7] = 8'b01111100;
			end
			51: begin
				pixels[0] = 8'b00000000;
				pixels[1] = 8'b11111100;
				pixels[2] = 8'b00000010;
				pixels[3] = 8'b00000010;
				pixels[4] = 8'b00111100;
				pixels[5] = 8'b00000010;
				pixels[6] = 8'b00000010;
				pixels[7] = 8'b11111100;
			end
			52: begin
				pixels[0] = 8'b00000000;
				pixels[1] = 8'b10001000;
				pixels[2] = 8'b10001000;
				pixels[3] = 8'b10001000;
				pixels[4] = 8'b11111110;
				pixels[5] = 8'b00001000;
				pixels[6] = 8'b00001000;
				pixels[7] = 8'b00001000;
			end
			53: begin 
				pixels[0] = 8'b00000000;
				pixels[1] = 8'b11111110;
				pixels[2] = 8'b10000000;
				pixels[3] = 8'b10000000;
				pixels[4] = 8'b11111100;
				pixels[5] = 8'b00000010;
				pixels[6] = 8'b00000010;
				pixels[7] = 8'b11111100;
			end
			54: begin 
				pixels[0] = 8'b00000000;
				pixels[1] = 8'b01111100;
				pixels[2] = 8'b10000000;
				pixels[3] = 8'b10000000;
				pixels[4] = 8'b11111100;
				pixels[5] = 8'b10000010;
				pixels[6] = 8'b10000010;
				pixels[7] = 8'b01111100;
			end
			55: begin 
				pixels[0] = 8'b00000000;
				pixels[1] = 8'b11111110;
				pixels[2] = 8'b00000010;
				pixels[3] = 8'b00000100;
				pixels[4] = 8'b00001000;
				pixels[5] = 8'b00010000;
				pixels[6] = 8'b00100000;
				pixels[7] = 8'b01000000;
			end
			56: begin 
				pixels[0] = 8'b00000000;
				pixels[1] = 8'b01111100;
				pixels[2] = 8'b10000010;
				pixels[3] = 8'b10000010;
				pixels[4] = 8'b01111100;
				pixels[5] = 8'b10000010;
				pixels[6] = 8'b10000010;
				pixels[7] = 8'b01111100;
			end
			57: begin
				pixels[0] = 8'b00000000;
				pixels[1] = 8'b01111100;
				pixels[2] = 8'b10000010;
				pixels[3] = 8'b10000010;
				pixels[4] = 8'b01111110;
				pixels[5] = 8'b00000010;
				pixels[6] = 8'b00000010;
				pixels[7] = 8'b00000010;
			end
			65: begin
				pixels[0] = 8'b00000000;
				pixels[1] = 8'b01111000;
				pixels[2] = 8'b10000100;
				pixels[3] = 8'b10000100;
				pixels[4] = 8'b11111100;
				pixels[5] = 8'b10000100;
				pixels[6] = 8'b10000100;
				pixels[7] = 8'b10000100;
			end
			66: begin
				pixels[0] = 8'b00000000;
				pixels[1] = 8'b11110000;
				pixels[2] = 8'b10001000;
				pixels[3] = 8'b10001000;
				pixels[4] = 8'b11111000;
				pixels[5] = 8'b10000100;
				pixels[6] = 8'b10000100;
				pixels[7] = 8'b11111000;
			end
			67: begin
				pixels[0] = 8'b00000000;
				pixels[1] = 8'b01111110;
				pixels[2] = 8'b10000000;
				pixels[3] = 8'b10000000;
				pixels[4] = 8'b10000000;
				pixels[5] = 8'b10000000;
				pixels[6] = 8'b10000000;
				pixels[7] = 8'b01111110;
			end
			68: begin
				pixels[0] = 8'b00000000;
				pixels[1] = 8'b11111000;
				pixels[2] = 8'b10000100;
				pixels[3] = 8'b10000100;
				pixels[4] = 8'b10000100;
				pixels[5] = 8'b10000100;
				pixels[6] = 8'b10000100;
				pixels[7] = 8'b11111000;
			end
			69: begin
				pixels[0] = 8'b00000000;
				pixels[1] = 8'b11111110;
				pixels[2] = 8'b10000000;
				pixels[3] = 8'b10000000;
				pixels[4] = 8'b11111100;
				pixels[5] = 8'b10000000;
				pixels[6] = 8'b10000000;
				pixels[7] = 8'b11111110;
			end
			70: begin
				pixels[0] = 8'b00000000;
				pixels[1] = 8'b11111110;
				pixels[2] = 8'b10000000;
				pixels[3] = 8'b10000000;
				pixels[4] = 8'b11111100;
				pixels[5] = 8'b10000000;
				pixels[6] = 8'b10000000;
				pixels[7] = 8'b10000000;
			end
			71: begin
				pixels[0] = 8'b00000000;
				pixels[1] = 8'b01111110;
				pixels[2] = 8'b10000000;
				pixels[3] = 8'b10000000;
				pixels[4] = 8'b10000110;
				pixels[5] = 8'b10000010;
				pixels[6] = 8'b10000010;
				pixels[7] = 8'b01111100;
			end
			72: begin
				pixels[0] = 8'b00000000;
				pixels[1] = 8'b10000010;
				pixels[2] = 8'b10000010;
				pixels[3] = 8'b10000010;
				pixels[4] = 8'b11111110;
				pixels[5] = 8'b10000010;
				pixels[6] = 8'b10000010;
				pixels[7] = 8'b10000010;
			end
			73: begin
				pixels[0] = 8'b00000000;
				pixels[1] = 8'b11111110;
				pixels[2] = 8'b00010000;
				pixels[3] = 8'b00010000;
				pixels[4] = 8'b00010000;
				pixels[5] = 8'b00010000;
				pixels[6] = 8'b00010000;
				pixels[7] = 8'b11111110;
			end
			74: begin
				pixels[0] = 8'b00000000;
				pixels[1] = 8'b11111110;
				pixels[2] = 8'b00001000;
				pixels[3] = 8'b00001000;
				pixels[4] = 8'b00001000;
				pixels[5] = 8'b10001000;
				pixels[6] = 8'b10001000;
				pixels[7] = 8'b01110000;
			end
			75: begin
				pixels[0] = 8'b00000000;
				pixels[1] = 8'b10010000;
				pixels[2] = 8'b10100000;
				pixels[3] = 8'b11000000;
				pixels[4] = 8'b11000000;
				pixels[5] = 8'b10100000;
				pixels[6] = 8'b10010000;
				pixels[7] = 8'b10001000;
			end
			76: begin
				pixels[0] = 8'b00000000;
				pixels[1] = 8'b10000000;
				pixels[2] = 8'b10000000;
				pixels[3] = 8'b10000000;
				pixels[4] = 8'b10000000;
				pixels[5] = 8'b10000000;
				pixels[6] = 8'b10000000;
				pixels[7] = 8'b11111110;
			end
			77: begin
				pixels[0] = 8'b00000000;
				pixels[1] = 8'b10000010;
				pixels[2] = 8'b11000110;
				pixels[3] = 8'b10101010;
				pixels[4] = 8'b10010010;
				pixels[5] = 8'b10000010;
				pixels[6] = 8'b10000010;
				pixels[7] = 8'b10000010;
			end
			78: begin
				pixels[0] = 8'b00000000;
				pixels[1] = 8'b10000010;
				pixels[2] = 8'b11000010;
				pixels[3] = 8'b10100010;
				pixels[4] = 8'b10010010;
				pixels[5] = 8'b10001010;
				pixels[6] = 8'b10000110;
				pixels[7] = 8'b10000010;
			end
			79: begin
				pixels[0] = 8'b00000000;
				pixels[1] = 8'b01111100;
				pixels[2] = 8'b10000010;
				pixels[3] = 8'b10000010;
				pixels[4] = 8'b10000010;
				pixels[5] = 8'b10000010;
				pixels[6] = 8'b10000010;
				pixels[7] = 8'b01111100;
			end
			80: begin
				pixels[0] = 8'b00000000;
				pixels[1] = 8'b11111100;
				pixels[2] = 8'b10000010;
				pixels[3] = 8'b10000010;
				pixels[4] = 8'b11111100;
				pixels[5] = 8'b10000000;
				pixels[6] = 8'b10000000;
				pixels[7] = 8'b10000000;
			end
			81: begin
				pixels[0] = 8'b00000000;
				pixels[1] = 8'b01111110;
				pixels[2] = 8'b10000010;
				pixels[3] = 8'b10000010;
				pixels[4] = 8'b10010010;
				pixels[5] = 8'b10001010;
				pixels[6] = 8'b10000110;
				pixels[7] = 8'b01111110;
			end
			82: begin
				pixels[0] = 8'b00000000;
				pixels[1] = 8'b11111100;
				pixels[2] = 8'b10000010;
				pixels[3] = 8'b10000010;
				pixels[4] = 8'b11111100;
				pixels[5] = 8'b10011000;
				pixels[6] = 8'b10001100;
				pixels[7] = 8'b10000110;
			end
			83: begin
				pixels[0] = 8'b00000000;
				pixels[1] = 8'b01111100;
				pixels[2] = 8'b10000010;
				pixels[3] = 8'b10000000;
				pixels[4] = 8'b01111100;
				pixels[5] = 8'b00000010;
				pixels[6] = 8'b10000010;
				pixels[7] = 8'b01111100;
			end
			84: begin
				pixels[0] = 8'b00000000;
				pixels[1] = 8'b11111110;
				pixels[2] = 8'b00010000;
				pixels[3] = 8'b00010000;
				pixels[4] = 8'b00010000;
				pixels[5] = 8'b00010000;
				pixels[6] = 8'b00010000;
				pixels[7] = 8'b00010000;
			end
			85: begin
				pixels[0] = 8'b00000000;
				pixels[1] = 8'b10000010;
				pixels[2] = 8'b10000010;
				pixels[3] = 8'b10000010;
				pixels[4] = 8'b10000010;
				pixels[5] = 8'b10000010;
				pixels[6] = 8'b10000010;
				pixels[7] = 8'b11111110;
			end
			86: begin
				pixels[0] = 8'b00000000;
				pixels[1] = 8'b10000010;
				pixels[2] = 8'b10000010;
				pixels[3] = 8'b01000100;
				pixels[4] = 8'b01000100;
				pixels[5] = 8'b00101000;
				pixels[6] = 8'b00101000;
				pixels[7] = 8'b00010000;
			end
			87: begin
				pixels[0] = 8'b00000000;
				pixels[1] = 8'b10000010;
				pixels[2] = 8'b10000010;
				pixels[3] = 8'b10000010;
				pixels[4] = 8'b10010010;
				pixels[5] = 8'b01010100;
				pixels[6] = 8'b01010100;
				pixels[7] = 8'b00101000;
			end
			88: begin
				pixels[0] = 8'b00000000;
				pixels[1] = 8'b10000010;
				pixels[2] = 8'b01000100;
				pixels[3] = 8'b00101000;
				pixels[4] = 8'b00010000;
				pixels[5] = 8'b00101000;
				pixels[6] = 8'b01000100;
				pixels[7] = 8'b10000010;
			end
			89: begin
				pixels[0] = 8'b00000000;
				pixels[1] = 8'b10000010;
				pixels[2] = 8'b01000100;
				pixels[3] = 8'b00101000;
				pixels[4] = 8'b00010000;
				pixels[5] = 8'b00100000;
				pixels[6] = 8'b01000000;
				pixels[7] = 8'b10000000;
			end
			90: begin
				pixels[0] = 8'b00000000;
				pixels[1] = 8'b11111110;
				pixels[2] = 8'b00000100;
				pixels[3] = 8'b00001000;
				pixels[4] = 8'b00010000;
				pixels[5] = 8'b00100000;
				pixels[6] = 8'b01000000;
				pixels[7] = 8'b11111110;
			end
			91: begin //Square brackets
				pixels[0] = 8'b00000000;
				pixels[1] = 8'b11110000;
				pixels[2] = 8'b10000000;
				pixels[3] = 8'b10000000;
				pixels[4] = 8'b10000000;
				pixels[5] = 8'b10000000;
				pixels[6] = 8'b10000000;
				pixels[7] = 8'b11110000;
			end
			92: begin
				pixels[0] = 8'b00000000;
				pixels[1] = 8'b10000000;
				pixels[2] = 8'b01000000;
				pixels[3] = 8'b00100000;
				pixels[4] = 8'b00010000;
				pixels[5] = 8'b00001000;
				pixels[6] = 8'b00000100;
				pixels[7] = 8'b00000010;
			end
			93: begin //Square brackets
				pixels[0] = 8'b00000000;
				pixels[1] = 8'b00011110;
				pixels[2] = 8'b00000010;
				pixels[3] = 8'b00000010;
				pixels[4] = 8'b00000010;
				pixels[5] = 8'b00000010;
				pixels[6] = 8'b00000010;
				pixels[7] = 8'b00011110;
			end
			94: begin 
				pixels[0] = 8'b00000000;
				pixels[1] = 8'b00010000;
				pixels[2] = 8'b00101000;
				pixels[3] = 8'b01000100;
				pixels[4] = 8'b00000000;
				pixels[5] = 8'b00000000;
				pixels[6] = 8'b00000000;
				pixels[7] = 8'b00000000;
			end
			95: begin 
				pixels[0] = 8'b00000000;
				pixels[1] = 8'b00000000;
				pixels[2] = 8'b00000000;
				pixels[3] = 8'b00000000;
				pixels[4] = 8'b00000000;
				pixels[5] = 8'b00000000;
				pixels[6] = 8'b00000000;
				pixels[7] = 8'b11111110;
			end
			97: begin 
				pixels[0] = 8'b00000000;
				pixels[1] = 8'b00000000;
				pixels[2] = 8'b01111000;
				pixels[3] = 8'b10000100;
				pixels[4] = 8'b01111100;
				pixels[5] = 8'b10000100;
				pixels[6] = 8'b10000100;
				pixels[7] = 8'b01111110;
			end
			98: begin 
				pixels[0] = 8'b00000000;
				pixels[1] = 8'b11000000;
				pixels[2] = 8'b01000000;
				pixels[3] = 8'b01011000;
				pixels[4] = 8'b01100100;
				pixels[5] = 8'b01000100;
				pixels[6] = 8'b01000100;
				pixels[7] = 8'b11111000;
			end
			99: begin 
				pixels[0] = 8'b00000000;
				pixels[1] = 8'b00000000;
				pixels[2] = 8'b01111100;
				pixels[3] = 8'b10000100;
				pixels[4] = 8'b10000000;
				pixels[5] = 8'b10000000;
				pixels[6] = 8'b10000100;
				pixels[7] = 8'b01111000;
			end
			100: begin 
				pixels[0] = 8'b00000000;
				pixels[1] = 8'b00011000;
				pixels[2] = 8'b00001000;
				pixels[3] = 8'b01101000;
				pixels[4] = 8'b10011000;
				pixels[5] = 8'b10001000;
				pixels[6] = 8'b10001000;
				pixels[7] = 8'b01111100;
			end
			101: begin 
				pixels[0] = 8'b00000000;
				pixels[1] = 8'b00000000;
				pixels[2] = 8'b01111000;
				pixels[3] = 8'b10000100;
				pixels[4] = 8'b11111100;
				pixels[5] = 8'b10000000;
				pixels[6] = 8'b10000000;
				pixels[7] = 8'b01111000;
			end
			102: begin 
				pixels[0] = 8'b00000000;
				pixels[1] = 8'b00111100;
				pixels[2] = 8'b01000000;
				pixels[3] = 8'b11111000;
				pixels[4] = 8'b01000000;
				pixels[5] = 8'b01000000;
				pixels[6] = 8'b01000000;
				pixels[7] = 8'b01000000;
			end
			103: begin 
				pixels[0] = 8'b00000000;
				pixels[1] = 8'b01101100;
				pixels[2] = 8'b10011000;
				pixels[3] = 8'b10001000;
				pixels[4] = 8'b10001000;
				pixels[5] = 8'b01111000;
				pixels[6] = 8'b00001000;
				pixels[7] = 8'b01110000;
			end
			104: begin 
				pixels[0] = 8'b00000000;
				pixels[1] = 8'b11000000;
				pixels[2] = 8'b01000000;
				pixels[3] = 8'b01011100;
				pixels[4] = 8'b01100100;
				pixels[5] = 8'b01000100;
				pixels[6] = 8'b01000100;
				pixels[7] = 8'b11101110;
			end
			105: begin 
				pixels[0] = 8'b00000000;
				pixels[1] = 8'b00100000;
				pixels[2] = 8'b00000000;
				pixels[3] = 8'b01100000;
				pixels[4] = 8'b00100000;
				pixels[5] = 8'b00100000;
				pixels[6] = 8'b00100000;
				pixels[7] = 8'b11111000;
			end
			106: begin 
				pixels[0] = 8'b00000000;
				pixels[1] = 8'b00100000;
				pixels[2] = 8'b00000000;
				pixels[3] = 8'b01110000;
				pixels[4] = 8'b00010000;
				pixels[5] = 8'b00010000;
				pixels[6] = 8'b00010000;
				pixels[7] = 8'b11100000;
			end
			107: begin 
				pixels[0] = 8'b00000000;
				pixels[1] = 8'b11000000;
				pixels[2] = 8'b01011100;
				pixels[3] = 8'b01001000;
				pixels[4] = 8'b01110000;
				pixels[5] = 8'b01010000;
				pixels[6] = 8'b01001000;
				pixels[7] = 8'b11011100;
			end
			108: begin 
				pixels[0] = 8'b00000000;
				pixels[1] = 8'b10000000;
				pixels[2] = 8'b01000000;
				pixels[3] = 8'b01000000;
				pixels[4] = 8'b01000000;
				pixels[5] = 8'b01000000;
				pixels[6] = 8'b01000000;
				pixels[7] = 8'b00100000;
			end
			109: begin 
				pixels[0] = 8'b00000000;
				pixels[1] = 8'b00000000;
				pixels[2] = 8'b11101000;
				pixels[3] = 8'b01010100;
				pixels[4] = 8'b01010100;
				pixels[5] = 8'b01010100;
				pixels[6] = 8'b01010100;
				pixels[7] = 8'b11111110;
			end
			110: begin 
				pixels[0] = 8'b00000000;
				pixels[1] = 8'b00000000;
				pixels[2] = 8'b11011000;
				pixels[3] = 8'b01100100;
				pixels[4] = 8'b01000100;
				pixels[5] = 8'b01000100;
				pixels[6] = 8'b01000100;
				pixels[7] = 8'b11101110;
			end
			111: begin 
				pixels[0] = 8'b00000000;
				pixels[1] = 8'b00000000;
				pixels[2] = 8'b01110000;
				pixels[3] = 8'b10001000;
				pixels[4] = 8'b10001000;
				pixels[5] = 8'b10001000;
				pixels[6] = 8'b10001000;
				pixels[7] = 8'b01110000;
			end
			112: begin 
				pixels[0] = 8'b00000000;
				pixels[1] = 8'b11011000;
				pixels[2] = 8'b01100100;
				pixels[3] = 8'b01000100;
				pixels[4] = 8'b01000100;
				pixels[5] = 8'b01111000;
				pixels[6] = 8'b01000000;
				pixels[7] = 8'b11100000;
			end
			113: begin 
				pixels[0] = 8'b00000000;
				pixels[1] = 8'b01101100;
				pixels[2] = 8'b10001000;
				pixels[3] = 8'b10001000;
				pixels[4] = 8'b10001000;
				pixels[5] = 8'b01111000;
				pixels[6] = 8'b00001000;
				pixels[7] = 8'b00011100;
			end
			114: begin 
				pixels[0] = 8'b00000000;
				pixels[1] = 8'b00000000;
				pixels[2] = 8'b10011000;
				pixels[3] = 8'b01100000;
				pixels[4] = 8'b01000000;
				pixels[5] = 8'b01000000;
				pixels[6] = 8'b01000000;
				pixels[7] = 8'b11111000;
			end
			115: begin 
				pixels[0] = 8'b00000000;
				pixels[1] = 8'b00000000;
				pixels[2] = 8'b01111000;
				pixels[3] = 8'b10001000;
				pixels[4] = 8'b01110000;
				pixels[5] = 8'b00001000;
				pixels[6] = 8'b10001000;
				pixels[7] = 8'b11110000;
			end
			116: begin 
				pixels[0] = 8'b00000000;
				pixels[1] = 8'b01000000;
				pixels[2] = 8'b11111000;
				pixels[3] = 8'b01000000;
				pixels[4] = 8'b01000000;
				pixels[5] = 8'b01000000;
				pixels[6] = 8'b01000100;
				pixels[7] = 8'b00111000;
			end
			117: begin 
				pixels[0] = 8'b00000000;
				pixels[1] = 8'b00000000;
				pixels[2] = 8'b11001100;
				pixels[3] = 8'b01000100;
				pixels[4] = 8'b01000100;
				pixels[5] = 8'b01000100;
				pixels[6] = 8'b01001100;
				pixels[7] = 8'b00110110;
			end
			118: begin 
				pixels[0] = 8'b00000000;
				pixels[1] = 8'b00000000;
				pixels[2] = 8'b11101110;
				pixels[3] = 8'b01000100;
				pixels[4] = 8'b01000100;
				pixels[5] = 8'b00101000;
				pixels[6] = 8'b00101000;
				pixels[7] = 8'b00010000;
			end
			119: begin
				pixels[0] = 8'b00000000;
				pixels[1] = 8'b00000000;
				pixels[2] = 8'b11101110;
				pixels[3] = 8'b01000100;
				pixels[4] = 8'b01010100;
				pixels[5] = 8'b01010100;
				pixels[6] = 8'b01010100;
				pixels[7] = 8'b00101000;
				
			end
			120: begin 
				pixels[0] = 8'b00000000;
				pixels[1] = 8'b00000000;
				pixels[2] = 8'b11001100;
				pixels[3] = 8'b01001000;
				pixels[4] = 8'b00110000;
				pixels[5] = 8'b00110000;
				pixels[6] = 8'b01001000;
				pixels[7] = 8'b11001100;
			end
			121: begin 
				pixels[0] = 8'b00000000;
				pixels[1] = 8'b11101110;
				pixels[2] = 8'b01000100;
				pixels[3] = 8'b00100100;
				pixels[4] = 8'b00101000;
				pixels[5] = 8'b00011000;
				pixels[6] = 8'b00010000;
				pixels[7] = 8'b01111000;
			end
			122: begin 
				pixels[0] = 8'b00000000;
				pixels[1] = 8'b00000000;
				pixels[2] = 8'b11111000;
				pixels[3] = 8'b10010000;
				pixels[4] = 8'b00100000;
				pixels[5] = 8'b01000000;
				pixels[6] = 8'b10001000;
				pixels[7] = 8'b11111000;
			end
			123: begin 
				pixels[0] = 8'b00000000;
				pixels[1] = 8'b00000000;
				pixels[2] = 8'b00000000;
				pixels[3] = 8'b00000000;
				pixels[4] = 8'b00000000;
				pixels[5] = 8'b00000000;
				pixels[6] = 8'b00000000;
				pixels[7] = 8'b00000000;
			end
			124: begin 
				pixels[0] = 8'b00000000;
				pixels[1] = 8'b00000000;
				pixels[2] = 8'b00000000;
				pixels[3] = 8'b00000000;
				pixels[4] = 8'b00000000;
				pixels[5] = 8'b00000000;
				pixels[6] = 8'b00000000;
				pixels[7] = 8'b00000000;
			end
			125: begin 
				pixels[0] = 8'b00000000;
				pixels[1] = 8'b00000000;
				pixels[2] = 8'b00000000;
				pixels[3] = 8'b00000000;
				pixels[4] = 8'b00000000;
				pixels[5] = 8'b00000000;
				pixels[6] = 8'b00000000;
				pixels[7] = 8'b00000000;
			end
			126: begin 
				pixels[0] = 8'b00000000;
				pixels[1] = 8'b00000000;
				pixels[2] = 8'b00000000;
				pixels[3] = 8'b00000000;
				pixels[4] = 8'b00000000;
				pixels[5] = 8'b00000000;
				pixels[6] = 8'b00000000;
				pixels[7] = 8'b00000000;
			end
			127: begin 
				pixels[0] = 8'b00000000;
				pixels[1] = 8'b00000000;
				pixels[2] = 8'b00000000;
				pixels[3] = 8'b00000000;
				pixels[4] = 8'b00000000;
				pixels[5] = 8'b00000000;
				pixels[6] = 8'b00000000;
				pixels[7] = 8'b00000000;
			end
			default: begin
				pixels[0] = 8'b00000000;
				pixels[1] = 8'b00000000;
				pixels[2] = 8'b00000000;
				pixels[3] = 8'b00000000;
				pixels[4] = 8'b00000000;
				pixels[5] = 8'b00000000;
				pixels[6] = 8'b00000000;
				pixels[7] = 8'b00000000;
			end
		endcase
	end
	
endmodule
