module led_output(input CLOCK_50, service, output reg[9:0] LEDR, input [15:0] data, output DE, DRW);
	
	assign DE = service;
	
	always @ (posedge CLOCK_50) begin
		if(service)
			LEDR <= data;
	end
	
endmodule
