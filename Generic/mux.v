module mux2#(parameter WIDTH=8)(
  input s,
  input [WIDTH-1:0] d0,
  input [WIDTH-1:0] d1,
  output [WIDTH-1:0] y
  );
  assign y = s ? d1 : d0;

endmodule

module mux4#(parameter WIDTH=8)(
  input [1:0]s,
  input [WIDTH-1:0] d0,
  input [WIDTH-1:0] d1,
  input [WIDTH-1:0] d2,
  input [WIDTH-1:0] d3,
  output [WIDTH-1:0] y
  );
  reg[WIDTH-1:0] r;
  always@(*)
  begin
    case(s)
      2'b00: r=d0;
      2'b01: r=d1;
      2'b10: r=d2;
      2'b11: r=d3;
    endcase
  end
  assign y=r;
  
endmodule
   
 module mux8#(parameter WIDTH=8)(
  input [2:0]s,
  input [WIDTH-1:0] d0,
  input [WIDTH-1:0] d1,
  input [WIDTH-1:0] d2,
  input [WIDTH-1:0] d3,
  input [WIDTH-1:0] d4,
  input [WIDTH-1:0] d5,
  input [WIDTH-1:0] d6,
  input [WIDTH-1:0] d7,
  output [WIDTH-1:0] y
  );
  reg[WIDTH-1:0] r;
  always@(*)
  begin
    case(s)
      3'b000: r=d0;
      3'b001: r=d1;
      3'b010: r=d2;
      3'b011: r=d3;
      3'b100: r=d4;
      3'b101: r=d5;
      3'b110: r=d6;
      3'b111: r=d7;
    endcase
  end
  assign y=r;
  
endmodule     


 module mux16#(parameter WIDTH=8)(
  input [2:0]s,
  input [WIDTH-1:0] d0,
  input [WIDTH-1:0] d1,
  input [WIDTH-1:0] d2,
  input [WIDTH-1:0] d3,
  input [WIDTH-1:0] d4,
  input [WIDTH-1:0] d5,
  input [WIDTH-1:0] d6,
  input [WIDTH-1:0] d7,
  input [WIDTH-1:0] d8,
  input [WIDTH-1:0] d9,
  input [WIDTH-1:0] d10,
  input [WIDTH-1:0] d11,
  input [WIDTH-1:0] d12,
  input [WIDTH-1:0] d13,
  input [WIDTH-1:0] d14,
  input [WIDTH-1:0] d15,
  output [WIDTH-1:0] y
  );
  reg[WIDTH-1:0] r;
  always@(*)
  begin
    case(s)
      4'b0000: r=d0;
      4'b0001: r=d1;
      4'b0010: r=d2;
      4'b0011: r=d3;
      4'b0100: r=d4;
      4'b0101: r=d5;
      4'b0110: r=d6;
      4'b0111: r=d7;
      4'b1000: r=d8;
      4'b1001: r=d9;
      4'b1010: r=d10;
      4'b1011: r=d11;
      4'b1100: r=d12;
      4'b1101: r=d13;
      4'b1110: r=d14;
      4'b1111: r=d15;
      
    endcase
  end
  assign y=r;
  
endmodule     



