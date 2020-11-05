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
    input [4:0] io_button,
    input [23:0] io_dip
  );
  
  
  
  reg rst;
  reg [5:0] alufn;
  
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
  reg [15:0] M_a_mem_d, M_a_mem_q = 1'h0;
  reg [15:0] M_b_mem_d, M_b_mem_q = 1'h0;
  localparam S0_input_controller = 2'd0;
  localparam S1_input_controller = 2'd1;
  localparam S2_input_controller = 2'd2;
  
  reg [1:0] M_input_controller_d, M_input_controller_q = S0_input_controller;
  wire [8-1:0] M_seg_seg;
  wire [4-1:0] M_seg_sel;
  reg [20-1:0] M_seg_values;
  multi_seven_seg_4 seg (
    .clk(clk),
    .rst(rst),
    .values(M_seg_values),
    .seg(M_seg_seg),
    .sel(M_seg_sel)
  );
  
  wire [16-1:0] M_adder_s;
  wire [1-1:0] M_adder_z;
  wire [1-1:0] M_adder_v;
  wire [1-1:0] M_adder_n;
  reg [16-1:0] M_adder_a;
  reg [16-1:0] M_adder_b;
  reg [6-1:0] M_adder_alufn;
  add_sub16bit_5 adder (
    .a(M_adder_a),
    .b(M_adder_b),
    .alufn(M_adder_alufn),
    .s(M_adder_s),
    .z(M_adder_z),
    .v(M_adder_v),
    .n(M_adder_n)
  );
  
  wire [16-1:0] M_bool_boole;
  reg [16-1:0] M_bool_a;
  reg [16-1:0] M_bool_b;
  reg [6-1:0] M_bool_alufn;
  boolean_6 bool (
    .a(M_bool_a),
    .b(M_bool_b),
    .alufn(M_bool_alufn),
    .boole(M_bool_boole)
  );
  
  wire [16-1:0] M_shift_out;
  reg [16-1:0] M_shift_a;
  reg [16-1:0] M_shift_b;
  reg [6-1:0] M_shift_alufn;
  shifter_7 shift (
    .a(M_shift_a),
    .b(M_shift_b),
    .alufn(M_shift_alufn),
    .out(M_shift_out)
  );
  
  wire [1-1:0] M_comp_cmp;
  reg [1-1:0] M_comp_z;
  reg [1-1:0] M_comp_v;
  reg [1-1:0] M_comp_n;
  reg [6-1:0] M_comp_alufn;
  comparator_8 comp (
    .z(M_comp_z),
    .v(M_comp_v),
    .n(M_comp_n),
    .alufn(M_comp_alufn),
    .cmp(M_comp_cmp)
  );
  
  always @* begin
    M_input_controller_d = M_input_controller_q;
    M_a_mem_d = M_a_mem_q;
    M_b_mem_d = M_b_mem_q;
    
    M_reset_cond_in = ~rst_n;
    rst = M_reset_cond_out;
    usb_tx = usb_rx;
    led = 8'h00;
    io_led = 24'h000000;
    io_seg = 8'hff;
    io_sel = 4'hf;
    M_seg_values = 20'h8c631;
    M_buttoncond_in = io_button[0+4-:5];
    M_buttondetector_in = M_buttoncond_out;
    alufn = io_dip[16+0+5-:6];
    M_adder_a = 1'h0;
    M_adder_b = 1'h0;
    M_adder_alufn = alufn;
    M_bool_a = 1'h0;
    M_bool_b = 1'h0;
    M_bool_alufn = alufn;
    M_shift_a = 1'h0;
    M_shift_b = 1'h0;
    M_shift_alufn = alufn;
    M_comp_z = 1'h0;
    M_comp_v = 1'h0;
    M_comp_n = 1'h0;
    M_comp_alufn = alufn;
    io_led[16+0+5-:6] = io_dip[16+0+5-:6];
    io_seg = ~M_seg_seg;
    io_sel = ~M_seg_sel;
    
    case (M_input_controller_q)
      S0_input_controller: begin
        M_seg_values = 20'h04631;
        io_led[16+7+0-:1] = 8'h01;
        io_led[16+6+0-:1] = 8'h00;
        M_a_mem_d[8+7-:8] = io_dip[8+7-:8];
        M_a_mem_d[0+7-:8] = io_dip[0+7-:8];
        io_led[8+7-:8] = io_dip[8+7-:8];
        io_led[0+7-:8] = io_dip[0+7-:8];
        if (M_buttondetector_out[4+0-:1]) begin
          M_input_controller_d = S1_input_controller;
        end else begin
          if (M_buttondetector_out[3+0-:1]) begin
            M_input_controller_d = S2_input_controller;
          end else begin
            M_input_controller_d = S0_input_controller;
          end
        end
      end
      S1_input_controller: begin
        M_seg_values = 20'h0c631;
        io_led[16+7+0-:1] = 8'h00;
        io_led[16+6+0-:1] = 8'h01;
        M_b_mem_d[8+7-:8] = io_dip[8+7-:8];
        M_b_mem_d[0+7-:8] = io_dip[0+7-:8];
        io_led[8+7-:8] = io_dip[8+7-:8];
        io_led[0+7-:8] = io_dip[0+7-:8];
        if (M_buttondetector_out[4+0-:1]) begin
          M_input_controller_d = S2_input_controller;
        end else begin
          if (M_buttondetector_out[3+0-:1]) begin
            M_input_controller_d = S0_input_controller;
          end else begin
            M_input_controller_d = S1_input_controller;
          end
        end
      end
      S2_input_controller: begin
        io_led[16+7+0-:1] = 8'h01;
        io_led[16+6+0-:1] = 8'h01;
        
        case (alufn[4+1-:2])
          2'h0: begin
            M_adder_a = M_a_mem_q;
            M_adder_b = M_b_mem_q;
            
            case (alufn[0+1-:2])
              2'h0: begin
                M_seg_values = 20'h14460;
              end
              2'h1: begin
                M_seg_values = 20'h14464;
              end
              2'h2: begin
                M_seg_values = 20'h14465;
              end
              2'h3: begin
                M_seg_values = 20'h14466;
              end
            endcase
            io_led[8+7-:8] = M_adder_s[8+7-:8];
            io_led[0+7-:8] = M_adder_s[0+7-:8];
          end
          2'h1: begin
            M_bool_a = M_a_mem_q;
            M_bool_b = M_b_mem_q;
            M_seg_values = 20'h144f1;
            
            case (alufn[0+3-:4])
              4'h8: begin
                M_seg_values = 20'h144e8;
              end
              4'he: begin
                M_seg_values = 20'h144e2;
              end
              4'h6: begin
                M_seg_values = 20'h144e5;
              end
              4'ha: begin
                M_seg_values = 20'h144e9;
              end
            endcase
            io_led[8+7-:8] = M_bool_boole[8+7-:8];
            io_led[0+7-:8] = M_bool_boole[0+7-:8];
          end
          2'h2: begin
            M_shift_a = M_a_mem_q;
            M_shift_b = M_b_mem_q;
            M_seg_values = 20'h14551;
            
            case (alufn[0+1-:2])
              2'h0: begin
                M_seg_values = 20'h14549;
              end
              2'h1: begin
                M_seg_values = 20'h1454b;
              end
              2'h3: begin
                M_seg_values = 20'h1454c;
              end
            endcase
            io_led[8+7-:8] = M_shift_out[8+7-:8];
            io_led[0+7-:8] = M_shift_out[0+7-:8];
          end
          2'h3: begin
            M_adder_a = M_a_mem_q;
            M_adder_b = M_b_mem_q;
            M_comp_z = M_adder_z;
            M_comp_v = M_adder_v;
            M_comp_n = M_adder_n;
            M_seg_values = 20'h145b1;
            
            case (alufn[0+3-:4])
              4'h5: begin
                M_seg_values = 20'h145ae;
              end
              4'h9: begin
                M_seg_values = 20'h145a9;
              end
              4'hd: begin
                M_seg_values = 20'h145af;
              end
            endcase
            io_led[8+7-:8] = 1'h0;
            io_led[0+1+6-:7] = 1'h0;
            io_led[0+0+0-:1] = M_comp_cmp;
          end
        endcase
        if (M_buttondetector_out[4+0-:1]) begin
          M_input_controller_d = S0_input_controller;
        end else begin
          if (M_buttondetector_out[3+0-:1]) begin
            M_input_controller_d = S1_input_controller;
          end else begin
            M_input_controller_d = S2_input_controller;
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
