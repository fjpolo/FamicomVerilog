/*
 *  Here's a high-level overview of how you can implement an ALU module in Verilog:
 *
 *      - Determine Supported Operations: Identify the arithmetic and logic operations that 
 *      need to be supported by your ALU. This typically includes operations like addition, 
 *      subtraction, bitwise AND, bitwise OR, bitwise XOR, shifting, and comparison operations.
 *      
 *      - Define Inputs and Outputs: Determine the inputs and outputs of your ALU module. 
 *      Inputs typically include the operands for the arithmetic or logic operation, control 
 *      signals for selecting the operation, and any additional flags or status signals that 
 *      need to be updated. Outputs include the resultult of the operation and any updated flags or 
 *      status signals.
 *      
 *      - Implement the Operations: Write the logic for each supported operation inside the ALU 
 *      module. This can involve using conditional statements (such as case or if-else) to select 
 *      the appropriate operation based on the control signals. Implement the necessary arithmetic 
 *      and logic operations using Verilog operators and built-in functions.
 *      
 *      - Update Flags and Status Signals: If your CPU architecture includes flags or status signals 
 *      (e.g., carry flag, zero flag, overflow flag), update these signals based on the resultult of the
 *      operation. The flags are typically set or cleared based on specific conditions, such as carry 
 *      or overflow.
 *      
 *      - Test and Verify: Test your ALU implementation with various test cases to ensure that each 
 *      operation produces the correct resultults and updates the flags or status signals accurately. 
 *      Verify the correctness of the ALU by comparing the outputs with the expected values.
 *      
 *  It's important to consider factors such as data widths, handling of overflow and carry operations, and 
 * any specific requirements of your CPU architecture when implementing the ALU.
*/

// alu
module alu(  
    input wire SUM_enable,      // Operation control
    input wire AND_enable, 
    input wire EOR_enable, 
    input wire OR_enable, 
    input wire SR_enable, 
    input wire INV_enable, 
    input wire ROR_enable, 
    input wire [7:0] A_in,      // Data input: A
    input wire [7:0] B_in, 	  // Data input: B
    input wire carry_in, 		  // Carry in
    output reg [7:0] result,	  // Operation resultult
    output reg carry_out, 		  // Carry out
    output wire overflow_out	  // Overflow out
    );
	
    // Declare signals:
    wire [7:0] B_int;
	 
    // Select inverted or non-inverted B input:
    assign B_int = INV_enable ? ~B_in : B_in;
    
    // Perform requested operation:
    always @(*) begin
	 
	// Defaults:
	result = 0;
	carry_out = 0;
		
	// Operations:
   if (SUM_enable)
		{carry_out, result} = A_in + B_int + carry_in;	   // add with carry-in, carry-out
	else if (AND_enable)
		result = A_in & B_in;										// and
	else if (EOR_enable)
		result = A_in ^ B_in;										// xor
	else if (OR_enable)
		result = A_in | B_in;	    								// or
	else if (SR_enable)
		{result, carry_out} = {A_in,1'd0} >> 1;	    		// shift right with carry-out
	else if (ROR_enable)
		{result, carry_out} = {carry_in,A_in,1'd0} >> 1;	// shift right with carry-in, carry-out
		
    end
	
    // Set overflow flag (set if both inputs are same sign, but output is a different sign):
    assign overflow_out = (A_in[7] && B_int[7] && (!result[7])) || ((!A_in[7]) && (!B_int[7]) && result[7]);
	 
endmodule