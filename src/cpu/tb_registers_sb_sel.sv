`timescale 1ns/1ns

import enums::*;

module tb_register_sb_sel;

  // Inputs
  reg clk;
  reg rst;
  reg [7:0] dest_sel;
  reg [7:0] pc_sel;
  reg [7:0] sp_sel;
  reg [7:0] ld_sel;
  reg [7:0] st_sel;
  reg clr_adh;
  reg clr_bah;
  reg [7:0] alu_out;
  reg [7:0] next_status;
  reg [7:0] int_sel;
  reg stall;
  
  // Outputs
  wire [7:0] data;
  wire [7:0] a;
  wire [7:0] x;
  wire [7:0] y;
  wire [7:0] ir;
  wire [7:0] imm;
  wire [7:0] adv;
  wire [7:0] bav;
  wire [7:0] offset;
  wire [7:0] sp;
  wire [15:0] pc;
  wire [15:0] ad;
  wire [15:0] ba;
  wire n;
  wire z;
  wire v;
  wire c;
  wire b;
  wire d;
  wire i;
  wire [7:0] status;
  
  // Instantiate the registers module
  registers dut (
    .clk(clk),
    .rst(rst),
    .dest_sel(dest_sel),
    .pc_sel(pc_sel),
    .sp_sel(sp_sel),
    .ld_sel(ld_sel),
    .st_sel(st_sel),
    .clr_adh(clr_adh),
    .clr_bah(clr_bah),
    .alu_out(alu_out),
    .next_status(next_status),
    .int_sel(int_sel),
    .stall(stall),
    .data(data),
    .a(a),
    .x(x),
    .y(y),
    .ir(ir),
    .imm(imm),
    .adv(adv),
    .bav(bav),
    .offset(offset),
    .sp(sp),
    .pc(pc),
    .ad(ad),
    .ba(ba),
    .n(n),
    .z(z),
    .v(v),
    .c(c),
    .b(b),
    .d(d),
    .i(i),
    .status(status)
  );
  
  // Clock generation
  always begin
    clk = 0;
    #5;
    clk = 1;
    #5;
  end

  // Internal wires
  wire [7:0] internal_data;
  
  // Assign internal_data to data using assign statement
  assign data = internal_data;
  
  initial begin
    // Initialize inputs
    rst = 1;
    dest_sel = 0;
    pc_sel = 0;
    sp_sel = 0;
    ld_sel = 0;
    st_sel = 0;
    clr_adh = 0;
    clr_bah = 0;
    alu_out = 0;
    next_status = 0;
    int_sel = 0;
    stall = 0;
    
    // Wait for some time for reset to settle
    #20;
    
    // Deassert reset
    rst = 0;
    
    // Testcase 1: ST_A
    #10;
    st_sel = 1;
    force internal_data   = 8'b10101010;
    #10;
    st_sel = 0;
    
    // Testcase 2: ST_X
    #10;
    st_sel = 2;
    force internal_data   = 8'b11001100;
    #10;
    st_sel = 0;
    
    // Testcase 3: ST_Y
    #10;
    st_sel = 3;
    force internal_data   = 8'b11110000;
    #10;
    st_sel = 0;
    
    // Testcase 4: ST_PCH
    #10;
    st_sel = 4;
    force internal_data   = 8'b01010101;
    #10;
    st_sel = 0;
    
    // Testcase 5: ST_PCL
    #10;
    st_sel = 5;
    force internal_data   = 8'b00110011;
    #10;
    st_sel = 0;
    
    // Testcase 6: ST_P
    #10;
    st_sel = 6;
    force internal_data   = 8'b11001100;
    #10;
    st_sel = 0;
    
    // Testcase 7: ST_ADV
    #10;
    st_sel = 7;
    force internal_data   = 8'b10101010;
    #10;
    st_sel = 0;
    
    // Testcase 8: ST_BAV
    #10;
    st_sel = 8;
    force internal_data   = 8'b11110000;
    #10;
    st_sel = 0;
    
    // Testcase 9: Default
    #10;
    st_sel = 0;
    force internal_data   = 8'b00000000;
    #10;
    
    // End simulation
    $finish;
  end

endmodule