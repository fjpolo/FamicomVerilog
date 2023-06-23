`timescale 1ns/1ns

import enums::*;

module tb_registers_pc_sel;

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
  registers reg_inst (
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
    
    // Testcase 1: AD_TO_PC
    #10;
    pc_sel = 1;
    #10;
    pc_sel = 0;
    
    // Testcase 2: AD_P_TO_PC
    #10;
    pc_sel = 2;
    #10;
    pc_sel = 0;
    
    // Testcase 3: INC_PC
    #10;
    pc_sel = 3;
    #10;
    pc_sel = 0;
    
    // Testcase 4: INC_SP
    #10;
    pc_sel = 4;
    #10;
    pc_sel = 0;
    
    // Testcase 5: LD_TO_PC
    #10;
    pc_sel = 5;
    #10;
    pc_sel = 0;
    
    // Testcase 6: BAV_TO_PC
    #10;
    pc_sel = 6;
    #10;
    pc_sel = 0;
    
    // Testcase 7: AD_P_BAV_TO_PC
    #10;
    pc_sel = 7;
    #10;
    pc_sel = 0;
    
    // Testcase 8: CLR_PC
    #10;
    pc_sel = 8;
    #10;
    pc_sel = 0;
    
    // Testcase 9: CLR_ADH
    #10;
    pc_sel = 9;
    #10;
    pc_sel = 0;
    
    // Testcase 10: CLR_BAH
    #10;
    pc_sel = 10;
    #10;
    pc_sel = 0;
    
    // Testcase 11: LD_IR_TO_PC
    #10;
    pc_sel = 11;
    #10;
    pc_sel = 0;
    
    // Testcase 12: JMP_TO_PC
    #10;
    pc_sel = 12;
    #10;
    pc_sel = 0;
    
    // Testcase 13: INT_TO_PC
    #10;
    pc_sel = 13;
    #10;
    pc_sel = 0;
    
    // Testcase 14: NEXT_TO_PC
    #10;
    pc_sel = 14;
    #10;
    pc_sel = 0;
    
    // Testcase 15: HALT_TO_PC
    #10;
    pc_sel = 15;
    #10;
    pc_sel = 0;
    
    // Testcase 16: Random value
    #10;
    pc_sel = $random;
    #10;
    pc_sel = 0;
    
    // End simulation
    $finish;
  end
endmodule