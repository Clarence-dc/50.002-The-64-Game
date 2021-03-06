/*
   This file was generated automatically by Alchitry Labs version 1.2.1.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module add_sub16bit_20 (
    input [15:0] a,
    input [15:0] b,
    input [5:0] alufn,
    output reg [15:0] s,
    output reg z,
    output reg v,
    output reg n
  );
  
  
  
  wire [(5'h10+0)-1:0] M_adder_s;
  wire [(5'h10+0)-1:0] M_adder_cout;
  reg [(5'h10+0)-1:0] M_adder_x;
  reg [(5'h10+0)-1:0] M_adder_y;
  reg [(5'h10+0)-1:0] M_adder_cin;
  
  genvar GEN_adder0;
  generate
  for (GEN_adder0=0;GEN_adder0<5'h10;GEN_adder0=GEN_adder0+1) begin: adder_gen_0
    adder1b_24 adder (
      .x(M_adder_x[GEN_adder0*(1)+(1)-1-:(1)]),
      .y(M_adder_y[GEN_adder0*(1)+(1)-1-:(1)]),
      .cin(M_adder_cin[GEN_adder0*(1)+(1)-1-:(1)]),
      .s(M_adder_s[GEN_adder0*(1)+(1)-1-:(1)]),
      .cout(M_adder_cout[GEN_adder0*(1)+(1)-1-:(1)])
    );
  end
  endgenerate
  
  always @* begin
    M_adder_x = a;
    M_adder_y = 16'h0000;
    M_adder_cin = 16'h0000;
    z = 1'h0;
    v = 1'h0;
    n = 1'h0;
    
    case (alufn[1+0-:1])
      1'h0: begin
        M_adder_y = {5'h10{alufn[0+0-:1]}} ^ b;
        M_adder_cin[1+14-:15] = M_adder_cout[0+14-:15];
        M_adder_cin[0+0-:1] = alufn[0+0-:1];
        z = (~|M_adder_s);
        v = (a[15+0-:1] & ({5'h10{alufn[0+0-:1]}} ^ b) & ~M_adder_s[15+0-:1]) | (~a[15+0-:1] & ~({5'h10{alufn[0+0-:1]}} ^ b) & M_adder_s[15+0-:1]);
        n = M_adder_s[15+0-:1];
        s = M_adder_s;
      end
      1'h1: begin
        if (alufn[0+0-:1] == 1'h0) begin
          s = a * b;
        end else begin
          s = a / b;
        end
        z = 1'h0;
        v = 1'h0;
        n = 1'h0;
      end
    endcase
  end
endmodule
