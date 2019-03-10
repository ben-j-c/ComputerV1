//ALU capable of basic functions and comparisons
module ALU(
				input clk, we, oe , cin,
				input setState, input[2:0] newState,
				input[15:0] a, b,
				input[3:0] opcode,
				output [15:0] z_out,
				output reg cout, zero, sign);

	reg[15:0] z;
	
	assign z_out = oe? z:'bz; 
	always @(posedge clk) 
	if(we) begin
		case(opcode)
			0 : begin //add
				{cout, z} = a + b;
			end
			1 : begin //addc
				{cout, z} = a + b + cin;
			end
			2 : begin //sub
				{cout, z} = a - b;
			end
			3 : begin //subc;
				{cout, z} = a + (~b + cin);
			end
			4 : begin //shl
				z = a << b;
			end
			5 : begin //shr
				z = a >> b;
			end
			6 : begin //and
				z = a & b;
			end
			7 : begin //or
				z = a | b;
			end
			8 : begin //xor
				z = a ^ b;
			end
			9 : begin //reduction and
				z = &a;
			end
			10: begin //reduction or
				z = |a;
			end
			11: begin //reduction xor
				z = ^a;
			end
			12: begin //isgr
				z = (a > b);
			end
			13: begin //isls
				z = (a < b);
			end
			14: begin //iseq
				z = (a == b);
			end
			15: begin //sles
				z = (a < b)? a:b;
			end
		
		endcase
		zero = ~|z;
		sign = z[15];
	end
	else if(setState) begin
		cout = newState[2];
		zero = newState[1];
		sign = newState[0];
	end
endmodule
