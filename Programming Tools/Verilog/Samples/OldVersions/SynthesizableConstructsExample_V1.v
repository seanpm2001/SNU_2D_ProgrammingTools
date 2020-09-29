// Mux examples — Three ways to do the same thing.

// The first example uses continuous assignment
wire out;
assign out = sel ? a : b;

// the second example uses a procedure
// to accomplish the same thing.

reg out;
always @(a or b or sel)
  begin
    case(sel)
      1'b0: out = b;
      1'b1: out = a;
    endcase
  end

// Finally — you can use if/else in a
// procedural structure.
reg out;
always @(a or b or sel)
  if (sel)
    out = a;
  else
    out = b;
