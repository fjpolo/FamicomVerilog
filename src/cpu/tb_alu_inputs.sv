`timescale 1ns/1ns

import enums::*;

module tb_alu_inputs;
  reg clk;
  reg rst;
  reg [7:0] src1_sel;
  reg [7:0] src2_sel;
  reg stall;
  reg [7:0] a, bal, bah, adl, pcl, pch;
  reg [7:0] imm, adv, x, bav, y, offset, sp, temp_status;
  wire [7:0] in1, in2;

  alu_inputs dut (
    .clk(clk),
    .rst(rst),
    .src1_sel(src1_sel),
    .src2_sel(src2_sel),
    .stall(stall),
    .a(a),
    .bal(bal),
    .bah(bah),
    .adl(adl),
    .pcl(pcl),
    .pch(pch),
    .imm(imm),
    .adv(adv),
    .x(x),
    .bav(bav),
    .y(y),
    .offset(offset),
    .sp(sp),
    .temp_status(temp_status),
    .in1(in1),
    .in2(in2)
  );

  // Clock generation
  always #5 clk = ~clk;

  // Stimulus
  initial begin
    clk = 0;
    rst = 0;
    src1_sel = 0;
    src2_sel = 0;
    stall = 0;
    a = 8'h00;
    bal = 8'h00;
    bah = 8'h00;
    adl = 8'h00;
    pcl = 8'h00;
    pch = 8'h00;
    imm = 8'h00;
    adv = 8'h00;
    x = 8'h00;
    bav = 8'h00;
    y = 8'h00;
    offset = 8'h00;
    sp = 8'h00;
    temp_status = 8'h00;

    // Apply reset
    rst = 1;
    #10 rst = 0;

    // Test case 1
    src1_sel = SRC1_A;
    src2_sel = SRC2_IMM;
    stall = 0;
    a = 8'h12;
    imm = 8'h34;

    #20;

    // Test case 2
    src1_sel = SRC1_BAL;
    src2_sel = SRC2_X;
    stall = 0;
    bal = 8'h56;
    x = 8'h78;

    #20;

    // Test case 3
    src1_sel = SRC1_PCH;
    src2_sel = SRC2_OFFSET;
    stall = 1; // Apply stall
    pch = 8'h9A;
    offset = 8'hBC;

    #20;

    // Test case 4
    src1_sel = SRC1_DC;
    src2_sel = SRC2_SP;
    stall = 0;
    sp = 8'hDE;

    #20;

    // Add more test cases as needed

    // End simulation
    $finish;
  end

  // Display the outputs
  always @(in1, in2) begin
    $display("in1 = %h, in2 = %h", in1, in2);
  end
endmodule