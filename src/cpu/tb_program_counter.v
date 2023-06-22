`timescale 1ns/1ns

module tb_program_counter;
  
  // Parameters
  parameter SYS_CLOCK_PERIOD = 10;  // System clock period in time units
  
  // Signals
  reg sys_clock;
  reg reset;
  reg clk_ph2_enable;
  reg [7:0] ADL_in;
  reg [7:0] ADH_in;
  reg INC_en;
  reg PCL_in_enable;
  reg PCH_in_enable;
  reg ADL_in_en;
  reg ADH_in_en;
  wire [7:0] PCL_out;
  wire [7:0] PCH_out;
  
  // Instantiate the module under test
  program_counter dut (
    .sys_clock(sys_clock),
    .reset(reset),
    .clk_ph2_enable(clk_ph2_enable),
    .ADL_in(ADL_in),
    .ADH_in(ADH_in),
    .INC_en(INC_en),
    .PCL_in_enable(PCL_in_enable),
    .PCH_in_enable(PCH_in_enable),
    .ADL_in_en(ADL_in_en),
    .ADH_in_en(ADH_in_en),
    .PCL_out(PCL_out),
    .PCH_out(PCH_out)
  );
  
  // Clock generation
  always #((SYS_CLOCK_PERIOD / 2)) sys_clock = ~sys_clock;
  
  // Test stimuli
  initial begin
    sys_clock = 0;
	 
    // Initialize inputs
    reset = 1;
    clk_ph2_enable = 0;
    ADL_in = 8'h00;
    ADH_in = 8'h00;
    INC_en = 0;
    PCL_in_enable = 0;
    PCH_in_enable = 0;
    ADL_in_en = 0;
    ADH_in_en = 0;
    
    // Wait for a few clock cycles
    #10;
    
    // Release reset
    reset = 0;
    
    // Test case 1: Increment PC
    INC_en = 1;
    PCL_in_enable = 0;
    PCH_in_enable = 0;
    ADL_in_en = 0;
    ADH_in_en = 0;
    
    // Check PC output after each clock cycle
    repeat(5) begin
      #SYS_CLOCK_PERIOD;
      $display("PC = %h", {PCH_out, PCL_out});
    end
    
    // Test case 2: Load new value from address bus
    INC_en = 0;
    PCL_in_enable = 0;
    PCH_in_enable = 0;
    ADL_in_en = 1;
    ADH_in_en = 1;
    ADL_in = 8'h55;
    ADH_in = 8'hAA;
    
    // Check PC output after each clock cycle
    repeat(5) begin
      #SYS_CLOCK_PERIOD;
      $display("PC = %h", {PCH_out, PCL_out});
    end
    
    // Test case 3: Use current PC
    INC_en = 0;
    PCL_in_enable = 1;
    PCH_in_enable = 1;
    ADL_in_en = 0;
    ADH_in_en = 0;
    
    // Check PC output after each clock cycle
    repeat(5) begin
      #SYS_CLOCK_PERIOD;
      $display("PC = %h", {PCH_out, PCL_out});
    end
    
    // End simulation
    $finish;
  end
  
endmodule