module keyboard_input(input CLOCK_50, service, input[3:0] KEY, output reg[15:0] data, output reg DE, DRW);
	reg flag;
	
	wire[3:0] keys;
	reg[3:0] lastState;
	reg[3:0] edges;
	assign keys = ~KEY;
	
	always@(posedge CLOCK_50) begin
		edges <= edges? 0:lastState^keys;
		lastState <= keys;
	end
	
	always@(posedge edges) begin
		if(edges[0]) begin
			if(keys[0])
				data <= 16'b0000_0001;
			else
				data <= 16'b0001_0000;
				
			DE <= 1;
			DRW <= 1;
		end
		else if(edges[1]) begin
			if(keys[1])
				data <= 16'b0000_0010;
			else
				data <= 16'b0010_0000;
			DE <= 1;
			DRW <= 1;
		end
		else if(edges[2]) begin
			if(keys[2])
				data <= 16'b0000_0100;
			else
				data <= 16'b0100_0100;
			DE <= 1;
			DRW <= 1;
		end
		else if(edges[3]) begin
			if(keys[3])
				data <= 16'b0000_1000;
			else
				data <= 16'b1000_0000;
			DE <= 1;
			DRW <= 1;
		end
	end
endmodule
