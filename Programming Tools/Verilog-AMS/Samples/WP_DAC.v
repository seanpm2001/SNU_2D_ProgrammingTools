`include "constants.vams"
`include "disciplines.vams"
// Simple DAC model
module dac_simple(aout, clk, din, vref);
	
	// Parameters
	parameter integer bits = 4 from [1:24];
	parameter integer td = 1n from[0:inf);  // Processing delay of the DAC
	
	// Define input/output
	input clk, vref;
	input [bits-1:0] din;
	output aout;
		
	//Define port types
	logic clk;
	logic [bits-1:0] din;
	electrical  aout, vref;
	
	// Internal variables
	real aout_new, ref;
	integer i;
	
	// Change signal in the analog part
	analog begin
		@(posedge clk) begin // Change output only for rising clock edge	
			
			aout_new = 0;
			ref = V(vref);
			
			for(i=0; i<bits; i=i+1) begin
				ref = ref/2;
				aout_new = aout_new + ref * din[i];
			end
		end	
		V(aout) <+ transition(aout_new, td, 5n); // Get a smoother transition when output level changes
	end
endmodule

