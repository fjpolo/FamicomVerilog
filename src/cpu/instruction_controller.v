module instruction_controller(
										 input sys_clock, rst,	         // Main system clock and reset
										 input clk_phase_1,		         // clock phase 1
										 input [7:0] PD_register,		 // pre-decode register
										 input increment_cycle_counter,  // increment cycle counter lines
										 input reset_cycle_counter,      // reset cycle counter lines
										 input skip_cycle_counter,       // skip cycle counter lines
										 input interrupt_flag,           // perform interrupt
										 output reg [7:0] IR_register,   // instruction register
										 output reg [2:0] cycle,         // current instruction cycle
										 output [2:0] next_cycle         // next instruction cycle
										);
    
// Signal declarations:
wire [7:0] opcode;      				// Opcode to put into instruction register
    
// Decide what the next cycle count should be:
assign next_cycle = (reset_cycle_counter == 1) ? 3'd0                // if reset_cycle_counter, reset count to 0
                  : (increment_cycle_counter == 1) ? cycle + 3'd1    // else, if increment_cycle_counter, increment count
                  : (skip_cycle_counter == 1) ? cycle + 3'd2      	// else, if skip_cycle_counter, increment count twice
                  : cycle;                       							// else, don't change count
    
// Decide what gets loaded into the instruction register (change only on T1 cycle):
assign opcode = (next_cycle == 1) ? (interrupt_flag ? 8'd0 : PD_register)   // on next T1, load new opcode or BRK (0) if doing an interrupt
                                  : IR_register;                            // if not T1 cycle, keep last opcode
    
// Latch new values on ph1:
always @(posedge sys_clock) begin

	if (rst == 0) begin
	    cycle <= 0;		               // Reset cycle counter to 0
	    IR_register <= 0;		        	// Reset IR_register - starts out in BRK to start reset routine
	end
	else if (clk_phase_1) begin
	    cycle <= next_cycle;            // Latch cycle    
       IR_register <= opcode;      		// Latch opcode
	end
    
end
    
endmodule