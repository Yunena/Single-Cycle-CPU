

module ALU(aluout_o,zero_o,src0_i,src1_i,aluop_i);

	input  [31:0] 		src0_i;
	input  [31:0]		src1_i;
	input  [1:0]		aluop_i;		
	
	output reg[31:0]		aluout_o;
	output reg				zero_o;			
	
	initial								//初始化数据
	begin
		zero_o = 0;
		aluout_o = 0;
	end	
	
	always@(src0_i or src1_i or aluop_i)
	begin
		if(aluop_i == 2'b00)
			aluout_o = src0_i+src1_i;
		else if(aluop_i == 2'b01)
				aluout_o = src0_i-src1_i;
		else if(aluop_i == 2'b10)
				aluout_o = src0_i|src1_i;
		
		
		if(aluout_o == 0)
			zero_o = 1;
		else
			zero_o = 0;
	end

endmodule
