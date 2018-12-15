

module IM(addr_i,dout_o);
	input [11:2] addr_i;
	
	output [31:0]  dout_o;
	
	reg[31:0] dout;
	
	reg [31:0]  IMem[1023:0];
	
	always@(addr_i)
	dout<=IMem[addr_i];

assign dout_o=dout;
endmodule
