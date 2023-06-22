// ADL/H: Address low/high
// PCL/H: Program Counter low/high

module program_counter(
	input wire sys_clock, reset,         		// Main system clock and reset
   	input wire clk_ph2_enable,              	// Phase 2 clock enable
	input wire [7:0] ADL_in, ADH_in,	   		// Address Bus low & high bytes
	input wire INC_en, 		   					// Increment PC enable
	input wire PCL_in_enable, PCH_in_enable,	// Use current PC
	input wire ADL_in_en, ADH_in_en,	   		// Load new value into PC
	output wire [7:0] PCL_out, PCH_out   		// PC Bus output
   );
	

// Declare signals:
reg [7:0] PCL, PCH;				// PC register low & high bytes
reg [7:0] PCLS, PCHS;			// PC select register low & high bytes
reg PCLC;						// PC low-byte carry bit (to increment high-byte)
reg [7:0] PCL_inc, PCH_inc;		// Incremented PC

// Select PC source: previous PC or new value from Address Bus:
always @(*) begin
	
	if (PCL_in_enable)
		PCLS <= PCL;		// load previous PC register value
	else if (ADL_in_en)
		PCLS <= ADL_in;		// load address bus value
	else
		PCLS <= PCL;		// default: previous PC
		
	if (PCH_in_enable)
		PCHS <= PCH;		// load previous PC register value
	else if (ADH_in_en)
		PCHS <= ADH_in;		// load address bus value
	else
		PCHS <= PCH;		// default: previous PC
		
end

// Increment PC:
always @(*) begin

	{PCLC, PCL_inc} = PCLS + 1'd1;		// Increment low-byte with carry out
	PCH_inc = PCHS + PCLC;				// Increment high-byte with carry from PCL
	
end

// Latch PC on phase 2 clock:
always @(posedge sys_clock) begin
	
	if (reset == 0) begin			// initialize PC to zero (will be replaced)
		PCL <= 0;
		PCH <= 0;
	end
	else if (clk_ph2_enable) begin
		if (INC_en) begin			// if Increment enabled, latch incremented PC
			PCL <= PCL_inc;
			PCH <= PCH_inc;
		end
		else begin					// else, latch passed-through value
			PCL <= PCLS;
			PCH <= PCHS;
		end
	end
		
end

// Assign outputs:
assign PCL_out = PCL;
assign PCH_out = PCH;


endmodule