module Div20x (rst, clk, cet, cep, count, tc);
// TITLE 'Divide-by-20 Counter with enables'
// enable CEP is a clock enable only
// enable CET is a clock enable and
// enables the TC output
// a counter using the Verilog language

parameter size = 5;
parameter length = 20;

input rst; // These inputs/outputs represent
input clk; // connections to the module.
input cet;
input cep;

output [size-1:0] count;
output tc;

reg [size-1:0] count; // Signals assigned
                      // within an always
                      // (or initial)block
                      // must be of type reg

wire tc; // Other signals are of type wire

// The always statement below is a parallel
// execution statement that
// executes any time the signals
// rst or clk transition from low to high

always @ (posedge clk or posedge rst)
  if (rst) // This causes reset of the cntr
    count <= {size{1'b0}};
  else
  if (cet && cep) // Enables both  true
    begin
      if (count == length-1)
        count <= {size{1'b0}};
      else
        count <= count + 1'b1;
    end

// the value of tc is continuously assigned
// the value of the expression
assign tc = (cet && (count == length-1));

endmodule
