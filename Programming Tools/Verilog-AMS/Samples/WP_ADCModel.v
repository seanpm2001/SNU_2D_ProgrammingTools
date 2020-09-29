`include "constants.vams"
`include "disciplines.vams"
// Simple ADC model
module adc_simple(clk, dout, vref, vin);
	
	// Parameters
	parameter integer bits = 4 from[1:24]; // Number of bits
	parameter integer td = 1 from[0:inf);  // Processing delay of the ADC
	
	// Define input/output
	input clk, vin, vref;
	output [bits-1:0] dout;
	
	//Define port types
	electrical vref, vin;
	logic clk;
	reg [bits-1:0] dout;
	
	// Internal variables	
	real ref, sample;
	integer i;
	
	
	initial begin
		dout = 0;
	end

	// Perform sampling in the digital blocks for rising clock edge
	always @(posedge clk) begin
		
		sample = V(vin);
		ref = V(vref);
			
		for(i=0; i<bits; i=i+1) begin
			
			ref = ref/2;
				
			if(sample > ref) begin
				dout[i] <= #(td) 1;
				sample = sample - ref;
			end
			else
				dout[i] <= #(td) 0;
		end
	end
endmodule
