`include "instruction_def.v"
module ctrl(
	input clk,
	input rst_n,
	input[5:0] OP,
	input[5:0] Funct,
	input Zero,
	output BSel,
	output[1:0] WDSel,
	output RFWr,
	output DMWr,
	output[1:0] NPCOp,
	output[1:0] EXTOp,
	output[1:0] ALUOp,
	output PCWr,
	output IRWr,
	output[1:0] GPRSel
	);
reg bsel;
reg[1:0] wdsel;
reg rfwr;
reg dmwr;
reg[1:0] npcop;
reg[1:0] extop;
reg[1:0] aluop;
reg[1:0] gprsel;
reg pcwr;
reg irwr;

initial begin
	bsel=0;
	wdsel=2'b00;
	rfwr=0;
	dmwr=0;
	npcop=2'b00;
	extop=2'b00;
	aluop=2'b00;
	pcwr=0;
	irwr=0;
	gprsel=2'b00;
end
always@(OP or Funct or Zero) begin
case(OP)  
`CTRL_OP_RTYPE: begin
	case(Funct)
		`CTRL_FUNCT_ADDU: aluop =2'b00;
    `CTRL_FUNCT_SUBU: aluop =2'b01;
     default: aluop = 2'b00;
	endcase

	bsel=0;
	wdsel=2'b00;
	rfwr=1;
	dmwr=0;
	npcop=2'b00;
	extop=2'b00;
	pcwr=0;
	irwr=0;
	gprsel=2'b00;
end

`CTRL_OP_ORI:begin
	aluop=2'b10;
	bsel=1;
	wdsel=2'b00;
	rfwr=1;
	dmwr=0;
	npcop=2'b00;
	extop=2'b00;
	pcwr=0;
	irwr=0;
	gprsel=2'b01;
end

`CTRL_OP_LW: begin
	bsel=1;
	aluop = 2'b00;
	wdsel=2'b01;
	rfwr=1;
	dmwr=0;
	npcop=2'b00;
	extop=2'b01;
	pcwr=0;
	irwr=0;
	gprsel=2'b01;
end

`CTRL_OP_SW: begin
	bsel=1;
	aluop = 2'b00;
	wdsel=2'b00;
	rfwr=0;
	dmwr=1;
	npcop=2'b00;
	extop=2'b01;
	pcwr=0;
	irwr=0;
	gprsel=2'b01;
end

`CTRL_OP_BEQ: begin

	bsel=0;
	aluop = 2'b01;
	wdsel=2'b00;
	rfwr=0;
	dmwr=0;
	extop=2'b01;
	case(Zero)
	1: begin
		npcop=2'b01;
		pcwr=1;
		irwr=0;
		gprsel=2'b00;
		end
	default: begin
		npcop=2'b00;
		pcwr=0;
		irwr=0;
		gprsel=2'b00;
		end
	endcase
end

`CTRL_OP_JAL: begin
	bsel=0;
	aluop = 2'b00;
	wdsel=2'b10;
	rfwr=1;
	dmwr=1;
	npcop=2'b10;
	extop=2'b00;
	pcwr=1;
	irwr=0;
	gprsel=2'b10;

end
	default:  begin
	bsel=0;
	wdsel=2'b00;
	rfwr=0;
	dmwr=0;
	npcop=2'b00;
	extop=2'b00;
	aluop=2'b00;
	pcwr=0;
	irwr=0;
	gprsel=2'b00;
end
endcase
end
assign BSel=bsel;
assign ALUOp=aluop;
assign WDSel=wdsel;
assign RFWr=rfwr;
assign DMWr=dmwr;
assign NPCOp=npcop;
assign EXTOp=extop;
assign PCWr=pcwr;
assign IRWr=irwr;
assign GPRSel=gprsel;
endmodule