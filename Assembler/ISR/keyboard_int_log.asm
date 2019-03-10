ENABLE_KEYBOARD_INT_LOG:
push cx;
sint 0x3, KEYBOARD_INT_LOG;
gcr cx, 0x01;
ori cx, 0b1000;
scr 0x01, cx;
outp cx, PORT_HEX;
pop cx;
ret;


KEYBOARD_INT_LOG:
	inp sys, PORT_KEYBOARD;
	outp sys, PORT_HEX;
	push ax;
	
	getmi ax, INDEX;
	setm ax, sys;
	inc ax;
	setmi ax, INDEX;
	pop ax;
	
	lalu;
	movi system, 1;
	scr 0x0, system;
ret;