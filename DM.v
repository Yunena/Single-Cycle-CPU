
module DM(dout_o,addr_i,din_i,DMWr,clk);
	input [11:2] addr_i;//
	input [31:0] din_i;
	input 		 DMWr;
	input 		 clk;

	output[31:0] dout_o;
	
	reg [31:0]  DMem[1023:0];
	integer i;
	initial begin
	  for(i=0;i<1024;i=i+1)
	  DMem[i]<=0;
	  end
	always@(posedge clk)
	begin
			DMem[addr_i] = din_i;
	end
	assign dout_o = DMem[addr_i];
endmodule