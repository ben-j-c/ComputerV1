module ControlUnit(
	input[31:0] instruction,
	input[31:0] PORT_service,
	inout[15:0] bus,
	input clk, ALU_cout, ALU_zero, ALU_sign, //DM_readDone,
	output reg [15:0] PM_addr, imm,
	output cr2,
	output reg[3:0] ALU_opcode, RF_dst, RF_src,
	output reg[4:0] PORT_select,
	output reg 
			PORT_he, PORT_hrw, 
			ALU_we, ALU_oe, ALU_loadState,
			RF_we, RF_oe, RF_inc, RF_dec,
			PM_ae,
			DM_we, DM_ade, DM_oe, DM_adx,
			CU_ie, CU_ie_address,
	output
			CU_debugEnable,
	output[5:0] instrCode
	);
	
	wire DM_readDone;
	assign DM_readDone = 1;
	
	wire[15:0] immediate, crOut, interrupt_mask, unserviced_interrupts;
	wire[3:0] dst, src, next_irq;
	wire interruptEnable, unserviced_irq;
	
	assign immediate = instruction[31:16];
	assign instrCode = instruction[5:0];
	assign dst = instruction[9:6];
	assign src = instruction[13:10];
	
	//assign bus = (CU_ie)? immediate:'bz;
	
	reg[15:0] iPointer, nextIPointer;
	reg[15:0] interruptVectorTable [15:0];
	reg[15:0] control_registers [7:0];
	reg[2:0] state, nextState;

	triState(.bus(bus), .data( (instrCode == 49)? iPointer:imm), .en(CU_ie));

	/*
	state 0: normal cycle 1 of typical instruction
	state 1: normal cycle 2 of typical instruction
	state 2: interrupt cycle 1
	state 3: interrupt cycle 2
	*/
	
	initial begin
		nextState = 0;
		iPointer = 0;
	end
	
	assign cr2 = control_registers[2];
	assign CU_debugEnable = control_registers[0][1];
	assign interrupt_mask = control_registers[1];
	assign interruptEnable = control_registers[0][0];
	assign unserviced_interrupts = interrupt_mask&PORT_service[15:0];
	assign unserviced_irq = |(unserviced_interrupts);
	nextIrq getNextIRQ(unserviced_interrupts, next_irq);
	
	
	/*
	Registers
	*/
	assign crOut = control_registers[src];
	always@(posedge clk) begin 
		iPointer <= nextIPointer;
		state <= nextState;
		if(instrCode == 52) begin
			control_registers[dst] = bus;
		end
		else if(instrCode == 53) begin
			interruptVectorTable[dst] = immediate;
		end
		
		if(state == 3)
			control_registers[0][0] = 0;
	end
	
	
	/*
	Combinational logic (even though it synthesizes to latches (easy fix))
	*/
	always@(*) begin
		ALU_opcode = (instrCode == 55)? (2):instrCode[3:0];
		PM_addr = nextIPointer;
		PORT_select = immediate[4:0];
		
		if(state == 0) begin //Step one of instructions.  This is often the only instruction.
			if(~instrCode[5]) begin //all arithmetic operations
				ALU_oe = 0;
				ALU_we = 1;
				ALU_loadState = 0;
				CU_ie = instrCode[4];
				CU_ie_address = 0;
				DM_ade = 0;
				DM_oe = 0;
				DM_we = 0;
				DM_adx = 'bx;
				PM_ae = 0;
				PORT_he = 0;
				PORT_hrw = 0;
				RF_dec = 0;
				RF_dst = dst;
				RF_inc = 0;
				RF_oe = ~instrCode[4];
				RF_src = src;
				RF_we = 0;
				nextState = 1;
				nextIPointer = iPointer;
				imm = immediate;
			end
			else if(instrCode == 32) begin //inc
				ALU_oe = 0;
				ALU_we = 0;
				ALU_loadState = 0;
				CU_ie = 0;
				CU_ie_address = 0;
				DM_ade = 0;
				DM_oe = 0;
				DM_we = 0;
				DM_adx = 'bx;
				PM_ae = 1;
				PORT_he = 0;
				PORT_hrw = 0;
				RF_dec = 0;
				RF_dst = dst;
				RF_inc = 1;
				RF_oe = 0;
				RF_src = 'bx;
				RF_we = 1;
				nextState = (unserviced_irq&interruptEnable)? 2:0;
				nextIPointer = iPointer + 1;
				imm = immediate;
			end
			else if(instrCode == 33) begin //dec
				ALU_oe = 0;
				ALU_we = 0;
				ALU_loadState = 0;
				CU_ie = 0;
				CU_ie_address = 0;
				DM_ade = 0;
				DM_oe = 0;
				DM_we = 0;
				DM_adx = 'bx;
				PM_ae = 1;
				PORT_he = 0;
				PORT_hrw = 0;
				RF_dst = dst;
				RF_inc = 0;
				RF_oe = 0;
				RF_src = 'bx;
				RF_dec = 1;
				RF_we = 1;
				nextState = (unserviced_irq&interruptEnable)? 2:0;
				nextIPointer = iPointer + 1;
				imm = immediate;
			end
			else if(instrCode == 34) begin //cmp
				ALU_oe = 0;
				ALU_we = 1;
				ALU_loadState = 0;
				CU_ie = 0;
				CU_ie_address = 0;
				DM_ade = 0;
				DM_oe = 0;
				DM_we = 0;
				DM_adx = 'bx;
				PM_ae = 1;
				PORT_he = 0;
				PORT_hrw = 0;
				RF_dec = 0;
				RF_dst = dst;
				RF_inc = 0;
				RF_oe = 1;
				RF_src = src;
				RF_we = 0;
				nextState = (unserviced_irq&interruptEnable)? 2:0;
				nextIPointer = iPointer + 1;
				imm = immediate;
			end
			else if(instrCode == 35) begin //wait
				ALU_oe = 'bx;
				ALU_we = 0;
				ALU_loadState = 0;
				CU_ie = 'bx;
				CU_ie_address = 0;
				DM_ade = 0;
				DM_oe = 'bx;
				DM_we = 0;
				DM_adx = 'bx;
				PM_ae = 1;
				PORT_he = 'bx;
				PORT_hrw = 0;
				RF_dec = 0;
				RF_dst = 'bx;
				RF_inc = 0;
				RF_oe = 'bx;
				RF_src = 'bx;
				RF_we = 0;
				nextState = (unserviced_irq&interruptEnable)? 2:0;
				nextIPointer = (~(PORT_service[imm[4:0]]^imm[5]))? (iPointer + 1):iPointer;
				imm = immediate;
			end
			else if(instrCode == 36) begin //mov
				ALU_oe = 0;
				ALU_we = 0;
				ALU_loadState = 0;
				CU_ie = 0;
				CU_ie_address = 0;
				DM_ade = 0;
				DM_oe = 0;
				DM_we = 0;
				DM_adx = 'bx;
				PM_ae = 1;
				PORT_he = 0;
				PORT_hrw = 0;
				RF_dec = 0;
				RF_dst = dst;
				RF_inc = 0;
				RF_oe = 1;
				RF_src = src;
				RF_we = 1;
				nextState = (unserviced_irq&interruptEnable)? 2:0;
				nextIPointer = iPointer + 1;
				imm = immediate;
			end
			else if(instrCode == 37) begin //movi
				ALU_oe = 0;
				ALU_we = 0;
				ALU_loadState = 0;
				CU_ie = 1;
				CU_ie_address = 0;
				DM_ade = 0;
				DM_oe = 0;
				DM_we = 0;
				DM_adx = 'bx;
				PM_ae = 1;
				PORT_he = 0;
				PORT_hrw = 0;
				RF_dec = 0;
				RF_dst = dst;
				RF_inc = 0;
				RF_oe = 0;
				RF_src = 'bx;
				RF_we = 1;
				nextState = (unserviced_irq&interruptEnable)? 2:0;
				nextIPointer = iPointer + 1;
				imm = immediate;
			end
			else if(instrCode == 38) begin //getm
				ALU_oe = 0;
				ALU_we = 0;
				ALU_loadState = 0;
				CU_ie = 0;
				CU_ie_address = 0;
				DM_ade = 1;
				DM_oe = 0;
				DM_we = 0;
				DM_adx = 0;
				PM_ae = 0;
				PORT_he = 0;
				PORT_hrw = 0;
				RF_dec = 0;
				RF_dst = src;
				RF_inc = 0;
				RF_oe = 0;
				RF_src = 'bx;
				RF_we = 0;
				nextState = 1;
				nextIPointer = iPointer;
				imm = immediate;
			end
			else if(instrCode == 39) begin //setm
				ALU_oe = 0;
				ALU_we = 0;
				ALU_loadState = 0;
				CU_ie = 0;
				CU_ie_address = 0;
				DM_ade = 1;
				DM_oe = 0;
				DM_adx = 0;
				DM_we = 1;
				PM_ae = 1;
				PORT_he = 0;
				PORT_hrw = 0;
				RF_dec = 0;
				RF_dst = dst;
				RF_inc = 0;
				RF_oe = 1;
				RF_src = src;
				RF_we = 0;
				nextState = (unserviced_irq&interruptEnable)? 2:0;
				nextIPointer = iPointer + 1;
				imm = immediate;
			end
			else if(instrCode == 40) begin //inp
				ALU_oe = 0;
				ALU_we = 0;
				ALU_loadState = 0;
				CU_ie = 0;
				CU_ie_address = 0;
				DM_ade = 0;
				DM_oe = 0;
				DM_we = 0;
				DM_adx = 'bx;
				PM_ae = 1;
				PORT_he = 1;
				PORT_hrw = 0;
				RF_dec = 0;
				RF_dst = dst;
				RF_inc = 0;
				RF_oe = 0;
				RF_src = 'bx;
				RF_we = 1;
				nextState = (unserviced_irq&interruptEnable)? 2:0;
				nextIPointer = iPointer + 1;
				imm = immediate;
			end
			else if(instrCode == 41) begin //outp
				ALU_oe = 0;
				ALU_we = 0;
				ALU_loadState = 0;
				CU_ie = 0;
				CU_ie_address = 0;
				DM_ade = 0;
				DM_oe = 0;
				DM_we = 0;
				DM_adx = 'bx;
				PM_ae = 1;
				PORT_he = 1;
				PORT_hrw = 1;
				RF_dec = 0;
				RF_dst = 'bx;
				RF_inc = 0;
				RF_oe = 1;
				RF_src = src;
				RF_we = 0;
				nextState = (unserviced_irq&interruptEnable)? 2:0;
				nextIPointer = iPointer + 1;
				imm = immediate;
			end
			else if(instrCode == 42) begin //jmp
				ALU_oe = 'bx;
				ALU_we = 0;
				ALU_loadState = 0;
				CU_ie = 'bx;
				CU_ie_address = 0;
				DM_ade = 0;
				DM_oe = 'bx;
				DM_we = 0;
				DM_adx = 'bx;
				PM_ae = 1;
				PORT_he = 'bx;
				PORT_hrw = 0;
				RF_dec = 0;
				RF_dst = 'bx;
				RF_inc = 0;
				RF_oe = 'bx;
				RF_src = 'bx;
				RF_we = 0;
				nextState = (unserviced_irq&interruptEnable)? 2:0;
				nextIPointer = immediate;
				imm = immediate;
			end
			else if(instrCode == 43) begin //jz
				ALU_oe = 'bx;
				ALU_we = 0;
				ALU_loadState = 0;
				CU_ie = 'bx;
				CU_ie_address = 0;
				DM_ade = 0;
				DM_oe = 'bx;
				DM_we = 0;
				DM_adx = 'bx;
				PM_ae = 1;
				PORT_he = 0;
				PORT_hrw = 0;
				RF_dec = 0;
				RF_dst = 'bx;
				RF_inc = 0;
				RF_oe = 'bx;
				RF_src = 'bx;
				RF_we = 0;
				nextState = (unserviced_irq&interruptEnable)? 2:0;
				nextIPointer = ALU_zero? imm:(iPointer+1);
				imm = immediate;
			end
			else if(instrCode == 44) begin //jnz
				ALU_oe = 'bx;
				ALU_we = 0;
				ALU_loadState = 0;
				CU_ie = 'bx;
				CU_ie_address = 0;
				DM_ade = 0;
				DM_oe = 'bx;
				DM_we = 0;
				DM_adx = 'bx;
				PM_ae = 1;
				PORT_he = 0;
				PORT_hrw = 0;
				RF_dec = 0;
				RF_dst = 'bx;
				RF_inc = 0;
				RF_oe = 'bx;
				RF_src = 'bx;
				RF_we = 0;
				nextState = (unserviced_irq&interruptEnable)? 2:0;
				nextIPointer = ALU_zero? (iPointer+1):imm;
				imm = immediate;
			end
			else if(instrCode == 45) begin //js
				ALU_oe = 'bx;
				ALU_we = 0;
				ALU_loadState = 0;
				CU_ie = 'bx;
				CU_ie_address = 0;
				DM_ade = 0;
				DM_oe = 'bx;
				DM_we = 0;
				DM_adx = 'bx;
				PM_ae = 1;
				PORT_he = 0;
				PORT_hrw = 0;
				RF_dec = 0;
				RF_dst = 'bx;
				RF_inc = 0;
				RF_oe = 'bx;
				RF_src = 'bx;
				RF_we = 0;
				nextState = (unserviced_irq&interruptEnable)? 2:0;
				nextIPointer = ALU_sign? imm:(iPointer+1);
				imm = immediate;
			end
			else if(instrCode == 46) begin //jns
				ALU_oe = 'bx;
				ALU_we = 0;
				ALU_loadState = 0;
				CU_ie = 'bx;
				CU_ie_address = 0;
				DM_ade = 0;
				DM_oe = 'bx;
				DM_we = 0;
				DM_adx = 'bx;
				PM_ae = 1;
				PORT_he = 0;
				PORT_hrw = 0;
				RF_dec = 0;
				RF_dst = 'bx;
				RF_inc = 0;
				RF_oe = 'bx;
				RF_src = 'bx;
				RF_we = 0;
				nextState = (unserviced_irq&interruptEnable)? 2:0;
				nextIPointer = ALU_sign? (iPointer+1):imm;
				imm = immediate;
			end
			else if(instrCode == 47) begin //push
				ALU_oe = 0;
				ALU_we = 0;
				ALU_loadState = 0;
				CU_ie = 0;
				CU_ie_address = 0;
				DM_ade = 1;
				DM_oe = 0;
				DM_we = 1;
				DM_adx = 0;
				PM_ae = 1;
				PORT_he = 0;
				PORT_hrw = 0;
				RF_dec = 1;
				RF_dst = 15;
				RF_inc = 0;
				RF_oe = 1;
				RF_src = src;
				RF_we = 1;
				nextState = (unserviced_irq&interruptEnable)? 2:0;
				nextIPointer = iPointer + 1;
				imm = immediate;
			end
			else if(instrCode == 48) begin //pop
				ALU_oe = 0;
				ALU_we = 0;
				ALU_loadState = 0;
				CU_ie = 0;
				CU_ie_address = 0;
				DM_ade = 1;
				DM_oe = 0;
				DM_we = 0;
				DM_adx = 0;
				PM_ae = 0;
				PORT_he = 0;
				PORT_hrw = 0;
				RF_dec = 0;
				RF_dst = 15;
				RF_inc = 1;
				RF_oe = 0;
				RF_src = 'bx;
				RF_we = 1;
				nextState = 1;
				nextIPointer = iPointer;
				imm = immediate;
			end
			else if(instrCode == 49) begin //call
				ALU_oe = 0;
				ALU_we = 0;
				ALU_loadState = 0;
				CU_ie = 1;
				CU_ie_address = 0;
				DM_ade = 1;
				DM_oe = 0;
				DM_we = 1;
				DM_adx = 0;
				PM_ae = 1;
				PORT_he = 0;
				PORT_hrw = 0;
				RF_dec = 1;
				RF_dst = 15;
				RF_inc = 0;
				RF_oe = 0;
				RF_src = 'bx;
				RF_we = 1;
				nextState = (unserviced_irq&interruptEnable)? 2:0;
				nextIPointer = immediate;
				imm = iPointer;
			end
			else if(instrCode == 50) begin //ret
				ALU_oe = 0;
				ALU_we = 0;
				ALU_loadState = 0;
				CU_ie = 0;
				CU_ie_address = 0;
				DM_ade = 1;
				DM_oe = 0;
				DM_we = 0;
				DM_adx = 0;
				PM_ae = 0;
				PORT_he = 0;
				PORT_hrw = 0;
				RF_dec = 0;
				RF_dst = 15;
				RF_inc = 1;
				RF_oe = 0;
				RF_src = 'bx;
				RF_we = 1;
				nextState = 1;
				nextIPointer = iPointer;
				imm = immediate;
			end
			else if(instrCode == 51) begin //gcr
				ALU_oe = 0;
				ALU_we = 0;
				ALU_loadState = 0;
				CU_ie = 1;
				CU_ie_address = 0;
				DM_ade = 0;
				DM_oe = 0;
				DM_we = 0;
				DM_adx = 'bx;
				PM_ae = 1;
				PORT_he = 0;
				PORT_hrw = 0;
				RF_dec = 0;
				RF_dst = dst;
				RF_inc = 0;
				RF_oe = 0;
				RF_src = src;
				RF_we = 1;
				nextState = (unserviced_irq&interruptEnable)? 2:0;
				nextIPointer = iPointer + 1;
				imm = crOut;
			end
			else if(instrCode == 52) begin //scr
				ALU_oe = 0;
				ALU_we = 0;
				ALU_loadState = 0;
				CU_ie = 0;
				CU_ie_address = 0;
				DM_ade = 0;
				DM_oe = 0;
				DM_we = 0;
				DM_adx = 'bx;
				PM_ae = 1;
				PORT_he = 0;
				PORT_hrw = 0;
				RF_dec = 0;
				RF_dst = dst;
				RF_inc = 0;
				RF_oe = 1;
				RF_src = src;
				RF_we = 0;
				nextState = (unserviced_irq&interruptEnable)? 2:0;
				nextIPointer = iPointer + 1;
				imm = immediate;
			end
			else if(instrCode == 53) begin //sint
				ALU_oe = 0;
				ALU_we = 0;
				ALU_loadState = 0;
				CU_ie = 0;
				CU_ie_address = 0;
				DM_ade = 0;
				DM_oe = 0;
				DM_we = 0;
				DM_adx = 'bx;
				PM_ae = 1;
				PORT_he = 0;
				PORT_hrw = 0;
				RF_dec = 0;
				RF_dst = dst;
				RF_inc = 0;
				RF_oe = 1;
				RF_src = src;
				RF_we = 0;
				nextState = (unserviced_irq&interruptEnable)? 2:0;
				nextIPointer = iPointer + 1;
				imm = immediate;
			end
			else if(instrCode == 54) begin //lalu
				ALU_oe = 0;
				ALU_we = 0;
				ALU_loadState = 0;
				CU_ie = 0;
				CU_ie_address = 0;
				DM_ade = 1;
				DM_oe = 0;
				DM_we = 0;
				DM_adx = 0;
				PM_ae = 0;
				PORT_he = 0;
				PORT_hrw = 0;
				RF_dec = 0;
				RF_dst = 15;
				RF_inc = 1;
				RF_oe = 0;
				RF_src = 'bx;
				RF_we = 1;
				nextState = 1;
				nextIPointer = iPointer;
				imm = immediate;
			end
			else if(instrCode == 55) begin //cmpi
				ALU_oe = 0;
				ALU_we = 1;
				ALU_loadState = 0;
				CU_ie = 1;
				CU_ie_address = 0;
				DM_ade = 0;
				DM_oe = 0;
				DM_we = 0;
				DM_adx = 'bx;
				PM_ae = 1;
				PORT_he = 0;
				PORT_hrw = 0;
				RF_dec = 0;
				RF_dst = dst;
				RF_inc = 0;
				RF_oe = 0;
				RF_src = src;
				RF_we = 0;
				nextState = (unserviced_irq&interruptEnable)? 2:0;
				nextIPointer = iPointer + 1;
				imm = immediate;
			end
			else if(instrCode == 56) begin //getmi
				ALU_oe = 0;
				ALU_we = 0;
				ALU_loadState = 0;
				CU_ie = 0;
				CU_ie_address = 1;
				DM_ade = 1;
				DM_oe = 0;
				DM_we = 0;
				DM_adx = 0;
				PM_ae = 0;
				PORT_he = 0;
				PORT_hrw = 0;
				RF_dec = 0;
				RF_dst = dst;
				RF_inc = 0;
				RF_oe = 0;
				RF_src = src;
				RF_we = 0;
				nextState = 1;
				nextIPointer = iPointer;
				imm = immediate;
			end
			else if(instrCode == 57) begin //setmi
				ALU_oe = 0;
				ALU_we = 0;
				ALU_loadState = 0;
				CU_ie = 0;
				CU_ie_address = 1;
				DM_ade = 1;
				DM_oe = 0;
				DM_we = 1;
				DM_adx = 0;
				PM_ae = 1;
				PORT_he = 0;
				PORT_hrw = 0;
				RF_dec = 0;
				RF_dst = dst;
				RF_inc = 0;
				RF_oe = 1;
				RF_src = src;
				RF_we = 0;
				nextState = (unserviced_irq&interruptEnable)? 2:0;
				nextIPointer = iPointer + 1;
				imm = immediate;
			end
			else if(instrCode == 58) begin //getmx
				ALU_oe = 0;
				ALU_we = 0;
				ALU_loadState = 0;
				CU_ie = 0;
				CU_ie_address = 0;
				DM_ade = 1;
				DM_oe = 0;
				DM_we = 0;
				DM_adx = 1;
				PM_ae = 0;
				PORT_he = 0;
				PORT_hrw = 0;
				RF_dec = 0;
				RF_dst = src;
				RF_inc = 0;
				RF_oe = 0;
				RF_src = 'bx;
				RF_we = 0;
				nextState = 1;
				nextIPointer = iPointer;
				imm = immediate;
			end
			else if(instrCode == 59) begin //setmx
				ALU_oe = 0;
				ALU_we = 0;
				ALU_loadState = 0;
				CU_ie = 0;
				CU_ie_address = 0;
				DM_ade = 1;
				DM_oe = 0;
				DM_adx = 1;
				DM_we = 1;
				PM_ae = 1;
				PORT_he = 0;
				PORT_hrw = 0;
				RF_dec = 0;
				RF_dst = dst;
				RF_inc = 0;
				RF_oe = 1;
				RF_src = src;
				RF_we = 0;
				nextState = (unserviced_irq&interruptEnable)? 2:0;
				nextIPointer = iPointer + 1;
				imm = immediate;
			end
			else if(instrCode == 60) begin //getmix
				ALU_oe = 0;
				ALU_we = 0;
				ALU_loadState = 0;
				CU_ie = 0;
				CU_ie_address = 1;
				DM_ade = 1;
				DM_oe = 0;
				DM_we = 0;
				DM_adx = 1;
				PM_ae = 0;
				PORT_he = 0;
				PORT_hrw = 0;
				RF_dec = 0;
				RF_dst = dst;
				RF_inc = 0;
				RF_oe = 0;
				RF_src = src;
				RF_we = 0;
				nextState = 1;
				nextIPointer = iPointer;
				imm = immediate;
			end
			else if(instrCode == 61) begin //setmix
				ALU_oe = 0;
				ALU_we = 0;
				ALU_loadState = 0;
				CU_ie = 0;
				CU_ie_address = 1;
				DM_ade = 1;
				DM_oe = 0;
				DM_we = 1;
				DM_adx = 1;
				PM_ae = 1;
				PORT_he = 0;
				PORT_hrw = 0;
				RF_dec = 0;
				RF_dst = dst;
				RF_inc = 0;
				RF_oe = 1;
				RF_src = src;
				RF_we = 0;
				nextState = (unserviced_irq&interruptEnable)? 2:0;
				nextIPointer = iPointer + 1;
				imm = immediate;
			end
			else begin
				ALU_oe = 0;
				ALU_we = 0;
				ALU_loadState = 0;
				CU_ie = 0;
				CU_ie_address = 0;
				DM_ade = 0;
				DM_oe = 0;
				DM_we = 0;
				DM_adx = 0;
				PM_ae = 0;
				PORT_he = 0;
				PORT_hrw = 0;
				RF_dec = 0;
				RF_dst = dst;
				RF_inc = 0;
				RF_oe = 0;
				RF_src = src;
				RF_we = 0;
				nextState = 0;
				nextIPointer = iPointer + 1;
				imm = immediate;
			end
		end //if (state == 0)
		else if(state == 1) begin //Step two of some instructions
			if(~instrCode[5]) begin //all arithmetic operations
				ALU_oe = 1;
				ALU_we = 0;
				ALU_loadState = 0;
				CU_ie = 0;
				CU_ie_address = 0;
				DM_ade = 0;
				DM_oe = 0;
				DM_we = 0;
				DM_adx = 'bx;
				PM_ae = 1;
				PORT_he = 0;
				PORT_hrw = 0;
				RF_dec = 0;
				RF_dst = dst;
				RF_inc = 0;
				RF_oe = 0;
				RF_src = 'bx;
				RF_we = 1;
				nextState = (unserviced_irq&interruptEnable)? 2:0;
				nextIPointer = iPointer + 1;
				imm = immediate;
			end
			else if(instrCode == 38) begin //getm
				ALU_oe = 0;
				ALU_we = 0;
				ALU_loadState = 0;
				CU_ie = 0;
				CU_ie_address = 0;
				DM_ade = 0;
				DM_oe = 1;
				DM_we = 0;
				DM_adx = 0;
				PM_ae = 1;
				PORT_he = 0;
				PORT_hrw = 0;
				RF_dec = 0;
				RF_dst = dst;
				RF_inc = 0;
				RF_oe = 0;
				RF_src = 'bx;
				RF_we = 1;
				nextState = DM_readDone? ((unserviced_irq&interruptEnable)? 2:0):1;
				nextIPointer = iPointer +{15'b0, DM_readDone};
				imm = immediate;
			end
			else if(instrCode == 48) begin //pop
				ALU_oe = 0;
				ALU_we = 0;
				ALU_loadState = 0;
				CU_ie = 0;
				CU_ie_address = 0;
				DM_ade = 0;
				DM_oe = 1;
				DM_we = 0;
				DM_adx = 0;
				PM_ae = 1;
				PORT_he = 0;
				PORT_hrw = 0;
				RF_dec = 0;
				RF_dst = dst;
				RF_inc = 0;
				RF_oe = 0;
				RF_src = 'bx;
				RF_we = 1;
				nextState = DM_readDone? ((unserviced_irq&interruptEnable)? 2:0):1;
				nextIPointer = iPointer +{15'b0, DM_readDone};
				imm = immediate;
			end
			else if(instrCode == 50) begin //ret
				ALU_oe = 0;
				ALU_we = 0;
				ALU_loadState = 0;
				CU_ie = 0;
				CU_ie_address = 0;
				DM_ade = 0;
				DM_oe = 1;
				DM_we = 0;
				DM_adx = 0;
				PM_ae = 1;
				PORT_he = 0;
				PORT_hrw = 0;
				RF_dec = 0;
				RF_dst = 15;
				RF_inc = 0;
				RF_oe = 0;
				RF_src = 'bx;
				RF_we = 0;
				nextState = DM_readDone? ((unserviced_irq&interruptEnable)? 2:0):1;
				nextIPointer = DM_readDone? (bus+1):iPointer;
				imm = immediate;
			end
			else if(instrCode == 54) begin //lalu
				ALU_oe = 0;
				ALU_we = 0;
				ALU_loadState = 1;
				CU_ie = 0;
				CU_ie_address = 0;
				DM_ade = 0;
				DM_oe = 1;
				DM_we = 0;
				DM_adx = 0;
				PM_ae = 1;
				PORT_he = 0;
				PORT_hrw = 0;
				RF_dec = 0;
				RF_dst = 15;
				RF_inc = 0;
				RF_oe = 0;
				RF_src = 'bx;
				RF_we = 0;
				nextState = DM_readDone? ((unserviced_irq&interruptEnable)? 2:0):1;
				nextIPointer = iPointer +{15'b0, DM_readDone};
				imm = immediate;
			end
			else if(instrCode == 56) begin //getmi
				ALU_oe = 0;
				ALU_we = 0;
				ALU_loadState = 0;
				CU_ie = 0;
				CU_ie_address = 1;
				DM_ade = 1;
				DM_oe = 1;
				DM_we = 0;
				DM_adx = 0;
				PM_ae = 1;
				PORT_he = 0;
				PORT_hrw = 0;
				RF_dec = 0;
				RF_dst = dst;
				RF_inc = 0;
				RF_oe = 0;
				RF_src = src;
				RF_we = 1;
				nextState = DM_readDone? ((unserviced_irq&interruptEnable)? 2:0):1;
				nextIPointer = iPointer +{15'b0, DM_readDone};
				imm = immediate;
			end
			else if(instrCode == 58) begin //getmx
				ALU_oe = 0;
				ALU_we = 0;
				ALU_loadState = 0;
				CU_ie = 0;
				CU_ie_address = 0;
				DM_ade = 0;
				DM_oe = 1;
				DM_we = 0;
				DM_adx = 1;
				PM_ae = 1;
				PORT_he = 0;
				PORT_hrw = 0;
				RF_dec = 0;
				RF_dst = dst;
				RF_inc = 0;
				RF_oe = 0;
				RF_src = 'bx;
				RF_we = 1;
				nextState = DM_readDone? ((unserviced_irq&interruptEnable)? 2:0):1;
				nextIPointer = iPointer + {15'b0, DM_readDone};
				imm = immediate;
			end
			else if(instrCode == 60) begin //getmix
				ALU_oe = 0;
				ALU_we = 0;
				ALU_loadState = 0;
				CU_ie = 0;
				CU_ie_address = 1;
				DM_ade = 1;
				DM_oe = 1;
				DM_we = 0;
				DM_adx = 1;
				PM_ae = 1;
				PORT_he = 0;
				PORT_hrw = 0;
				RF_dec = 0;
				RF_dst = dst;
				RF_inc = 0;
				RF_oe = 0;
				RF_src = src;
				RF_we = 1;
				nextState = DM_readDone? ((unserviced_irq&interruptEnable)? 2:0):1;
				nextIPointer = iPointer +{15'b0, DM_readDone};
				imm = immediate;
			end
			else begin
				ALU_oe = 0;
				ALU_we = 0;
				ALU_loadState = 0;
				CU_ie = 0;
				CU_ie_address = 0;
				DM_ade = 0;
				DM_oe = 0;
				DM_we = 0;
				DM_adx = 0;
				PM_ae = 0;
				PORT_he = 0;
				PORT_hrw = 0;
				RF_dec = 0;
				RF_dst = dst;
				RF_inc = 0;
				RF_oe = 0;
				RF_src = src;
				RF_we = 0;
				nextState = 0;
				nextIPointer = iPointer + 1;
				imm = immediate;
			end
		end
		else if(state == 2) begin //push instruction pointer and jump
			ALU_oe = 0;
			ALU_we = 0;
			ALU_loadState = 0;
			CU_ie = 1;
			CU_ie_address = 0;
			DM_ade = 1;
			DM_oe = 0;
			DM_we = 1;
			DM_adx = 0;
			PM_ae = 1;
			PORT_he = 0;
			PORT_hrw = 0;
			RF_dec = 1;
			RF_dst = 15;
			RF_inc = 0;
			RF_oe = 0;
			RF_src = 'bx;
			RF_we = 1;
			nextState = 3;
			nextIPointer = interruptVectorTable[next_irq];
			imm = (iPointer - 1);
		end
		else if(state == 3) begin //push alu state
			ALU_oe = 0;
			ALU_we = 0;
			ALU_loadState = 0;
			CU_ie = 1;
			CU_ie_address = 0;
			DM_ade = 1;
			DM_oe = 0;
			DM_we = 1;
			DM_adx = 0;
			PM_ae = 1;
			PORT_he = 0;
			PORT_hrw = 0;
			RF_dec = 1;
			RF_dst = 15;
			RF_inc = 0;
			RF_oe = 0;
			RF_src = 'bx;
			RF_we = 1;
			nextState = 0;
			nextIPointer = iPointer;
			imm = {13'b0, ALU_cout, ALU_zero, ALU_sign};
		end
		else if(state == 4) begin //push cr2
			ALU_oe = 0;
			ALU_we = 0;
			ALU_loadState = 0;
			CU_ie = 1;
			CU_ie_address = 0;
			DM_ade = 1;
			DM_oe = 0;
			DM_we = 1;
			DM_adx = 0;
			PM_ae = 1;
			PORT_he = 0;
			PORT_hrw = 0;
			RF_dec = 1;
			RF_dst = 15;
			RF_inc = 0;
			RF_oe = 0;
			RF_src = 'bx;
			RF_we = 1;
			nextState = 0;
			nextIPointer = iPointer;
			imm = control_registers[2];
		end
		else begin
			ALU_oe = 0;
			ALU_we = 0;
			ALU_loadState = 0;
			CU_ie = 0;
			CU_ie_address = 0;
			DM_ade = 0;
			DM_oe = 0;
			DM_we = 0;
			DM_adx = 0;
			PM_ae = 0;
			PORT_he = 0;
			PORT_hrw = 0;
			RF_dec = 0;
			RF_dst = dst;
			RF_inc = 0;
			RF_oe = 0;
			RF_src = src;
			RF_we = 0;
			nextState = 0;
			nextIPointer = iPointer + 1;
			imm = immediate;
		end
	end
	
endmodule

module triState(bus, data, en);
	parameter SIZE = 16;
	inout[SIZE-1:0] bus;
	input[SIZE-1:0] data;
	input en;
	
	assign bus = en? data:'bz;
endmodule

module nextIrq(irqs, nextIrq);
	input[15:0] irqs;
	output reg [3:0] nextIrq;
	
	always @(*) begin
		if(irqs[0])
			nextIrq = 0;
		else if(irqs[1])
			nextIrq = 1;
		else if(irqs[2])
			nextIrq = 2;
		else if(irqs[3])
			nextIrq = 3;
		else if(irqs[4])
			nextIrq = 4;
		else if(irqs[5])
			nextIrq = 5;
		else if(irqs[6])
			nextIrq = 6;
		else if(irqs[7])
			nextIrq = 7;
		else if(irqs[8])
			nextIrq = 8;
		else if(irqs[9])
			nextIrq = 9;
		else if(irqs[10])
			nextIrq = 10;
		else if(irqs[11])
			nextIrq = 11;
		else if(irqs[12])
			nextIrq = 12;
		else if(irqs[13])
			nextIrq = 13;
		else if(irqs[14])
			nextIrq = 14;
		else if(irqs[15])
			nextIrq = 15;
	end
endmodule
