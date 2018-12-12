
module EXT(
  input [15:0] Imm16,
  input [1:0]  EXTOp,
  output [31:0] Imm32
  );
  reg[31:0] imm;
  always@(*) begin
    case(EXTOp)
      0:imm={16'd0,Imm16};
      1:imm={Imm16[15] ? 16'hffff : 16'h0000,Imm16};
      2:imm={Imm16,16'd0};
    endcase
  end
	assign Imm32=imm;
endmodule
