// Basic structure with an EXPLICIT feedback path
always @(posedge clk)
  if(gate)
    q <= d;
  else
    q <= q; // explicit feedback path

// The more common structure ASSUMES the feedback is present
// This is a safe assumption since this is how the
// hardware compiler will interpret it. This structure
// looks much like a latch. The differences are the
// '''@(posedge clk)''' and the non-blocking '''<='''
//
always @(posedge clk)
  if(gate)
    q <= d; // the "else" mux is "implied"

