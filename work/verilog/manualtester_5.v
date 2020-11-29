/*
   This file was generated automatically by Alchitry Labs version 1.2.1.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module manualtester_5 (
    input clk,
    input rst,
    input [4:0] button,
    input [23:0] io_dip,
    output reg [19:0] seg,
    output reg [23:0] io_led
  );
  
  
  
  reg [15:0] M_a_mem_d, M_a_mem_q = 1'h0;
  reg [15:0] M_b_mem_d, M_b_mem_q = 1'h0;
  localparam S0_input_controller = 2'd0;
  localparam S1_input_controller = 2'd1;
  localparam S2_input_controller = 2'd2;
  
  reg [1:0] M_input_controller_d, M_input_controller_q = S0_input_controller;
  
  wire [16-1:0] M_alu_out;
  wire [3-1:0] M_alu_zvn;
  wire [20-1:0] M_alu_seg;
  reg [16-1:0] M_alu_a;
  reg [16-1:0] M_alu_b;
  reg [6-1:0] M_alu_alufn;
  alu_9 alu (
    .a(M_alu_a),
    .b(M_alu_b),
    .alufn(M_alu_alufn),
    .out(M_alu_out),
    .zvn(M_alu_zvn),
    .seg(M_alu_seg)
  );
  
  always @* begin
    M_input_controller_d = M_input_controller_q;
    M_a_mem_d = M_a_mem_q;
    M_b_mem_d = M_b_mem_q;
    
    M_alu_a = 1'h0;
    M_alu_b = 1'h0;
    M_alu_alufn = io_dip[16+0+5-:6];
    io_led = 24'h000000;
    seg = 20'h84210;
    
    case (M_input_controller_q)
      S0_input_controller: begin
        seg = 20'h04210;
        io_led[16+7+0-:1] = 8'h01;
        io_led[16+6+0-:1] = 8'h00;
        M_a_mem_d[8+7-:8] = io_dip[8+7-:8];
        M_a_mem_d[0+7-:8] = io_dip[0+7-:8];
        io_led[8+7-:8] = io_dip[8+7-:8];
        io_led[0+7-:8] = io_dip[0+7-:8];
        if (button[4+0-:1]) begin
          M_input_controller_d = S1_input_controller;
        end else begin
          if (button[3+0-:1]) begin
            M_input_controller_d = S2_input_controller;
          end
        end
      end
      S1_input_controller: begin
        seg = 20'h0c210;
        io_led[16+7+0-:1] = 8'h00;
        io_led[16+6+0-:1] = 8'h01;
        M_b_mem_d[8+7-:8] = io_dip[8+7-:8];
        M_b_mem_d[0+7-:8] = io_dip[0+7-:8];
        io_led[8+7-:8] = io_dip[8+7-:8];
        io_led[0+7-:8] = io_dip[0+7-:8];
        if (button[4+0-:1]) begin
          M_input_controller_d = S2_input_controller;
        end else begin
          if (button[3+0-:1]) begin
            M_input_controller_d = S0_input_controller;
          end
        end
      end
      S2_input_controller: begin
        io_led[16+7+0-:1] = 8'h01;
        io_led[16+6+0-:1] = 8'h01;
        M_alu_a = M_a_mem_q;
        M_alu_b = M_b_mem_q;
        io_led[8+7-:8] = M_alu_out[8+7-:8];
        io_led[0+7-:8] = M_alu_out[0+7-:8];
        seg = M_alu_seg;
        if (button[4+0-:1]) begin
          M_input_controller_d = S0_input_controller;
        end else begin
          if (button[3+0-:1]) begin
            M_input_controller_d = S1_input_controller;
          end
        end
      end
    endcase
  end
  
  always @(posedge clk) begin
    M_a_mem_q <= M_a_mem_d;
    M_b_mem_q <= M_b_mem_d;
    
    if (rst == 1'b1) begin
      M_input_controller_q <= 1'h0;
    end else begin
      M_input_controller_q <= M_input_controller_d;
    end
  end
  
endmodule
