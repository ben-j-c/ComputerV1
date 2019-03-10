module ports(clock, en, HE, DE, HRW, DRW, port, host_dat, device_dat, service);
	parameter SIZE = 16, COUNT = 16;
	input clock, en, HE;
	input[COUNT-1:0] DE;
	input HRW;
	input[COUNT-1:0] DRW;
	input[$clog2(COUNT) - 1:0] port;
	inout[SIZE - 1: 0]host_dat;
	inout[SIZE*COUNT - 1:0] device_dat;
	output[COUNT - 1:0] service;

	wire[15:0] line;
	decoder selector(port, en, line);
	
	wire[15:0] devices[15:0];
	genvar i;
	generate
		for(i = 0;i < 16;i = i + 1) begin : port_creation
			port #(SIZE) port_i(clock, HE&line[i], DE[i], HRW&line[i], DRW[i], host_dat, device_dat[((i+1)*16 - 1):(i*16)], service[i]);
		end
	endgenerate
endmodule
