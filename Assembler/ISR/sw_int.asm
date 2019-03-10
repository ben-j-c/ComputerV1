ENABLE_SW_INT:
sint 0x0, SW_INT;
gcr sys, 0x01;
ori sys, 1;
scr 0x01, sys;
ret;

SW_INT:
	inp sys, PORT_SW;
	setmi sys, SW_STATE;
	getmi sys, TIME_EPOCH_LOW;
	addi sys, 1;
	setmi sys, TIME_EPOCH_LOW;
	getmi sys, TIME_EPOCH_HIGH;
	addci sys, 0;
	setmi sys, TIME_EPOCH_HIGH;
	
	call TIMER;
	
	lalu;
	movi system, 1;
	scr 0x0, system;
ret