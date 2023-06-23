`timescale 1ns/1ns

// `include "enums.sv"
import enums::*;

module tb_alu;
  reg [7:0] in1;
  reg [7:0] in2;
  reg [7:0] alu_sel;
  reg [7:0] status;
  wire [7:0] out;
  wire [7:0] next_status;
  wire [7:0] temp_status;

  alu alu(
    .in1(in1),
    .in2(in2),
    .alu_sel(alu_sel),
    .status(status),
    .out(out),
    .next_status(next_status),
    .temp_status(temp_status)
  );

  initial begin
    // Initialize input values
    in1 = 8'h00;
    in2 = 8'h00;
    alu_sel = 8'h00;
    status = 8'h00;

    // Wait for a few time units for initialization
    #10;

    // Test case: DO_OP_ADD_NZ
    in1 = 8'h0A;
    in2 = 8'h05;
    alu_sel = 8'h01; // DO_OP_ADD_NZ
    #10; // Wait for some time to observe the output

    // Test case: DO_OP_SUB_NZ
    in1 = 8'h0A;
    in2 = 8'h05;
    alu_sel = 8'h02; // DO_OP_SUB_NZ
    #10;

    // Test case: DO_OP_CMP
    in1 = 8'h0A;
    in2 = 8'h05;
    alu_sel = 8'h03; // DO_OP_CMP
    #10;

    // Test case: DO_OP_ADD
    in1 = 8'h0A;
    in2 = 8'h05;
    alu_sel = 8'h04; // DO_OP_ADD
    #10;

    // Test case: DO_OP_SUB
    in1 = 8'h0A;
    in2 = 8'h05;
    alu_sel = 8'h05; // DO_OP_SUB
    #10;

    // Test case: DO_OP_ADC
    in1 = 8'h0A;
    in2 = 8'h05;
    alu_sel = 8'h06; // DO_OP_ADC
    #10;

    // Test case: DO_OP_SBC
    in1 = 8'h0A;
    in2 = 8'h05;
    alu_sel = 8'h07; // DO_OP_SBC
    #10;

    // Test case: DO_OP_AND
    in1 = 8'h0A;
    in2 = 8'h05;
    alu_sel = 8'h08; // DO_OP_AND
    #10;

    // Test case: DO_OP_OR
    in1 = 8'h0A;
    in2 = 8'h05;
    alu_sel = 8'h09; // DO_OP_OR
    #10;

    // Test case: DO_OP_XOR
    in1 = 8'h0A;
    in2 = 8'h05;
    alu_sel = 8'h0A; // DO_OP_XOR
    #10;

    // Test case: DO_OP_ASL
    in1 = 8'h0A;
    in2 = 8'h00;
    alu_sel = 8'h0B; // DO_OP_ASL
    #10;

    // Test case: DO_OP_LSR
    in1 = 8'h0A;
    in2 = 8'h00;
    alu_sel = 8'h0C; // DO_OP_LSR
    #10;

    // Test case: DO_OP_ROL
    in1 = 8'h0A;
    in2 = 8'h00;
    alu_sel = 8'h0D; // DO_OP_ROL
    #10;

    // Test case: DO_OP_ROR
    in1 = 8'h0A;
    in2 = 8'h00;
    alu_sel = 8'h0E; // DO_OP_ROR
    #10;

    // Test case: DO_OP_SRC2
    in1 = 8'h0A;
    in2 = 8'h05;
    alu_sel = 8'h0F; // DO_OP_SRC2
    #10;

    // Test case: DO_OP_CLR_C
    in1 = 8'h0A;
    in2 = 8'h05;
    alu_sel = 8'h10; // DO_OP_CLR_C
    #10;

    // Test case: DO_OP_CLR_V
    in1 = 8'h0A;
    in2 = 8'h05;
    alu_sel = 8'h11; // DO_OP_CLR_V
    #10;

    // Test case: DO_OP_SET_C
    in1 = 8'h0A;
    in2 = 8'h05;
    alu_sel = 8'h12; // DO_OP_SET_C
    #10;

    // Test case: DO_OP_SET_V
    in1 = 8'h0A;
    in2 = 8'h05;
    alu_sel = 8'h13; // DO_OP_SET_V
    #10;

    // Test case: DO_OP_CLR_I
    in1 = 8'h0A;
    in2 = 8'h05;
    alu_sel = 8'h14; // DO_OP_CLR_I
    #10;

    // Test case: DO_OP_SET_I
    in1 = 8'h0A;
    in2 = 8'h05;
    alu_sel = 8'h15; // DO_OP_SET_I
    #10;

    // Test case: DO_OP_SET_BRK
    in1 = 8'h0A;
    in2 = 8'h05;
    alu_sel = 8'h16; // DO_OP_SET_BRK
    #10;

    // Test case: DO_OP_CLR_B
    in1 = 8'h0A;
    in2 = 8'h05;
    alu_sel = 8'h17; // DO_OP_CLR_B
    #10;

    // Test case: DO_OP_BIT
    in1 = 8'h0A;
    in2 = 8'h05;
    alu_sel = 8'h18; // DO_OP_BIT
    #10;

    // End simulation
    $finish;
  end
endmodule