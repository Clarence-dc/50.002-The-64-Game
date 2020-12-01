/*
   This file was generated automatically by Alchitry Labs version 1.2.1.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module controlunit_21 (
    input clk,
    input [4:0] button,
    output reg [143:0] arr,
    output reg [19:0] io_seg
  );
  
  
  
  reg [19:0] M_segment_d, M_segment_q = 20'h84210;
  wire [512-1:0] M_reg_out;
  reg [1-1:0] M_reg_rst;
  reg [5-1:0] M_reg_write_address_1;
  reg [16-1:0] M_reg_write_data_1;
  reg [1-1:0] M_reg_write_enable_1;
  reg [5-1:0] M_reg_write_address_2;
  reg [16-1:0] M_reg_write_data_2;
  reg [1-1:0] M_reg_write_enable_2;
  reg [5-1:0] M_reg_write_address_3;
  reg [16-1:0] M_reg_write_data_3;
  reg [1-1:0] M_reg_write_enable_3;
  reg [5-1:0] M_reg_write_address_4;
  reg [16-1:0] M_reg_write_data_4;
  reg [1-1:0] M_reg_write_enable_4;
  regfile_27 L_reg (
    .clk(clk),
    .rst(M_reg_rst),
    .write_address_1(M_reg_write_address_1),
    .write_data_1(M_reg_write_data_1),
    .write_enable_1(M_reg_write_enable_1),
    .write_address_2(M_reg_write_address_2),
    .write_data_2(M_reg_write_data_2),
    .write_enable_2(M_reg_write_enable_2),
    .write_address_3(M_reg_write_address_3),
    .write_data_3(M_reg_write_data_3),
    .write_enable_3(M_reg_write_enable_3),
    .write_address_4(M_reg_write_address_4),
    .write_data_4(M_reg_write_data_4),
    .write_enable_4(M_reg_write_enable_4),
    .out(M_reg_out)
  );
  localparam START_game_controller = 5'd0;
  localparam WIPE_game_controller = 5'd1;
  localparam IDLE_game_controller = 5'd2;
  localparam ERROR_game_controller = 5'd3;
  localparam SET_RXYZ_game_controller = 5'd4;
  localparam CHECK1_2_game_controller = 5'd5;
  localparam CHECK2_3_game_controller = 5'd6;
  localparam CHECK1_3_game_controller = 5'd7;
  localparam CHECK2_game_controller = 5'd8;
  localparam MERGE_ADD_CLEAR_game_controller = 5'd9;
  localparam ALIGN1_2_game_controller = 5'd10;
  localparam ALIGN2_3_game_controller = 5'd11;
  localparam ALIGN1_3_game_controller = 5'd12;
  localparam CHECK_WIN_game_controller = 5'd13;
  localparam MAKE_LIST_game_controller = 5'd14;
  localparam ADD_NUM_game_controller = 5'd15;
  localparam CHECK_LOSE_game_controller = 5'd16;
  localparam LOSE_game_controller = 5'd17;
  localparam WIN_game_controller = 5'd18;
  localparam GAMEOVER_game_controller = 5'd19;
  
  reg [4:0] M_game_controller_d, M_game_controller_q = START_game_controller;
  wire [5-1:0] M_rand_gen_randint;
  reg [1-1:0] M_rand_gen_rst;
  reg [4-1:0] M_rand_gen_num;
  rand_gen_22 rand_gen (
    .clk(clk),
    .rst(M_rand_gen_rst),
    .num(M_rand_gen_num),
    .randint(M_rand_gen_randint)
  );
  
  reg [15:0] temp;
  
  wire [16-1:0] M_alu_out;
  wire [3-1:0] M_alu_zvn;
  wire [20-1:0] M_alu_seg;
  reg [16-1:0] M_alu_a;
  reg [16-1:0] M_alu_b;
  reg [6-1:0] M_alu_alufn;
  alu_12 alu (
    .a(M_alu_a),
    .b(M_alu_b),
    .alufn(M_alu_alufn),
    .out(M_alu_out),
    .zvn(M_alu_zvn),
    .seg(M_alu_seg)
  );
  
  always @* begin
    M_game_controller_d = M_game_controller_q;
    M_segment_d = M_segment_q;
    
    M_rand_gen_num = 1'h0;
    M_rand_gen_rst = 1'h0;
    arr = M_reg_out[16+143-:144];
    io_seg = M_segment_q;
    M_reg_write_address_1 = 1'h0;
    M_reg_write_data_1 = 1'h0;
    M_reg_write_enable_1 = 1'h0;
    M_reg_write_address_2 = 1'h0;
    M_reg_write_data_2 = 1'h0;
    M_reg_write_enable_2 = 1'h0;
    M_reg_write_address_3 = 1'h0;
    M_reg_write_data_3 = 1'h0;
    M_reg_write_enable_3 = 1'h0;
    M_reg_write_address_4 = 1'h0;
    M_reg_write_data_4 = 1'h0;
    M_reg_write_enable_4 = 1'h0;
    M_reg_rst = 1'h0;
    M_alu_a = 1'h0;
    M_alu_b = 1'h0;
    M_alu_alufn = 6'h3f;
    
    case (M_game_controller_q)
      START_game_controller: begin
        M_segment_d = 20'h21084;
        if ((^button)) begin
          M_game_controller_d = MAKE_LIST_game_controller;
        end
      end
      WIPE_game_controller: begin
        M_reg_rst = 1'h1;
        M_game_controller_d = START_game_controller;
      end
      IDLE_game_controller: begin
        if ((^button)) begin
          M_reg_write_address_1 = 5'h0b;
          M_reg_write_enable_1 = 1'h1;
          if (button[0+0-:1]) begin
            M_segment_d = 20'h94210;
            M_reg_write_data_1 = 16'h0006;
          end else begin
            if (button[2+0-:1]) begin
              M_segment_d = 20'h34210;
              M_reg_write_data_1 = 16'h0007;
            end else begin
              if (button[3+0-:1]) begin
                M_segment_d = 20'h4c210;
                M_reg_write_data_1 = 16'h0004;
              end else begin
                if (button[4+0-:1]) begin
                  M_segment_d = 20'h5c210;
                  M_reg_write_data_1 = 16'h0005;
                end
              end
            end
          end
          M_game_controller_d = SET_RXYZ_game_controller;
        end
      end
      SET_RXYZ_game_controller: begin
        M_reg_write_address_1 = 5'h0e;
        M_reg_write_enable_1 = 1'h1;
        M_reg_write_address_2 = 5'h0f;
        M_reg_write_enable_2 = 1'h1;
        M_reg_write_address_3 = 5'h10;
        M_reg_write_enable_3 = 1'h1;
        
        case (M_reg_out[208+15-:16])
          16'h0000: begin
            
            case (M_reg_out[176+15-:16])
              16'h0006: begin
                M_reg_write_data_1 = 16'h0001;
                M_reg_write_data_2 = 16'h0004;
                M_reg_write_data_3 = 16'h0007;
              end
              16'h0007: begin
                M_reg_write_data_1 = 16'h0007;
                M_reg_write_data_2 = 16'h0004;
                M_reg_write_data_3 = 16'h0001;
              end
              16'h0004: begin
                M_reg_write_data_1 = 16'h0001;
                M_reg_write_data_2 = 16'h0002;
                M_reg_write_data_3 = 16'h0003;
              end
              16'h0005: begin
                M_reg_write_data_1 = 16'h0003;
                M_reg_write_data_2 = 16'h0002;
                M_reg_write_data_3 = 16'h0001;
              end
            endcase
          end
          16'h0001: begin
            
            case (M_reg_out[176+15-:16])
              16'h0006: begin
                M_reg_write_data_1 = 16'h0002;
                M_reg_write_data_2 = 16'h0005;
                M_reg_write_data_3 = 16'h0008;
              end
              16'h0007: begin
                M_reg_write_data_1 = 16'h0008;
                M_reg_write_data_2 = 16'h0005;
                M_reg_write_data_3 = 16'h0002;
              end
              16'h0004: begin
                M_reg_write_data_1 = 16'h0004;
                M_reg_write_data_2 = 16'h0005;
                M_reg_write_data_3 = 16'h0006;
              end
              16'h0005: begin
                M_reg_write_data_1 = 16'h0006;
                M_reg_write_data_2 = 16'h0005;
                M_reg_write_data_3 = 16'h0004;
              end
            endcase
          end
          16'h0002: begin
            
            case (M_reg_out[176+15-:16])
              16'h0006: begin
                M_reg_write_data_1 = 16'h0003;
                M_reg_write_data_2 = 16'h0006;
                M_reg_write_data_3 = 16'h0009;
              end
              16'h0007: begin
                M_reg_write_data_1 = 16'h0009;
                M_reg_write_data_2 = 16'h0006;
                M_reg_write_data_3 = 16'h0003;
              end
              16'h0004: begin
                M_reg_write_data_1 = 16'h0007;
                M_reg_write_data_2 = 16'h0008;
                M_reg_write_data_3 = 16'h0009;
              end
              16'h0005: begin
                M_reg_write_data_1 = 16'h0009;
                M_reg_write_data_2 = 16'h0008;
                M_reg_write_data_3 = 16'h0007;
              end
              16'h0003: begin
                M_reg_write_data_1 = 16'h0000;
                M_reg_write_data_2 = 16'h0000;
                M_reg_write_data_3 = 16'h0000;
              end
            endcase
          end
        endcase
        M_alu_a = M_reg_out[208+15-:16];
        M_alu_b = 16'h0002;
        M_alu_alufn = 6'h3d;
        
        case (M_alu_out)
          1'h0: begin
            M_reg_write_address_4 = 5'h13;
            M_reg_write_enable_4 = 1'h1;
            M_reg_write_data_4 = 1'h1;
            M_game_controller_d = CHECK_WIN_game_controller;
          end
          1'h1: begin
            M_reg_write_address_4 = 5'h0d;
            M_reg_write_enable_4 = 1'h1;
            M_reg_write_data_4 = M_reg_out[208+15-:16] + 1'h1;
            M_game_controller_d = CHECK1_2_game_controller;
          end
        endcase
      end
      CHECK1_2_game_controller: begin
        M_alu_a = M_reg_out[(M_reg_out[224+15-:16])*16+15-:16];
        M_alu_b = M_reg_out[(M_reg_out[240+15-:16])*16+15-:16];
        M_alu_alufn = 6'h35;
        M_reg_write_address_1 = 5'h11;
        M_reg_write_address_2 = 5'h12;
        
        case (M_alu_out[0+0-:1])
          1'h0: begin
            M_game_controller_d = CHECK2_3_game_controller;
          end
          1'h1: begin
            M_reg_write_enable_1 = 1'h1;
            M_reg_write_enable_2 = 1'h1;
            M_reg_write_data_1 = M_reg_out[224+15-:16];
            M_reg_write_data_2 = M_reg_out[240+15-:16];
            M_game_controller_d = MERGE_ADD_CLEAR_game_controller;
          end
        endcase
      end
      CHECK2_3_game_controller: begin
        M_alu_a = M_reg_out[(M_reg_out[240+15-:16])*16+15-:16];
        M_alu_b = M_reg_out[(M_reg_out[256+15-:16])*16+15-:16];
        M_alu_alufn = 6'h35;
        M_reg_write_address_1 = 5'h11;
        M_reg_write_address_2 = 5'h12;
        
        case (M_alu_out[0+0-:1])
          1'h0: begin
            M_game_controller_d = CHECK1_3_game_controller;
          end
          1'h1: begin
            M_reg_write_enable_1 = 1'h1;
            M_reg_write_enable_2 = 1'h1;
            M_reg_write_data_1 = M_reg_out[240+15-:16];
            M_reg_write_data_2 = M_reg_out[256+15-:16];
            M_game_controller_d = MERGE_ADD_CLEAR_game_controller;
          end
        endcase
      end
      CHECK1_3_game_controller: begin
        M_alu_a = M_reg_out[(M_reg_out[224+15-:16])*16+15-:16];
        M_alu_b = M_reg_out[(M_reg_out[256+15-:16])*16+15-:16];
        M_alu_alufn = 6'h35;
        
        case (M_alu_out[0+0-:1])
          1'h0: begin
            M_game_controller_d = ALIGN1_2_game_controller;
          end
          1'h1: begin
            M_game_controller_d = CHECK2_game_controller;
          end
        endcase
      end
      CHECK2_game_controller: begin
        M_alu_a = M_reg_out[(M_reg_out[240+15-:16])*16+15-:16];
        M_alu_b = M_reg_out[0+15-:16];
        M_alu_alufn = 6'h35;
        M_reg_write_address_1 = 5'h11;
        M_reg_write_address_2 = 5'h12;
        
        case (M_alu_out[0+0-:1])
          1'h0: begin
            M_game_controller_d = ALIGN1_2_game_controller;
          end
          1'h1: begin
            M_reg_write_enable_1 = 1'h1;
            M_reg_write_enable_2 = 1'h1;
            M_reg_write_data_1 = M_reg_out[224+15-:16];
            M_reg_write_data_2 = M_reg_out[256+15-:16];
            M_game_controller_d = MERGE_ADD_CLEAR_game_controller;
          end
        endcase
      end
      MERGE_ADD_CLEAR_game_controller: begin
        M_alu_a = M_reg_out[(M_reg_out[272+15-:16])*16+15-:16];
        M_alu_b = M_reg_out[(M_reg_out[288+15-:16])*16+15-:16];
        M_alu_alufn = 6'h00;
        M_reg_write_address_1 = M_reg_out[272+0+4-:5];
        M_reg_write_data_1 = M_alu_out;
        M_reg_write_enable_1 = 1'h1;
        M_reg_write_address_2 = M_reg_out[288+0+4-:5];
        M_reg_write_data_2 = M_reg_out[0+15-:16];
        M_reg_write_enable_2 = 1'h1;
        M_reg_write_address_3 = 5'h11;
        M_reg_write_data_3 = M_reg_out[0+15-:16];
        M_reg_write_enable_3 = 1'h1;
        M_reg_write_address_4 = 5'h12;
        M_reg_write_data_4 = M_reg_out[0+15-:16];
        M_reg_write_enable_4 = 1'h1;
        M_game_controller_d = ALIGN1_2_game_controller;
      end
      ALIGN1_2_game_controller: begin
        if (M_reg_out[(M_reg_out[224+15-:16])*16+15-:16] == 1'h0 && M_reg_out[(M_reg_out[240+15-:16])*16+15-:16] != 1'h0) begin
          M_reg_write_address_1 = M_reg_out[224+0+4-:5];
          M_reg_write_data_1 = M_reg_out[(M_reg_out[240+15-:16])*16+15-:16];
          M_reg_write_enable_1 = 1'h1;
          M_reg_write_address_2 = M_reg_out[240+0+4-:5];
          M_reg_write_data_2 = M_reg_out[0+15-:16];
          M_reg_write_enable_2 = 1'h1;
        end
        M_game_controller_d = ALIGN2_3_game_controller;
      end
      ALIGN2_3_game_controller: begin
        if (M_reg_out[(M_reg_out[240+15-:16])*16+15-:16] == 1'h0 && M_reg_out[(M_reg_out[256+15-:16])*16+15-:16] != 1'h0) begin
          M_reg_write_address_1 = M_reg_out[240+0+4-:5];
          M_reg_write_data_1 = M_reg_out[(M_reg_out[256+15-:16])*16+15-:16];
          M_reg_write_enable_1 = 1'h1;
          M_reg_write_address_2 = M_reg_out[256+0+4-:5];
          M_reg_write_data_2 = M_reg_out[0+15-:16];
          M_reg_write_enable_2 = 1'h1;
        end
        M_game_controller_d = ALIGN1_3_game_controller;
      end
      ALIGN1_3_game_controller: begin
        if (M_reg_out[(M_reg_out[224+15-:16])*16+15-:16] == 1'h0 && M_reg_out[(M_reg_out[240+15-:16])*16+15-:16] != 1'h0) begin
          M_reg_write_address_1 = M_reg_out[224+0+4-:5];
          M_reg_write_data_1 = M_reg_out[(M_reg_out[240+15-:16])*16+15-:16];
          M_reg_write_enable_1 = 1'h1;
          M_reg_write_address_2 = M_reg_out[240+0+4-:5];
          M_reg_write_data_2 = M_reg_out[0+15-:16];
          M_reg_write_enable_2 = 1'h1;
        end
        M_game_controller_d = SET_RXYZ_game_controller;
      end
      CHECK_WIN_game_controller: begin
        M_alu_a = M_reg_out[(M_reg_out[304+15-:16])*16+15-:16];
        M_alu_b = 7'h40;
        M_alu_alufn = 6'h35;
        if (M_alu_out) begin
          M_game_controller_d = WIN_game_controller;
        end else begin
          if (M_reg_out[304+15-:16] >= 4'h9) begin
            M_reg_write_address_1 = 5'h13;
            M_reg_write_data_1 = 1'h1;
            M_reg_write_enable_1 = 1'h1;
            M_reg_write_address_2 = 5'h14;
            M_reg_write_data_2 = M_reg_out[0+15-:16];
            M_reg_write_enable_2 = 1'h1;
            M_game_controller_d = MAKE_LIST_game_controller;
          end else begin
            M_reg_write_address_1 = 5'h13;
            M_reg_write_data_1 = M_reg_out[304+15-:16] + 1'h1;
            M_reg_write_enable_1 = 1'h1;
          end
        end
      end
      MAKE_LIST_game_controller: begin
        M_alu_a = M_reg_out[(M_reg_out[304+15-:16])*16+15-:16];
        M_alu_b = M_reg_out[0+15-:16];
        M_alu_alufn = 6'h35;
        M_reg_write_address_1 = 5'h14;
        M_reg_write_enable_1 = 1'h1;
        if (M_alu_out) begin
          
        end else begin
          temp = M_reg_out[320+15-:16] + 1'h1;
          M_reg_write_data_1 = temp;
          M_reg_write_address_3 = temp[0+4-:5] + 5'h14;
          M_reg_write_data_3 = M_reg_out[304+15-:16];
          M_reg_write_enable_3 = 1'h1;
        end
        M_reg_write_address_2 = 5'h13;
        M_reg_write_enable_2 = 1'h1;
        if (M_reg_out[304+15-:16] >= 4'h9) begin
          M_reg_write_data_2 = 1'h1;
          M_game_controller_d = ADD_NUM_game_controller;
        end else begin
          M_reg_write_data_2 = M_reg_out[304+15-:16] + 1'h1;
        end
      end
      ADD_NUM_game_controller: begin
        M_alu_a = M_reg_out[320+15-:16];
        M_alu_b = M_reg_out[0+15-:16];
        M_alu_alufn = 6'h35;
        
        case (M_alu_out)
          1'h1: begin
            M_game_controller_d = CHECK_LOSE_game_controller;
          end
          1'h0: begin
            M_rand_gen_num = M_reg_out[320+0+3-:4];
            M_rand_gen_rst = 1'h1;
            if (M_rand_gen_randint >= 5'h10) begin
              M_reg_write_address_1 = M_reg_out[(M_rand_gen_randint[0+3-:4] + 5'h15)*16+0+4-:5];
              M_reg_write_data_1 = 2'h2;
              M_reg_write_enable_1 = 1'h1;
              M_reg_write_address_2 = 5'h14;
              M_reg_write_data_2 = M_reg_out[320+15-:16] - 1'h1;
              M_reg_write_enable_2 = 1'h1;
              M_game_controller_d = CHECK_LOSE_game_controller;
            end
          end
        endcase
      end
      CHECK_LOSE_game_controller: begin
        M_alu_a = M_reg_out[320+15-:16];
        M_alu_b = M_reg_out[0+15-:16];
        M_alu_alufn = 6'h35;
        
        case (M_alu_out)
          1'h0: begin
            M_game_controller_d = IDLE_game_controller;
          end
          1'h1: begin
            if (M_reg_out[16+15-:16] == M_reg_out[64+15-:16] || M_reg_out[16+15-:16] == M_reg_out[64+15-:16] || M_reg_out[32+15-:16] == M_reg_out[48+15-:16] || M_reg_out[32+15-:16] == M_reg_out[80+15-:16] || M_reg_out[64+15-:16] == M_reg_out[80+15-:16] || M_reg_out[64+15-:16] == M_reg_out[112+15-:16] || M_reg_out[80+15-:16] == M_reg_out[96+15-:16] || M_reg_out[80+15-:16] == M_reg_out[128+15-:16] || M_reg_out[48+15-:16] == M_reg_out[96+15-:16] || M_reg_out[96+15-:16] == M_reg_out[144+15-:16] || M_reg_out[112+15-:16] == M_reg_out[128+15-:16] || M_reg_out[128+15-:16] == M_reg_out[144+15-:16]) begin
              M_game_controller_d = IDLE_game_controller;
            end else begin
              M_game_controller_d = LOSE_game_controller;
            end
          end
        endcase
      end
      WIN_game_controller: begin
        M_segment_d = 20'he8846;
        if ((^button)) begin
          M_game_controller_d = WIPE_game_controller;
        end
      end
      LOSE_game_controller: begin
        M_segment_d = 20'h4888e;
        if ((^button)) begin
          M_game_controller_d = WIPE_game_controller;
        end
      end
    endcase
    if (button[1+0-:1]) begin
      if (M_game_controller_q != IDLE_game_controller && (^button)) begin
        M_game_controller_d = WIPE_game_controller;
      end
    end
  end
  
  always @(posedge clk) begin
    M_segment_q <= M_segment_d;
    M_game_controller_q <= M_game_controller_d;
  end
  
endmodule
