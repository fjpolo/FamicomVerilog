`timescale 1ns/1ns

module tb_alu;
  
  // Testbench inputs
  reg SUM_enable;
  reg AND_enable;
  reg EOR_enable;
  reg OR_enable;
  reg SR_enable;
  reg INV_enable;
  reg ROR_enable;
  reg [7:0] A_in;
  reg [7:0] B_in;
  reg carry_in;
  
  // Testbench outputs
  wire [7:0] result;
  wire carry_out;
  wire overflow_out;
  
  // Instantiate the ALU module
  alu uut (
    .SUM_enable(SUM_enable),
    .AND_enable(AND_enable),
    .EOR_enable(EOR_enable),
    .OR_enable(OR_enable),
    .SR_enable(SR_enable),
    .INV_enable(INV_enable),
    .ROR_enable(ROR_enable),
    .A_in(A_in),
    .B_in(B_in),
    .carry_in(carry_in),
    .result(result),
    .carry_out(carry_out),
    .overflow_out(overflow_out)
  );
  
  // Clock generation
  reg clk;
  always #5 clk = ~clk;
  
  // Testbench stimulus
  initial begin
    clk = 0;
    SUM_enable = 0;
    AND_enable = 0;
    EOR_enable = 0;
    OR_enable = 0;
    SR_enable = 0;
    INV_enable = 0;
    ROR_enable = 0;
    A_in = 8'b0;
    B_in = 8'b0;
    carry_in = 0;
    
    // Wait for the initial signals to stabilize
    #10;
	 
    //
    // Toggle the control signals and inputs to observe the output
	 //
	 
	 
	 //
	 // SUM
	 //
	 
    // Case 1: sum two positive values, not-to-be overflow, no carry
    SUM_enable <= 1;
    AND_enable <= 0;
    EOR_enable <= 0;
    OR_enable <= 0;
    SR_enable <= 0;
    INV_enable <= 0;
    ROR_enable <= 0;
    carry_in <= 0;
    A_in <= 8'h10;
    B_in <= 8'h01;  
    // Wait for the output to stabilize
    #10;
	 
	 // Case 2: sum two positive values, not-to-be overflow, carry
    SUM_enable <= 1;
    AND_enable <= 0;
    EOR_enable <= 0;
    OR_enable <= 0;
    SR_enable <= 0;
    INV_enable <= 0;
    ROR_enable <= 0;
    carry_in <= 1;
    A_in <= 8'h10;
    B_in <= 8'h01;
    // Wait for the output to stabilize
    #10;
	 
    // Case 3: sum two positive values, to-be overflow, no carry
    SUM_enable <= 1;
    AND_enable <= 0;
    EOR_enable <= 0;
    OR_enable <= 0;
    SR_enable <= 0;
    INV_enable <= 0;
    ROR_enable <= 0;
    carry_in <= 0;
    A_in <= 127;
    B_in <= 24;  
    // Wait for the output to stabilize
    #10;
	 
	 // Case 4: sum two positive values, to-be overflow, carry
    SUM_enable <= 1;
    AND_enable <= 0;
    EOR_enable <= 0;
    OR_enable <= 0;
    SR_enable <= 0;
    INV_enable <= 0;
    ROR_enable <= 0;
    carry_in <= 1;
    A_in <= 120;
    B_in <= 7;  
    // Wait for the output to stabilize
    #10;
	 
	 // Case 5: sum two negative values, not-to-be overflow, no carry
    SUM_enable <= 1;
    AND_enable <= 0;
    EOR_enable <= 0;
    OR_enable <= 0;
    SR_enable <= 0;
    INV_enable <= 0;
    ROR_enable <= 0;
    carry_in <= 0;
    A_in <= -22;
    B_in <= -7;  
    // Wait for the output to stabilize
    #10;
	 
	 // Case 6: sum two negative values, not-to-be overflow, carry
    SUM_enable <= 1;
    AND_enable <= 0;
    EOR_enable <= 0;
    OR_enable <= 0;
    SR_enable <= 0;
    INV_enable <= 0;
    ROR_enable <= 0;
    carry_in <= 1;
    A_in <= -22;
    B_in <= -7;  
    // Wait for the output to stabilize
    #10;
	 
	 // Case 7: sum two negative values, to-be overflow, no carry
    SUM_enable <= 1;
    AND_enable <= 0;
    EOR_enable <= 0;
    OR_enable <= 0;
    SR_enable <= 0;
    INV_enable <= 0;
    ROR_enable <= 0;
    carry_in <= 0;
    A_in <= -127;
    B_in <= -27;  
    // Wait for the output to stabilize
    #10;
	 
	 // Case 8: sum two negative values, to-be overflow, no carry
    SUM_enable <= 1;
    AND_enable <= 0;
    EOR_enable <= 0;
    OR_enable <= 0;
    SR_enable <= 0;
    INV_enable <= 0;
    ROR_enable <= 0;
    carry_in <= 1;
    A_in <= -127;
    B_in <= -27;  
    // Wait for the output to stabilize
    #10;
	 
	 // PAUSE
    SUM_enable <= 0;
    AND_enable <= 0;
    EOR_enable <= 0;
    OR_enable <= 0;
    SR_enable <= 0;
    INV_enable <= 0;
    ROR_enable <= 0;
    carry_in <= 0;
    A_in <= 0;
    B_in <= 0;  
    // Wait for the output to stabilize
    #50;
	 
	 //
	 // XOR
	 //
	 
    // Case 1: 1v0 
    SUM_enable <= 0;
    AND_enable <= 0;
    EOR_enable <= 1;
    OR_enable <= 0;
    SR_enable <= 0;
    INV_enable <= 0;
    ROR_enable <= 0;
    carry_in <= 0;
    A_in <= 8'b10101010;
    B_in <= 8'b01010101;  
    // Wait for the output to stabilize
    #10;
	 
	 // Case 2: 1v1 and 0v0
    SUM_enable <= 0;
    AND_enable <= 0;
    EOR_enable <= 1;
    OR_enable <= 0;
    SR_enable <= 0;
    INV_enable <= 0;
    ROR_enable <= 0;
    carry_in <= 0;
    A_in <= 8'b11110000;
    B_in <= 8'b10101010;  
    // Wait for the output to stabilize
    #10;
	 
	 
	 // PAUSE
    SUM_enable <= 0;
    AND_enable <= 0;
    EOR_enable <= 0;
    OR_enable <= 0;
    SR_enable <= 0;
    INV_enable <= 0;
    ROR_enable <= 0;
    carry_in <= 0;
    A_in <= 0;
    B_in <= 0;  
    // Wait for the output to stabilize
    #50;
	 
	 
	 //
	 // OR
	 //
	 
    // Case 1: 
    SUM_enable <= 0;
    AND_enable <= 0;
    EOR_enable <= 0;
    OR_enable <= 1;
    SR_enable <= 0;
    INV_enable <= 0;
    ROR_enable <= 0;
    carry_in <= 0;
    A_in <= 8'b11110000;
    B_in <= 8'b10101010;  
    // Wait for the output to stabilize
    #10;
	 
	 
	 // PAUSE
    SUM_enable <= 0;
    AND_enable <= 0;
    EOR_enable <= 0;
    OR_enable <= 0;
    SR_enable <= 0;
    INV_enable <= 0;
    ROR_enable <= 0;
    carry_in <= 0;
    A_in <= 0;
    B_in <= 0;  
    // Wait for the output to stabilize
    #50;
	 
	 
	 //
	 // AND
	 //
	 
    // Case 1: 
    SUM_enable <= 0;
    AND_enable <= 1;
    EOR_enable <= 0;
    OR_enable <= 0;
    SR_enable <= 0;
    INV_enable <= 0;
    ROR_enable <= 0;
    carry_in <= 0;
    A_in <= 8'b11110000;
    B_in <= 8'b10101010;  
    // Wait for the output to stabilize
    #10;	 
	 
	 
	 // PAUSE
	 SUM_enable <= 0;
    AND_enable <= 0;
    EOR_enable <= 0;
    OR_enable <= 0;
    SR_enable <= 0;
    INV_enable <= 0;
    ROR_enable <= 0;
    carry_in <= 0;
    A_in <= 0;
    B_in <= 0;  
    // Wait for the output to stabilize
    #50;
	 
	 
	 //
	 // SR
	 //
	 
    // Case 1: 
    SUM_enable <= 0;
    AND_enable <= 0;
    EOR_enable <= 0;
    OR_enable <= 0;
    SR_enable <= 1;
    INV_enable <= 0;
    ROR_enable <= 0;
    carry_in <= 0;
    A_in <= 8'b11110000;
    B_in <= 8'b0;  
    // Wait for the output to stabilize
    #10;	
	 
	 // Case 2: 
    SUM_enable <= 0;
    AND_enable <= 0;
    EOR_enable <= 0;
    OR_enable <= 0;
    SR_enable <= 1;
    INV_enable <= 0;
    ROR_enable <= 0;
    carry_in <= 0;
    A_in <= 8'b00000001;
    B_in <= 8'b0;  
    // Wait for the output to stabilize
    #10;	
	 
	 // PAUSE
	 SUM_enable <= 0;
    AND_enable <= 0;
    EOR_enable <= 0;
    OR_enable <= 0;
    SR_enable <= 0;
    INV_enable <= 0;
    ROR_enable <= 0;
    carry_in <= 0;
    A_in <= 0;
    B_in <= 0;  
    // Wait for the output to stabilize
    #50;
	 
	 
	 //
	 // ROR
	 //
	 
    // Case 1: 
    SUM_enable <= 0;
    AND_enable <= 0;
    EOR_enable <= 0;
    OR_enable <= 0;
    SR_enable <= 0;
    INV_enable <= 0;
    ROR_enable <= 1;
    carry_in <= 1;
    A_in <= 8'b11110000;
    B_in <= 8'b0;  
    // Wait for the output to stabilize
    #10;	
	 
	 // Case 2: 
    SUM_enable <= 0;
    AND_enable <= 0;
    EOR_enable <= 0;
    OR_enable <= 0;
    SR_enable <= 0;
    INV_enable <= 0;
    ROR_enable <= 1;
    carry_in <= 1;
    A_in <= 8'b00000001;
    B_in <= 8'b0;  
    // Wait for the output to stabilize
    #10;
	 
	 // PAUSE
	 SUM_enable <= 0;
    AND_enable <= 0;
    EOR_enable <= 0;
    OR_enable <= 0;
    SR_enable <= 0;
    INV_enable <= 0;
    ROR_enable <= 0;
    carry_in <= 0;
    A_in <= 0;
    B_in <= 0;  
    // Wait for the output to stabilize
    #50;
	 
	 //
	 // SUM + INV
	 //
	 
    // Case 1: substract two positive values, not-to-be overflow, no carry
    SUM_enable <= 1;
    AND_enable <= 0;
    EOR_enable <= 0;
    OR_enable <= 0;
    SR_enable <= 0;
    INV_enable <= 1;
    ROR_enable <= 0;
    carry_in <= 0;
    A_in <= 15;
    B_in <= 12;  
    // Wait for the output to stabilize
    #10;
	 
	 // Case 2: substract two positive values, not-to-be overflow, carry
    SUM_enable <= 1;
    AND_enable <= 0;
    EOR_enable <= 0;
    OR_enable <= 0;
    SR_enable <= 0;
    INV_enable <= 1;
    ROR_enable <= 0;
    carry_in <= 1;
    A_in <= 10;
    B_in <= 5;
    // Wait for the output to stabilize
    #10;
	 
    // Case 3: substract two positive values, to-be overflow, no carry
    SUM_enable <= 1;
    AND_enable <= 0;
    EOR_enable <= 0;
    OR_enable <= 0;
    SR_enable <= 0;
    INV_enable <= 1;
    ROR_enable <= 0;
    carry_in <= 0;
    A_in <= 0;
    B_in <= 127;  
    // Wait for the output to stabilize
    #10;
	 
	 // Case 4: substract two positive values, to-be overflow, carry
    SUM_enable <= 1;
    AND_enable <= 0;
    EOR_enable <= 0;
    OR_enable <= 0;
    SR_enable <= 0;
    INV_enable <= 1;
    ROR_enable <= 0;
    carry_in <= 1;
    A_in <= 0;
    B_in <= 127;  
    // Wait for the output to stabilize
    #10;
	 
	 // Case 5: substract two negative values, not-to-be overflow, no carry
    SUM_enable <= 1;
    AND_enable <= 0;
    EOR_enable <= 0;
    OR_enable <= 0;
    SR_enable <= 0;
    INV_enable <= 1;
    ROR_enable <= 0;
    carry_in <= 0;
    A_in <= -22;
    B_in <= -7;  
    // Wait for the output to stabilize
    #10;
	 
	 // Case 6: substract two negative values, not-to-be overflow, carry
    SUM_enable <= 1;
    AND_enable <= 0;
    EOR_enable <= 0;
    OR_enable <= 0;
    SR_enable <= 0;
    INV_enable <= 1;
    ROR_enable <= 0;
    carry_in <= 1;
    A_in <= -22;
    B_in <= -7;  
    // Wait for the output to stabilize
    #10;
	 
	 // Case 7: substract two negative values, to-be overflow, no carry
    SUM_enable <= 1;
    AND_enable <= 0;
    EOR_enable <= 0;
    OR_enable <= 0;
    SR_enable <= 0;
    INV_enable <= 1;
    ROR_enable <= 0;
    carry_in <= 0;
    A_in <= 0;
    B_in <= -127;  
    // Wait for the output to stabilize
    #10;
	 
	 // Case 8: substract two negative values, to-be overflow, no carry
    SUM_enable <= 1;
    AND_enable <= 0;
    EOR_enable <= 0;
    OR_enable <= 0;
    SR_enable <= 0;
    INV_enable <= 1;
    ROR_enable <= 0;
    carry_in <= 1;
    A_in <= 0;
    B_in <= -127;  
    // Wait for the output to stabilize
    #10;
	 
	 
    // Add additional test cases as needed
    
    // End simulation
    $finish;
  end
  
endmodule