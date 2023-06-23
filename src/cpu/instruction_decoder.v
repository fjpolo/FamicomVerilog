module instruction_decoder(
    input sys_clock, rst,   // main system clock and reset    
    input clk_ph2,          // clock phase 2    
    input [2:0] cycle,      // current instruction cycle
    input [7:0] IR,         // instruction register
    output reg CTRL_SIG1    // output control signal(s)
    );

// Opcode definitions
localparam [7:0] opcode1 = 8'hxx;
localparam [7:0] opcode2 = 8'hyy;
localparam [7:0] opcode3 = 8'hzz;
	 
// Decode current opcode based on cycle:
always @(posedge sys_clock) begin

    if (rst == 0) begin
        // Reset control lines
        CTRL_SIG1 <= 0;
    end
    else if (clk_ph2) begin
        // Reset all control lines by default so we don't forget any
        CTRL_SIG1 <= 0;
        
        // Switch on cycle first, then opcode (will determine what happens on the NEXT cycle):
        case (cycle)
            0: begin
                case (IR)
                    opcode1, opcode2: begin
                        // set up CPU for cycle 1 operations
                        CTRL_SIG1 <= x;
                    end
                    opcode3: begin
                        // set up CPU for cycle 1 operations
                       CTRL_SIG1 <= x;
                    end
                endcase
            end
            1: begin
                case (IR)                     
                    opcode1, opcode2: begin
                        // set up CPU for cycle 2 operations
                        CTRL_SIG1 <= x;
                    end
                    opcode3: begin
                        // set up CPU for cycle 2 operations
                        CTRL_SIG1 <= x;
                    end                
                endcase
            end
        endcase

    end

end
endmodule