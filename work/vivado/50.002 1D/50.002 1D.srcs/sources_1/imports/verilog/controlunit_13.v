/*
   This file was generated automatically by Alchitry Labs version 1.2.1.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module controlunit_13 (
    input clk,
    input [4:0] button,
    output reg [143:0] arr,
    output reg [19:0] io_seg
  );
  
  
  
  reg [19:0] M_segment_d, M_segment_q = 20'h84210;
  wire [768-1:0] M_reg_out;
  reg [1-1:0] M_reg_rst;
  reg [6-1:0] M_reg_write_address_1;
  reg [16-1:0] M_reg_write_data_1;
  reg [1-1:0] M_reg_write_enable_1;
  reg [6-1:0] M_reg_write_address_2;
  reg [16-1:0] M_reg_write_data_2;
  reg [1-1:0] M_reg_write_enable_2;
  reg [6-1:0] M_reg_write_address_3;
  reg [16-1:0] M_reg_write_data_3;
  reg [1-1:0] M_reg_write_enable_3;
  reg [6-1:0] M_reg_write_address_4;
  reg [16-1:0] M_reg_write_data_4;
  reg [1-1:0] M_reg_write_enable_4;
  regfile_16 L_reg (
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
  localparam SAVE1_game_controller = 5'd3;
  localparam SAVE2_game_controller = 5'd4;
  localparam SAVE3_game_controller = 5'd5;
  localparam SET_RXYZ_game_controller = 5'd6;
  localparam CHECK1_2_game_controller = 5'd7;
  localparam CHECK2_3_game_controller = 5'd8;
  localparam CHECK1_3_game_controller = 5'd9;
  localparam CHECK2_game_controller = 5'd10;
  localparam MERGE_ADD_CLEAR_game_controller = 5'd11;
  localparam ALIGN1_2_game_controller = 5'd12;
  localparam ALIGN2_3_game_controller = 5'd13;
  localparam ALIGN1_3_game_controller = 5'd14;
  localparam CHECK_WIN_game_controller = 5'd15;
  localparam MAKE_LIST_game_controller = 5'd16;
  localparam ADD_NUM_game_controller = 5'd17;
  localparam BITMASK_game_controller = 5'd18;
  localparam MULTIPLY_game_controller = 5'd19;
  localparam EXTRACT_game_controller = 5'd20;
  localparam CHECK_LOSE_game_controller = 5'd21;
  localparam LOSE_game_controller = 5'd22;
  localparam WIN_game_controller = 5'd23;
  localparam GAMEOVER_game_controller = 5'd24;
  localparam RESTORE1_game_controller = 5'd25;
  localparam RESTORE2_game_controller = 5'd26;
  localparam RESTORE3_game_controller = 5'd27;
  
  reg [4:0] M_game_controller_d, M_game_controller_q = START_game_controller;
  wire [32-1:0] M_rand_gen_num;
  reg [1-1:0] M_rand_gen_rst;
  reg [1-1:0] M_rand_gen_next;
  reg [32-1:0] M_rand_gen_seed;
  pn_gen_17 rand_gen (
    .clk(clk),
    .rst(M_rand_gen_rst),
    .next(M_rand_gen_next),
    .seed(M_rand_gen_seed),
    .num(M_rand_gen_num)
  );
  wire [32-1:0] M_randseed_value;
  counter_18 randseed (
    .clk(clk),
    .rst(1'h0),
    .value(M_randseed_value)
  );
  
  reg [15:0] temp;
  reg [4:0] i0;
  reg [4:0] i1;
  
  wire [16-1:0] M_alu_out;
  wire [3-1:0] M_alu_zvn;
  wire [20-1:0] M_alu_seg;
  reg [16-1:0] M_alu_a;
  reg [16-1:0] M_alu_b;
  reg [6-1:0] M_alu_alufn;
  alu_19 alu (
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
    
    M_rand_gen_next = 1'h0;
    M_rand_gen_seed = M_randseed_value;
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
        M_segment_d = 20'h21210;
        if ((^button)) begin
          M_rand_gen_rst = 1'h1;
          M_reg_write_address_1 = 5'h13;
          M_reg_write_data_1 = 1'h1;
          M_reg_write_enable_1 = 1'h1;
          M_game_controller_d = SAVE1_game_controller;
        end
      end
      WIPE_game_controller: begin
        M_rand_gen_rst = 1'h1;
        M_reg_rst = 1'h1;
        M_game_controller_d = START_game_controller;
      end
      SAVE1_game_controller: begin
        M_segment_d = 20'h25610;
        M_reg_write_address_1 = 6'h1f;
        M_reg_write_enable_1 = 1'h1;
        M_reg_write_address_2 = 6'h20;
        M_reg_write_enable_2 = 1'h1;
        M_reg_write_address_3 = 6'h21;
        M_reg_write_enable_3 = 1'h1;
        M_reg_write_data_1 = M_reg_out[16+15-:16];
        M_reg_write_data_2 = M_reg_out[32+15-:16];
        M_reg_write_data_3 = M_reg_out[48+15-:16];
        M_game_controller_d = SAVE2_game_controller;
      end
      SAVE2_game_controller: begin
        M_segment_d = 20'h25a10;
        M_reg_write_address_1 = 6'h22;
        M_reg_write_enable_1 = 1'h1;
        M_reg_write_address_2 = 6'h23;
        M_reg_write_enable_2 = 1'h1;
        M_reg_write_address_3 = 6'h24;
        M_reg_write_enable_3 = 1'h1;
        M_reg_write_data_1 = M_reg_out[64+15-:16];
        M_reg_write_data_2 = M_reg_out[80+15-:16];
        M_reg_write_data_3 = M_reg_out[96+15-:16];
        M_game_controller_d = SAVE3_game_controller;
      end
      SAVE3_game_controller: begin
        M_segment_d = 20'h25e10;
        M_reg_write_address_1 = 6'h25;
        M_reg_write_enable_1 = 1'h1;
        M_reg_write_address_2 = 6'h26;
        M_reg_write_enable_2 = 1'h1;
        M_reg_write_address_3 = 6'h27;
        M_reg_write_enable_3 = 1'h1;
        M_reg_write_data_1 = M_reg_out[112+15-:16];
        M_reg_write_data_2 = M_reg_out[128+15-:16];
        M_reg_write_data_3 = M_reg_out[144+15-:16];
        if (M_reg_out[176+15-:16] == 1'h0) begin
          M_game_controller_d = CHECK_WIN_game_controller;
        end else begin
          M_game_controller_d = SET_RXYZ_game_controller;
        end
      end
      IDLE_game_controller: begin
        i1 = M_reg_out[640+15-:16] / 4'ha;
        i0 = M_reg_out[640+15-:16] - i1 * 4'ha + 5'h14;
        i1 = i1 + 5'h14;
        M_segment_d = {5'h0d, 5'h10, i1, i0};
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
          M_reg_write_address_2 = 5'h0d;
          M_reg_write_enable_2 = 1'h1;
          M_reg_write_data_2 = M_reg_out[0+15-:16];
          M_reg_write_address_3 = 6'h28;
          M_reg_write_data_3 = M_reg_out[640+15-:16] + 1'h1;
          M_reg_write_enable_3 = 1'h1;
          M_game_controller_d = SAVE1_game_controller;
          if (button[1+0-:1]) begin
            M_game_controller_d = WIPE_game_controller;
          end
        end
      end
      SET_RXYZ_game_controller: begin
        M_segment_d = 20'h22e10;
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
        M_segment_d = 20'h6d6d0;
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
        M_segment_d = 20'h6daf0;
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
        M_segment_d = 20'h6d6f0;
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
        M_segment_d = 20'h6da10;
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
        M_segment_d = 20'h1b610;
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
        M_segment_d = 20'h1d6d0;
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
        M_segment_d = 20'h1daf0;
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
        M_segment_d = 20'h1d6f0;
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
        M_segment_d = 20'h6f610;
        M_alu_a = M_reg_out[(M_reg_out[304+15-:16])*16+15-:16];
        M_alu_b = 7'h40;
        M_alu_alufn = 6'h35;
        M_reg_write_address_3 = 5'h0d;
        M_reg_write_data_3 = M_reg_out[0+15-:16];
        M_reg_write_enable_3 = 1'h1;
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
        M_segment_d = 20'h4d610;
        M_alu_a = M_reg_out[(M_reg_out[304+15-:16])*16+15-:16];
        M_alu_b = M_reg_out[0+15-:16];
        M_alu_alufn = 6'h35;
        M_reg_write_address_1 = 5'h14;
        if (M_alu_out) begin
          temp = M_reg_out[320+15-:16] + 1'h1;
          M_reg_write_data_1 = temp;
          M_reg_write_enable_1 = 1'h1;
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
        M_segment_d = 20'h018d5;
        M_alu_a = M_reg_out[320+15-:16];
        M_alu_b = M_reg_out[0+15-:16];
        M_alu_alufn = 6'h35;
        
        case (M_alu_out)
          1'h1: begin
            M_game_controller_d = CHECK_LOSE_game_controller;
          end
          1'h0: begin
            M_rand_gen_next = 1'h1;
            M_game_controller_d = BITMASK_game_controller;
          end
        endcase
      end
      BITMASK_game_controller: begin
        M_alu_a = M_rand_gen_num[0+15-:16];
        M_alu_b = 16'h0fff;
        M_alu_alufn = 6'h18;
        M_reg_write_data_1 = M_alu_out[0+15-:16];
        M_reg_write_address_1 = 5'h1e;
        M_reg_write_enable_1 = 1'h1;
        M_game_controller_d = MULTIPLY_game_controller;
      end
      MULTIPLY_game_controller: begin
        M_alu_a = M_reg_out[480+15-:16];
        M_alu_b = M_reg_out[320+15-:16];
        M_alu_alufn = 6'h02;
        M_reg_write_data_1 = M_alu_out[0+15-:16];
        M_reg_write_address_1 = 5'h1e;
        M_reg_write_enable_1 = 1'h1;
        M_game_controller_d = EXTRACT_game_controller;
      end
      EXTRACT_game_controller: begin
        M_alu_a = M_reg_out[480+15-:16];
        M_alu_b = 16'h000c;
        M_alu_alufn = 6'h21;
        
        case (M_alu_out[0+3-:4])
          1'h0: begin
            M_reg_write_address_1 = M_reg_out[336+0+4-:5];
          end
          1'h1: begin
            M_reg_write_address_1 = M_reg_out[352+0+4-:5];
          end
          2'h2: begin
            M_reg_write_address_1 = M_reg_out[368+0+4-:5];
          end
          2'h3: begin
            M_reg_write_address_1 = M_reg_out[384+0+4-:5];
          end
          3'h4: begin
            M_reg_write_address_1 = M_reg_out[400+0+4-:5];
          end
          3'h5: begin
            M_reg_write_address_1 = M_reg_out[416+0+4-:5];
          end
          3'h6: begin
            M_reg_write_address_1 = M_reg_out[432+0+4-:5];
          end
          3'h7: begin
            M_reg_write_address_1 = M_reg_out[448+0+4-:5];
          end
          4'h8: begin
            M_reg_write_address_1 = M_reg_out[464+0+4-:5];
          end
        endcase
        M_reg_write_data_1 = 1'h1;
        M_reg_write_enable_1 = 1'h1;
        M_reg_write_address_2 = 5'h14;
        M_reg_write_data_2 = M_reg_out[320+15-:16] - 1'h1;
        M_reg_write_enable_2 = 1'h1;
        M_game_controller_d = CHECK_LOSE_game_controller;
      end
      CHECK_LOSE_game_controller: begin
        M_segment_d = 20'h6a610;
        M_alu_a = M_reg_out[320+15-:16];
        M_alu_b = M_reg_out[0+15-:16];
        M_alu_alufn = 6'h35;
        
        case (M_alu_out)
          1'h0: begin
            M_game_controller_d = IDLE_game_controller;
          end
          1'h1: begin
            if (M_reg_out[16+15-:16] == M_reg_out[64+15-:16] || M_reg_out[16+15-:16] == M_reg_out[32+15-:16] || M_reg_out[32+15-:16] == M_reg_out[48+15-:16] || M_reg_out[32+15-:16] == M_reg_out[80+15-:16] || M_reg_out[64+15-:16] == M_reg_out[80+15-:16] || M_reg_out[64+15-:16] == M_reg_out[112+15-:16] || M_reg_out[80+15-:16] == M_reg_out[96+15-:16] || M_reg_out[80+15-:16] == M_reg_out[128+15-:16] || M_reg_out[48+15-:16] == M_reg_out[96+15-:16] || M_reg_out[96+15-:16] == M_reg_out[144+15-:16] || M_reg_out[112+15-:16] == M_reg_out[128+15-:16] || M_reg_out[128+15-:16] == M_reg_out[144+15-:16]) begin
              M_game_controller_d = IDLE_game_controller;
            end else begin
              M_game_controller_d = LOSE_game_controller;
            end
            if (M_reg_out[640+15-:16] == 7'h64) begin
              M_game_controller_d = LOSE_game_controller;
            end
          end
        endcase
      end
      WIN_game_controller: begin
        M_segment_d = 20'he8846;
        if (button[1+0-:1]) begin
          M_game_controller_d = WIPE_game_controller;
        end
      end
      LOSE_game_controller: begin
        M_segment_d = 20'h4888e;
        if (button[1+0-:1]) begin
          M_game_controller_d = WIPE_game_controller;
        end
      end
      RESTORE1_game_controller: begin
        M_segment_d = 20'h72d70;
        M_reg_write_address_1 = 6'h01;
        M_reg_write_enable_1 = 1'h1;
        M_reg_write_address_2 = 6'h02;
        M_reg_write_enable_2 = 1'h1;
        M_reg_write_address_3 = 6'h03;
        M_reg_write_enable_3 = 1'h1;
        M_reg_write_data_1 = M_reg_out[496+15-:16];
        M_reg_write_data_2 = M_reg_out[512+15-:16];
        M_reg_write_data_3 = M_reg_out[528+15-:16];
        M_game_controller_d = RESTORE2_game_controller;
      end
      RESTORE2_game_controller: begin
        M_segment_d = 20'h72d70;
        M_reg_write_address_1 = 6'h04;
        M_reg_write_enable_1 = 1'h1;
        M_reg_write_address_2 = 6'h05;
        M_reg_write_enable_2 = 1'h1;
        M_reg_write_address_3 = 6'h06;
        M_reg_write_enable_3 = 1'h1;
        M_reg_write_data_1 = M_reg_out[544+15-:16];
        M_reg_write_data_2 = M_reg_out[560+15-:16];
        M_reg_write_data_3 = M_reg_out[576+15-:16];
        M_game_controller_d = RESTORE3_game_controller;
      end
      RESTORE3_game_controller: begin
        M_segment_d = 20'h72d70;
        M_reg_write_address_1 = 6'h07;
        M_reg_write_enable_1 = 1'h1;
        M_reg_write_address_2 = 6'h08;
        M_reg_write_enable_2 = 1'h1;
        M_reg_write_address_3 = 6'h09;
        M_reg_write_enable_3 = 1'h1;
        M_reg_write_data_1 = M_reg_out[592+15-:16];
        M_reg_write_data_2 = M_reg_out[608+15-:16];
        M_reg_write_data_3 = M_reg_out[624+15-:16];
        if (M_reg_out[176+15-:16] == 1'h0) begin
          M_game_controller_d = START_game_controller;
        end else begin
          M_reg_write_address_4 = 6'h28;
          M_reg_write_data_4 = M_reg_out[640+15-:16] - 1'h1;
          M_reg_write_enable_4 = 1'h1;
          M_game_controller_d = IDLE_game_controller;
        end
      end
    endcase
    if ((|button)) begin
      if (button[1+0-:1]) begin
        M_game_controller_d = WIPE_game_controller;
      end else begin
        if (M_game_controller_q != IDLE_game_controller && M_game_controller_q != START_game_controller) begin
          if (M_game_controller_q == SAVE1_game_controller || M_game_controller_q == SAVE2_game_controller || M_game_controller_q == SAVE3_game_controller) begin
            if (M_reg_out[176+15-:16] == 1'h0) begin
              M_game_controller_d = START_game_controller;
            end else begin
              M_reg_write_address_4 = 6'h28;
              M_reg_write_data_4 = M_reg_out[640+15-:16] - 1'h1;
              M_reg_write_enable_4 = 1'h1;
              M_game_controller_d = IDLE_game_controller;
            end
          end else begin
            if (M_game_controller_q == RESTORE1_game_controller || M_game_controller_q == RESTORE2_game_controller || M_game_controller_q == RESTORE3_game_controller) begin
              
            end else begin
              M_game_controller_d = RESTORE1_game_controller;
            end
          end
        end
      end
    end
  end
  
  always @(posedge clk) begin
    M_segment_q <= M_segment_d;
    M_game_controller_q <= M_game_controller_d;
  end
  
endmodule
