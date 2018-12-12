
module PC(clk,rst_n,pc_sel_i,Imm26_i,pc_o);

	input   clk;
	input   rst_n;
	input   [1:0]pc_sel_i;
	input   [25:0] Imm26_i;//jal指令的低26位
	
	output reg[31:0] pc_o;
	
	always@(posedge clk or posedge rst_n)
	begin
		if(rst_n)
			pc_o = 32'h0000_3000;
		else if(pc_sel_i==2'b10)
			pc_o = {pc_o[31:28],Imm26_i,2'b00};
		else if(pc_sel_i==2'b01) 
		  pc_o= pc_o+32'd4+$signed({(Imm26_i[15] ? 14'h3fff : 14'h0000),Imm26_i[15:0],2'b00});
		else	
			pc_o = pc_o + 32'd4;
	end
endmodule
	
	