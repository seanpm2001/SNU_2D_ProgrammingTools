...
reg a, b, c, d;
wire e;
...
always @(b or e)
  begin
    a = b & e;
    b = a | b;
    #5 c = b;
    d = #6 c ^ e;
  end
