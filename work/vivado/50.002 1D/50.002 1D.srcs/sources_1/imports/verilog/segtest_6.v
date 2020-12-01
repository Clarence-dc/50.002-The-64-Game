/*
   This file was generated automatically by Alchitry Labs version 1.2.1.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module segtest_6 (
    input clk,
    input rst,
    input [4:0] button,
    output reg [19:0] seg
  );
  
  
  
  wire [1-1:0] M_slowclk_value;
  counter_15 slowclk (
    .clk(clk),
    .rst(rst),
    .value(M_slowclk_value)
  );
  
  wire [1-1:0] M_slowclkedge_out;
  reg [1-1:0] M_slowclkedge_in;
  edge_detector_14 slowclkedge (
    .clk(clk),
    .in(M_slowclkedge_in),
    .out(M_slowclkedge_out)
  );
  
  wire [(3'h5+0)-1:0] M_buttondetector_out;
  reg [(3'h5+0)-1:0] M_buttondetector_in;
  
  genvar GEN_buttondetector0;
  generate
  for (GEN_buttondetector0=0;GEN_buttondetector0<3'h5;GEN_buttondetector0=GEN_buttondetector0+1) begin: buttondetector_gen_0
    edge_detector_2 buttondetector (
      .clk(M_slowclkedge_out),
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
  
  
  localparam IDLE_auto_controller = 3'd0;
  localparam S0_auto_controller = 3'd1;
  localparam S1_auto_controller = 3'd2;
  localparam S2_auto_controller = 3'd3;
  localparam S3_auto_controller = 3'd4;
  localparam S4_auto_controller = 3'd5;
  localparam S5_auto_controller = 3'd6;
  localparam S6_auto_controller = 3'd7;
  
  reg [2:0] M_auto_controller_d, M_auto_controller_q = IDLE_auto_controller;
  
  always @* begin
    M_auto_controller_d = M_auto_controller_q;
    
    M_slowclkedge_in = M_slowclk_value;
    M_buttoncond_in = button;
    M_buttondetector_in = M_buttoncond_out;
    seg = 20'h84210;
    
    case (M_auto_controller_q)
      IDLE_auto_controller: begin
        seg = 20'ha992e;
      end
      S0_auto_controller: begin
        seg = 20'h00443;
        M_auto_controller_d = S1_auto_controller;
      end
      S1_auto_controller: begin
        seg = 20'h214c7;
        M_auto_controller_d = S2_auto_controller;
      end
      S2_auto_controller: begin
        seg = 20'h4254b;
        M_auto_controller_d = S3_auto_controller;
      end
      S3_auto_controller: begin
        seg = 20'h635cf;
        M_auto_controller_d = S4_auto_controller;
      end
      S4_auto_controller: begin
        seg = 20'h84695;
        M_auto_controller_d = S5_auto_controller;
      end
      S5_auto_controller: begin
        seg = 20'hb5f19;
        M_auto_controller_d = S6_auto_controller;
      end
      S6_auto_controller: begin
        seg = 20'hd6f9d;
        M_auto_controller_d = S0_auto_controller;
      end
    endcase
    if (M_buttondetector_out[1+0-:1]) begin
      if (M_auto_controller_q != IDLE_auto_controller) begin
        M_auto_controller_d = IDLE_auto_controller;
      end else begin
        M_auto_controller_d = S0_auto_controller;
      end
    end
  end
  
  always @(posedge M_slowclkedge_out) begin
    M_auto_controller_q <= M_auto_controller_d;
  end
  
endmodule
