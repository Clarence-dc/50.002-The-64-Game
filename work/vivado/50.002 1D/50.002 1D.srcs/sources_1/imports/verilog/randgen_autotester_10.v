/*
   This file was generated automatically by Alchitry Labs version 1.2.1.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module randgen_autotester_10 (
    input clk,
    input rst,
    input [4:0] button,
    output reg [19:0] seg
  );
  
  
  
  
  wire [5-1:0] M_rand_gen_randint;
  reg [4-1:0] M_rand_gen_num;
  rand_gen_22 rand_gen (
    .clk(clk),
    .rst(button[1+0-:1]),
    .num(M_rand_gen_num),
    .randint(M_rand_gen_randint)
  );
  
  
  localparam FULL_state = 2'd0;
  localparam EMPTY_state = 2'd1;
  localparam THREE_state = 2'd2;
  
  reg [1:0] M_state_d, M_state_q = FULL_state;
  
  reg [4:0] i;
  reg [4:0] j;
  reg [4:0] s;
  
  always @* begin
    M_state_d = M_state_q;
    
    seg = 20'h84210;
    s = 5'h10;
    i = 5'h10;
    j = 5'h10;
    M_rand_gen_num = 1'h0;
    
    case (M_state_q)
      FULL_state: begin
        M_rand_gen_num = 1'h0;
        s = 5'h11;
        if (button[4+0-:1]) begin
          M_state_d = EMPTY_state;
        end else begin
          if (button[3+0-:1]) begin
            M_state_d = THREE_state;
          end
        end
      end
      EMPTY_state: begin
        M_rand_gen_num = 4'h9;
        s = 5'h0e;
        if (button[4+0-:1]) begin
          M_state_d = THREE_state;
        end else begin
          if (button[3+0-:1]) begin
            M_state_d = FULL_state;
          end
        end
      end
      THREE_state: begin
        M_rand_gen_num = 2'h3;
        s = 5'h17;
        if (button[4+0-:1]) begin
          M_state_d = FULL_state;
        end else begin
          if (button[3+0-:1]) begin
            M_state_d = EMPTY_state;
          end
        end
      end
    endcase
    if (M_rand_gen_randint >= 5'h10) begin
      j = M_rand_gen_randint[0+3-:4] + 5'h15;
      seg = {s, 5'h10, 5'h10, j};
    end
  end
  
  always @(posedge clk) begin
    M_state_q <= M_state_d;
  end
  
endmodule
