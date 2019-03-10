/*
	Given an input of a matrix, and a vector, compute M*v
	7 clock cycles for ax -> dx, donex
	8  ''     ''   for ay -> dy, doney
	9  ''     ''   for az -> dz, donez
	Fully pipelined
	ax, ..., m9 can be changed when row is 3
*/
module matrixVecMult3x3(
	input[15:0] ax, ay, az, m1, m2, m3, m4, m5, m6, m7, m8, m9,
	input start, clk, reset,
	output[1:0] row,
	output reg donex, doney, donez,
	output reg [15:0] dx, dy, dz
);
	reg[1:0] count;
	assign row = count;
	
	pipeProgress #(1,6) progress(
		.clk(clk),
		.reset(reset),
		.d(start & (row == 2'b11))
		);
	
	pipeProgress #(16,2) zdelay(
		.clk(clk),
		.reset(reset),
		.d(multz.q));
	
	mult_half multX(
		.a(m1),
		.b(ax),
		.clk(clk),
		.areset(reset),
		);
	mult_half multy(
		.a(m2),
		.b(ax),
		.clk(clk),
		.areset(reset),
		);
	mult_half multz(
		.a(m3),
		.b(ax),
		.clk(clk),
		.areset(reset),
		);
		
	add_half rowAdd1(
		.a(multX.q),
		.b(multy.q),
		.clk(clk),
		.areset(reset),
		);
	
	add_half rowAdd2(
		.a(zdelay.q),
		.b(rowAdd1.q),
		.clk(clk),
		.areset(reset),
		);
	
	always @ (posedge clk) begin
		if(reset) begin
			count <= 0;
			donex <= 0;
			doney <= 0;
			donez <= 0;
			dx <= 0;
			dy <= 0;
			dz <= 0;
		end
		else begin
			count <= count + 2'b01;
			if(count == 2'b00) begin
				dx <= rowAdd2.q;
				donex <= progress.q? 1'b1:1'b0;
			end
			else if(count == 2'b01) begin
				dy <= rowAdd2.q;
				doney <= donex;
			end
			else begin
				dz <= rowAdd2.q;
				donez <= doney;
			end
		end
	end
endmodule
