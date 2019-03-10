ENABLE_KEYBOARD_INT_WRITER:
sint 0x3, KEYBOARD_INT_WRITER;
gcr sys, inten;
ori sys, 0b1000;
scr inten, sys;
ret;


KEYBOARD_INT_WRITER:
	inp sys, 0x03;
	outp sys, PORT_HEX;
	cmpi sys, 0xF0;
	jz KEYBOARD_INT_DONE;
	cmpi sys, 0x12;
	jz KEYBOARD_INT_SHIFT;
	cmpi sys, 0x59;
	jz KEYBOARD_INT_SHIFT;
	cmpi sys, 0x58;
	jz KEYBOARD_INT_CAPS;
	cmpi sys, 0x66;
	jz KEYBOARD_INT_BACKSPACE;
	jmp KEYBOARD_INT_OTHER;
	
	
	
	KEYBOARD_INT_SHIFT:
		getmi sys, KEY_RELEASED;
		cmpi sys, 1;
		jz KEYBOARD_INT_SHIFT_RELEASED;
		movi sys, 1;
		setmi sys, SHIFT_DOWN;
	jmp KEYBOARD_INT_DONE;
		KEYBOARD_INT_SHIFT_RELEASED:
		movi sys, 0;
		setmi sys, SHIFT_DOWN;
	jmp KEYBOARD_INT_DONE;
	
	
	
	KEYBOARD_INT_CAPS:
		getmi sys, KEY_RELEASED;
		cmpi sys, 1;
		jz KEYBOARD_INT_DONE;
		getmi sys, CAP_LOCK;
		xori sys, 1;
		setmi sys, CAP_LOCK;
	jmp KEYBOARD_INT_DONE;
	


	KEYBOARD_INT_PROCESS_RELEASED_KEYS:
		inp sys, 0x03;
		iseqi sys, 0xF0;
		setmi sys, KEY_RELEASED;
	ret;
	
	
	
	KEYBOARD_INT_BACKSPACE:
		getmi sys, KEY_RELEASED;
		cmpi sys, 1;
		jz KEYBOARD_INT_DONE;
		getmi sys, CURSOR_IDX;
		cmpi sys, 0x8000;
		jnz KEYBOARD_INT_NOT_LOW_BOUND;
	jmp KEYBOARD_INT_DONE;
		KEYBOARD_INT_NOT_LOW_BOUND:
		push ax;
		movi ax, 0;
		dec sys;
		setm sys, ax;
		setmi sys, CURSOR_IDX;
		pop ax;
	jmp KEYBOARD_INT_DONE;
	
	
	
	KEYBOARD_INT_OTHER:
		setmi sys, KDECODE_IN;
		getmi sys, KEY_RELEASED;
		cmpi sys, 1;
		jz KEYBOARD_INT_DONE;
		getmi sys, KDECODE_IN;
		setmi sys, CODED_KEY;
		getmi sys, KDECODE_OUT;
		setmi sys, DECODED_KEY;
		
		push ax;
		getmi ax, CURSOR_IDX;
		ori sys, 0x0F00;
		setm ax, sys;
		
		mov sys, ax;
		iseqi ax, 0x92BF;
		xori ax, 1;
		add sys, ax;
		setmi sys, CURSOR_IDX;
		pop ax;
	KEYBOARD_INT_DONE:
	call KEYBOARD_INT_PROCESS_RELEASED_KEYS;
	lalu;
	movi system, 1;
	scr 0x0, sys;
ret;