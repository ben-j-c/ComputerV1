module VGA_PORT_TEST(

	CLOCK_50, 
	
	//Port specific
	
	HE14, HE15,
	HRW14,HRW15,
	service14, service15,
	host_dat15, host_dat14,
	
	//VGA Specific
	
	VGA_R,
	VGA_G,
	VGA_B,
	VGA_CLK,
	VGA_BLANK_N,
	VGA_HS,
	VGA_VS,
	VGA_SYNC_N);
	
	input CLOCK_50, HE14, HRW14,HE15, HRW15;
	input[15:0] host_dat14, host_dat15;
	output service14,service15;
	
	
	output		          		VGA_BLANK_N;
	output		     [7:0]		VGA_B;
	output		          		VGA_CLK;
	output		     [7:0]		VGA_G;
	output		          		VGA_HS;
	output		     [7:0]		VGA_R;
	output		          		VGA_SYNC_N;
	output		          		VGA_VS;
	
	
	wire DE14,DE15, DRW14,DRW15;
	
	wire[15:0] device_dat14, device_dat15;
	
	
	port #(16) port_14(CLOCK_50, HE14, DE14, HRW14, DRW14, host_dat14, device_dat14, service14);
	port #(16) port_15(cLOCK_50, HE15, DE15, HRW15, DRW15, host_dat15, device_dat15, service15);
	
	VGA_PORT display(
	CLOCK_50,
	host_dat14, device_dat15, //data and address
	service14, service15,
	VGA_R, VGA_G, VGA_B, VGA_CLK, VGA_BLANK_N, VGA_HS, VGA_VS, VGA_SYNC_N,
	DRW14, DRW15, 
	DE14, DE15);
endmodule
