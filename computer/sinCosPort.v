/*
	Fixed point sin and cos
	
	16-bit input width.  Lower 13 denote the fraction; upper 3 denote the sign and integer
	15-bit input width.  Lower 13 denote the fraction; upper 2 denote the sign and integer

	e.g., input = {3'b101,13'b1_1000_0000_0000} is -1.75 radians.  It then follows that
	output should be: sin = {2'b10,13'b1_1111_0111_1101} = -0.98400878906, cos = {...}
*/

module sinCosPort(
	input clk, 
	input service_input, service_sin, service_cos,
	inout[15:0] data_input, data_sin, data_cos,
	output de_sin, drw_sin, de_cos, drw_cos, de_input, drw_input
	);
	
	
	assign de_input = service_input;
	
	reg[1:0] cycleCount;
	reg writeToOutput;
	
	
	assign de_sin = writeToOutput;
	assign drw_sin = writeToOutput;
	assign de_cos = writeToOutput;
	assign drw_cos = writeToOutput;
	
	cordicFixedPoint cordicfp(
		.clk(clk),
		.areset(0),
		.a(data_input),
		.c(data_cos),
		.s(data_sin)
);
	
	always @(posedge clk) begin
		if((|cycleCount) | service_input) // if the computation is processing, or it needs to start
			cycleCount <= cycleCount + 1;
			
		if( &cycleCount ) // 4 cylces to complete, i.e., on the 4th count, write to output
			writeToOutput <= 1;
		else
			writeToOutput <= 0;
			
	end
	
endmodule
	