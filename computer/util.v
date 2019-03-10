module muxN(a,b,s,z);//Generic N bit 2 to 1 mux
	parameter SIZE = 1;
	input[SIZE-1:0] a,b;
	input s;
	output[SIZE-1:0] z;
	
	assign z = ({SIZE{~s}} & a) | ({SIZE{s}} & b);
	
endmodule

module bcdToHex(bcd, hex);
	input[3:0] bcd;
	reg[6:0] z;
	output[6:0]hex;
	
	assign hex = ~z;
	
	always @* case (bcd)//lookup table
		4'b0000 :z = 7'b0111111;
		4'b0001 :z = 7'b0000110;
		4'b0010 :z = 7'b1011011; 
		4'b0011 :z = 7'b1001111;
		4'b0100 :z = 7'b1100110;
		4'b0101 :z = 7'b1101101;  
		4'b0110 :z = 7'b1111101;
		4'b0111 :z = 7'b0000111;
		4'b1000 :z = 7'b1111111;
		4'b1001 :z = 7'b1100111;
		4'b1010 :z = 7'b1110111; 
		4'b1011 :z = 7'b1111100;
		4'b1100 :z = 7'b0111001;
		4'b1101 :z = 7'b1011110;
		4'b1110 :z = 7'b1111001;
		4'b1111 :z = 7'b1110001;
	endcase
endmodule

module decoder(input[3:0] s,input en, output reg[15:0] lines);
	always@(*) begin
		if(en)
			case(s)
				0: lines = 16'b0000_0000_0000_0001;
				1: lines = 16'b0000_0000_0000_0010;
				2: lines = 16'b0000_0000_0000_0100;
				3: lines = 16'b0000_0000_0000_1000;
				4: lines = 16'b0000_0000_0001_0000;
				5: lines = 16'b0000_0000_0010_0000;
				6: lines = 16'b0000_0000_0100_0000;
				7: lines = 16'b0000_0000_1000_0000;
				8: lines = 16'b0000_0001_0000_0000;
				9: lines = 16'b0000_0010_0000_0000;
				10:lines = 16'b0000_0100_0000_0000;
				11:lines = 16'b0000_1000_0000_0000;
				12:lines = 16'b0001_0000_0000_0000;
				13:lines = 16'b0010_0000_0000_0000;
				14:lines = 16'b0100_0000_0000_0000;
				15:lines = 16'b1000_0000_0000_0000;
			endcase
		else
			lines = 16'b0000_0000_0000_0000;
	end
endmodule

//divide clk by countTo*2
module fdiv(input clk, reset, output reg fout);
	parameter SIZE = 1, countTo = 1;
	
	reg[SIZE - 1:0] count;
	always @(posedge clk, negedge reset) begin
		
		if(~reset) begin
			count = 0;
			fout = 0;
		end
		else begin
			if((count + 1) == countTo) begin
				fout = ~fout;
				count = 0;
			end
			else begin
				count = count + 1;
			end
		end
	end
endmodule


//Delay input signal by parameter LENGTH
module pipeProgress(input[WIDTH-1:0] d, input clk, reset, output[WIDTH-1:0] q);
	parameter WIDTH = 1, LENGTH = 1;
	
	reg [WIDTH-1:0] pipe[LENGTH-1:0];
	
	assign q = pipe[LENGTH-1];
	
	always @(posedge clk) begin
		pipe[0] <= d;
	end
	genvar i;
	generate
		for (i = 1;i < LENGTH; i = i + 1) begin : pipeline
			always @(posedge clk) begin
				if (reset)
					pipe[i] <= 0;
				else
					pipe[i] <= pipe[i-1];
			end
		end
	endgenerate
endmodule
