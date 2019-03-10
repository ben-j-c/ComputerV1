.data data.txt
.include memoryConfig.txt

movi ax, 0;
movi ax, 0;
movi bx, 0;
movi cx, 0;
movi dx, 0;
movi sp, STACK_BASE;

call ENABLE_SW_INT;
call ENABLE_KEYBOARD_INT_DPAD;

movi ax, 1;
scr cr0, ax;

END:
jmp END;

PRESSED_UP:
	push ax;
	movi ax, 1;
	pop ax;
return;

PRESSED_DOWN:

return;

PRESSED_LEFT:

return;

PRESSED_RIGHT:

return;

TIMER:
	push ax;
	inp ax, PORT_LED;
	addi ax, 1;
	andi ax, 15;
	outp ax, PORT_LED;
	pop ax;
return;

.include ISR/sw_int.asm
.include ISR/keyboard_int_dpad.asm