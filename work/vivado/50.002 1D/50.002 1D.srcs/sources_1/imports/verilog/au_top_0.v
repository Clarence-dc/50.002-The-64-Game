/*
   This file was generated automatically by Alchitry Labs version 1.2.1.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module au_top_0 (
    input clk,
    input rst_n,
    output reg [7:0] led,
    input usb_rx,
    output reg usb_tx,
    output reg [23:0] io_led,
    output reg [7:0] io_seg,
    output reg [3:0] io_sel,
    output reg [17:0] r,
    output reg [7:0] sevenseg,
    input [4:0] io_button,
    input [4:0] gamebutton,
    input [23:0] io_dip
  );
  
  
  
  reg rst;
  
  wire [1-1:0] M_reset_cond_out;
  reg [1-1:0] M_reset_cond_in;
  reset_conditioner_1 reset_cond (
    .clk(clk),
    .in(M_reset_cond_in),
    .out(M_reset_cond_out)
  );
  wire [(3'h5+0)-1:0] M_buttondetector_out;
  reg [(3'h5+0)-1:0] M_buttondetector_in;
  
  genvar GEN_buttondetector0;
  generate
  for (GEN_buttondetector0=0;GEN_buttondetector0<3'h5;GEN_buttondetector0=GEN_buttondetector0+1) begin: buttondetector_gen_0
    edge_detector_2 buttondetector (
      .clk(clk),
      .in(M_buttondetector_in[GEN_buttondetector0*(1)+(1)-1-:(1)]),
      .out(M_buttondetector_out[GEN_buttondetector0*(1)+(1)-1-:(1)])
    );
  end
  endgenerate
  wire [(3'h5+0)-1:0] M_buttoncond_out;
  reg [(3'h5+0)-1:0] M_buttoncond_in;
  
  genvar GEN_buttoncond0;
  generate
  for (GEN_buttoncond0=0;GEN_buttoncond0<3'h5;GEN_buttoncond0=GEN_buttoncond0+1) begin: buttoncond_gen_0
    button_conditioner_3 buttoncond (
      .clk(clk),
      .in(M_buttoncond_in[GEN_buttoncond0*(1)+(1)-1-:(1)]),
      .out(M_buttoncond_out[GEN_buttoncond0*(1)+(1)-1-:(1)])
    );
  end
  endgenerate
  localparam S0_mode_controller = 3'd0;
  localparam S1_mode_controller = 3'd1;
  localparam S2_mode_controller = 3'd2;
  localparam S3_mode_controller = 3'd3;
  localparam S4_mode_controller = 3'd4;
  
  reg [2:0] M_mode_controller_d, M_mode_controller_q = S0_mode_controller;
  wire [16-1:0] M_auto_out;
  wire [20-1:0] M_auto_seg;
  wire [24-1:0] M_auto_io_led;
  reg [5-1:0] M_auto_button;
  autotester_4 auto (
    .clk(clk),
    .rst(rst),
    .button(M_auto_button),
    .out(M_auto_out),
    .seg(M_auto_seg),
    .io_led(M_auto_io_led)
  );
  wire [20-1:0] M_manual_seg;
  wire [24-1:0] M_manual_io_led;
  reg [5-1:0] M_manual_button;
  reg [24-1:0] M_manual_io_dip;
  manualtester_5 manual (
    .clk(clk),
    .rst(rst),
    .button(M_manual_button),
    .io_dip(M_manual_io_dip),
    .seg(M_manual_seg),
    .io_led(M_manual_io_led)
  );
  wire [20-1:0] M_segtest_seg;
  reg [5-1:0] M_segtest_button;
  segtest_6 segtest (
    .clk(clk),
    .rst(rst),
    .button(M_segtest_button),
    .seg(M_segtest_seg)
  );
  wire [8-1:0] M_seg_seg;
  wire [4-1:0] M_seg_sel;
  reg [20-1:0] M_seg_values;
  multi_seven_seg_7 seg (
    .clk(clk),
    .rst(rst),
    .values(M_seg_values),
    .seg(M_seg_seg),
    .sel(M_seg_sel)
  );
  wire [8-1:0] M_seg18_seg;
  wire [18-1:0] M_seg18_sel;
  reg [90-1:0] M_seg18_values;
  eighteen_seven_seg_8 seg18 (
    .clk(clk),
    .rst(rst),
    .values(M_seg18_values),
    .seg(M_seg18_seg),
    .sel(M_seg18_sel)
  );
  wire [90-1:0] M_game_seg18;
  wire [144-1:0] M_game_arr;
  wire [20-1:0] M_game_io_seg;
  reg [5-1:0] M_game_button;
  game_9 game (
    .clk(clk),
    .rst(rst),
    .button(M_game_button),
    .seg18(M_game_seg18),
    .arr(M_game_arr),
    .io_seg(M_game_io_seg)
  );
  wire [20-1:0] M_rand_auto_seg;
  reg [5-1:0] M_rand_auto_button;
  randgen_autotester_10 rand_auto (
    .clk(clk),
    .rst(rst),
    .button(M_rand_auto_button),
    .seg(M_rand_auto_seg)
  );
  
  always @* begin
    M_mode_controller_d = M_mode_controller_q;
    
    M_reset_cond_in = ~rst_n;
    rst = M_reset_cond_out;
    usb_tx = usb_rx;
    led = 8'h00;
    io_led = 24'h000000;
    io_seg = 8'hff;
    io_sel = 4'hf;
    sevenseg = ~M_seg18_seg;
    r = ~M_seg18_sel;
    M_seg18_values = 90'h21084210842108421084210;
    M_seg_values = 20'h84210;
    M_buttoncond_in = io_button[0+4-:5];
    M_buttondetector_in = M_buttoncond_out;
    M_manual_io_dip = 24'h000000;
    M_manual_button = 5'h00;
    M_segtest_button = 5'h00;
    M_auto_button = 5'h00;
    M_game_button = 5'h00;
    M_rand_auto_button = 5'h00;
    io_seg = ~M_seg_seg;
    io_sel = ~M_seg_sel;
    
    case (M_mode_controller_q)
      S0_mode_controller: begin
        M_manual_io_dip = io_dip;
        M_manual_button = M_buttondetector_out;
        io_led[16+0+5-:6] = io_dip[16+0+5-:6];
        io_led = M_manual_io_led;
        M_seg_values = M_manual_seg;
        if (M_buttondetector_out[0+0-:1]) begin
          M_mode_controller_d = S4_mode_controller;
        end else begin
          if (M_buttondetector_out[2+0-:1]) begin
            M_mode_controller_d = S1_mode_controller;
          end
        end
      end
      S1_mode_controller: begin
        M_auto_button = io_button;
        if (M_buttondetector_out[0+0-:1]) begin
          M_mode_controller_d = S0_mode_controller;
        end else begin
          if (M_buttondetector_out[2+0-:1]) begin
            M_mode_controller_d = S2_mode_controller;
          end
        end
        io_led[8+7-:8] = M_auto_out[8+7-:8];
        io_led[0+7-:8] = M_auto_out[0+7-:8];
        M_seg_values = M_auto_seg;
        io_led = M_auto_io_led;
      end
      S2_mode_controller: begin
        M_segtest_button = io_button;
        if (M_buttondetector_out[0+0-:1]) begin
          M_mode_controller_d = S1_mode_controller;
        end else begin
          if (M_buttondetector_out[2+0-:1]) begin
            M_mode_controller_d = S3_mode_controller;
          end
        end
        M_seg_values = M_segtest_seg;
      end
      S3_mode_controller: begin
        M_game_button = gamebutton;
        M_seg_values = M_game_io_seg;
        M_seg18_values = M_game_seg18;
        if (M_game_arr != 144'h000000000000000000000000000000000000) begin
          M_mode_controller_d = S3_mode_controller;
        end else begin
          if (M_buttondetector_out[0+0-:1]) begin
            M_mode_controller_d = S2_mode_controller;
          end else begin
            if (M_buttondetector_out[2+0-:1]) begin
              M_mode_controller_d = S4_mode_controller;
            end
          end
        end
      end
      S4_mode_controller: begin
        M_rand_auto_button = M_buttondetector_out;
        M_seg_values = M_rand_auto_seg;
        if (M_buttondetector_out[0+0-:1]) begin
          M_mode_controller_d = S3_mode_controller;
        end else begin
          if (M_buttondetector_out[2+0-:1]) begin
            M_mode_controller_d = S0_mode_controller;
          end
        end
      end
    endcase
  end
  
  always @(posedge clk) begin
    if (rst == 1'b1) begin
      M_mode_controller_q <= 1'h0;
    end else begin
      M_mode_controller_q <= M_mode_controller_d;
    end
  end
  
endmodule
