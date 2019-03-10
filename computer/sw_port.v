module sw_input(input CLOCK_50, service, input[9:0] SW, output [15:0] data, output DE, DRW);
	reg[31:0] counter;
	
	/*
	assign DE = SW[0];
	assign DRW = SW[0];
	assign data = {14'b0, SW[1]};
	*/
	
	initial
		counter = 0;

	assign data = {6'b0, SW};
	assign DE = ((counter + 1) == 50000);
	assign DRW = DE;
	
	always@(posedge CLOCK_50) begin
		if(counter + 1 == 50000) begin
			counter <= 0;
		end
		else begin
			counter <= counter + 1;
		end
	end
	
endmodule
