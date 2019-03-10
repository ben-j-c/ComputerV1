module regFile(clk, oeb, we, inc, dec, dst, src, dst_result, dst_dat, src_dat);
	parameter SIZE = 1, COUNT = 1;
	input clk, oeb, we, inc, dec;
	input[$clog2(COUNT) - 1:0] dst, src;
	input[SIZE - 1:0] dst_result;
	output[SIZE - 1:0] dst_dat, src_dat;
	
	reg[SIZE- 1:0] file[COUNT - 1:0];
	wire dst_content;
	
	assign dst_dat = inc? (file[dst] + 1):file[dst];
	assign src_dat = (oeb)? file[src]: {SIZE{1'bz}};
	
	wire idEn, decrement;
	assign idEn = inc | dec;
	assign decrement = dec&~inc;//0:increment, 1: decrement
	
	always@(posedge clk)
		if(we)
			file[dst] <= idEn? (decrement? (file[dst] - 1):(file[dst] + 1)):dst_result;
endmodule
