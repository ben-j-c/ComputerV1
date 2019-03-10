ENABLE_KEYBOARD_INT_DPAD:
sint 0x3, KEYBOARD_INT_DPAD;
gcr sys, 0x01;
ori sys, 0b1000;
scr 0x01, sys;
ret;


KEYBOARD_INT_DPAD:
	inp sys, PORT_KEYBOARD;
	push sys;
	cmpi sys, 0xF0;
	jz KEYBOARD_INT_DONE;
	outp sys, PORT_HEX;
	getmi sys, KEYBOARD_RELEASED;
	cmpi sys, 1;
	jz KEYBOARD_INT_DONE;
	
	cmpi sys, 0x1D;
	jz KEYBOARD_INT_UP;
	cmpi sys, 0x1B;
	jz KEYBOARD_INT_DOWN;
	cmpi sys, 0x1C;
	jz KEYBOARD_INT_LEFT;
	cmpi sys, 0x23;
	jz KEYBOARD_INT_RIGHT;
	jmp KEYBOARD_INT_DONE;
	
	
	
	KEYBOARD_INT_UP:
		call PRESSED_UP
	jmp KEYBOARD_INT_DONE;
	
	
	
	KEYBOARD_INT_DOWN:
		call PRESSED_DOWN;
	jmp KEYBOARD_INT_DONE;
	
	
	
	KEYBOARD_INT_LEFT:
		call PRESSED_LEFT;
	jmp KEYBOARD_INT_DONE;
	
	
	
	KEYBOARD_INT_RIGHT:
		call PRESSED_RIGHT;
	jmp KEYBOARD_INT_DONE;
	
	
	
	KEYBOARD_INT_DONE:
	pop sys;
	iseqi sys, 0xF0;
	setmi sys, KEYBOARD_RELEASED;
	lalu;
	movi system, 1;
	scr 0x0, system;
ret;