// Transparent latch example

reg latch_out;
always @(gate or din)
 if(gate)
   latch_out = din; // Pass through state
   // Note that the else isn't required here. The variable
   // latch_out will follow the value of din while gate is
   // high. When gate goes low, latch_out will remain constant.
