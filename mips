
module mips( 
    input clk, rst_n ); 
    wire RFWr; 
    wire DMWr; 
    wire PCWr; 
    wire IRWr; 
    wire [1:0] EXTOp; 
    wire [1:0] ALUOp; 
    wire [1:0] NPCOp; 
    wire [1:0] RF_A3_sel; 
    wire [1:0] RF_WD_sel; 
    wire B_sel; 
    wire Zero; 
    wire [31:0] PC; 
    wire [31:0] dm_dout; 
    wire [31:0] DR_dout; 
    wire [31:0] instr;
    wire [31:0] Imm32; 
    wire [25:0] Imm26; 
    wire [4:0] A3; 
    wire [31:0] WD; 
    wire [31:0] RD1, RD1_r, RD2, RD2_r; 
    wire [31:0] B, C, C_r; 




 

    //ctrl
    ctrl U_CTRL ( 
      .clk(clk), 
      .rst_n(rst_n), 
      .Zero(Zero), 
      .OP(instr[31:26]), 
      .Funct(instr[5:0]), 
      .RFWr(RFWr), 
      .DMWr(DMWr), 
      .PCWr(PCWr), 
      .IRWr(IRWr), 
      .EXTOp(EXTOp), 
      .ALUOp(ALUOp), 
      .NPCOp(NPCOp), 
      .GPRSel(RF_A3_sel), 
      .WDSel(RF_WD_sel), 
      .BSel(B_sel) ); 
      //pc
    PC U_PC ( 
      .clk(clk), 
      .rst_n(rst_n), 
      .pc_sel_i(NPCOp),
      .Imm26_i(instr[25:0]),
      .pc_o(PC)); 
      //im
    IM U_IM ( 
      .addr_i(PC[11:2]) , 
      .dout_o(instr[31:0]) ); 
      //rf
    RF U_RF ( 
      .ra0_i(instr[25:21]), 
      .ra1_i(instr[20:16]), 
      .wa_i(A3), 
      .wd_i(WD), 
      .clk(clk),
      .rst_n(rst_n), 
      .we(RFWr), 
      .rd0_o(RD1), 
      .rd1_o(RD2) );  
      //
    mux4 #(5) U_MUX4_RF_A3 ( 
      .d0(instr[15:11]), 
      .d1(instr[20:16]), 
      .d2(5'd31), 
      .d3(5'd0), 
      .s(RF_A3_sel), 
      .y(A3) ); 
      //
    mux4 #(32) U_MUX4_RF_WD ( 
      .d0(C_r), 
      .d1(DR_dout), 
      .d2({PC[31:2],2'b00}), 
      .d3(32'd0), 
      .s(RF_WD_sel), 
      .y(WD) ); 
      //
    flopr #(32) U_A ( 
      .clk(clk), 
      .rst_n(rst_n), 
      .d(RD1), 
      .q(RD1_r) ); 
      //
    flopr #(32) U_B ( 
      .clk(clk), 
      .rst_n(rst_n), 
      .d(RD2), 
      .q(RD2_r)); 
      //ext
    EXT U_EXT (
      .Imm16(instr[15:0]), 
      .EXTOp(EXTOp), 
      .Imm32(Imm32) );
    
    mux2 #(32) U_MUX2_ALU_B ( 
      .d0(RD2_r), 
      .d1(Imm32), 
      .s(B_sel) , 
      .y(B) ); 
      //alu
    ALU U_ALU ( 
      .src0_i(RD1_r), 
      .src1_i(B), 
      .aluop_i(ALUOp), 
      .aluout_o(C), 
      .zero_o(Zero) ); 
      //
    flopr #(32) U_ALUOut ( 
      .clk(clk), 
      .rst_n(rst_n), 
      .d(C), 
      .q(C_r) );  
      //dm
   DM U_DM ( 
      .addr_i(C_r[11:2]), //
      .din_i(RD2_r), 
      .DMWr(DMWr), 
      .clk(clk), 
      .dout_o(dm_dout) );
      //
    flopr #(32) U_DR ( 
      .clk(clk), 
      .rst_n(rst_n), 
      .d(dm_dout), 
      .q(DR_dout) ); 
      
      

    
endmodule
