
module flopr#(parameter WIDTH = 8)(
  input clk,
  input[WIDTH-1:0] d,
  input rst_n,
  output[WIDTH-1:0]  q
  );
  reg[WIDTH-1:0] r;
  initial begin
    r=0;
  end
  always @(d) 
  begin 
      r = d; 
  end
assign q=r;
endmodule
