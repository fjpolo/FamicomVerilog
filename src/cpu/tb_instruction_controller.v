`timescale 1ns/1ns

module tb_instruction_controller;

  // Inputs
  reg sys_clock;
  reg rst;
  reg clk_phase_1;
  reg [7:0] PD_register;
  reg increment_cycle_counter;
  reg reset_cycle_counter;
  reg skip_cycle_counter;
  reg interrupt_flag;

  // Outputs
  wire [7:0] IR_register;
  wire [2:0] cycle;
  wire [2:0] next_cycle;

  // Instantiate the module under test
  instruction_controller dut (
    .sys_clock(sys_clock),
    .rst(rst),
    .clk_phase_1(clk_phase_1),
    .PD_register(PD_register),
    .increment_cycle_counter(increment_cycle_counter),
    .reset_cycle_counter(reset_cycle_counter),
    .skip_cycle_counter(skip_cycle_counter),
    .interrupt_flag(interrupt_flag),
    .IR_register(IR_register),
    .cycle(cycle),
    .next_cycle(next_cycle)
  );

  // Clock generation
  always #5 sys_clock = ~sys_clock;

  // Stimulus
  initial begin
    // Initialize inputs
    sys_clock = 0;
    rst = 1;
    clk_phase_1 = 0;
    PD_register = 0;
    increment_cycle_counter = 0;
    reset_cycle_counter = 0;
    skip_cycle_counter = 0;
    interrupt_flag = 0;

    // Apply reset
    #10 rst = 0;

    // Wait for a few clock cycles
    #20;

    // Case 1: normal cycle increment
    PD_register = 8'b11001100;
    increment_cycle_counter = 1;
    #10;

    // Case 2: reset counter
    PD_register = 0;
    increment_cycle_counter = 0;
    reset_cycle_counter = 1;
    #10;
    
    // Case 3: count cycle and then skip cycle
    reset_cycle_counter = 0;
    PD_register = 8'b11001100;
    increment_cycle_counter = 1;
    #10;
    increment_cycle_counter = 0;
    skip_cycle_counter = 1;
    #10;

    // Wait for a few clock cycles to observe the outputs
    #30;

    // Add more test cases as needed

    // End simulation
    $finish;
  end

endmodule