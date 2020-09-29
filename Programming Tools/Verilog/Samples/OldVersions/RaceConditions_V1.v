initial
  a = 0;

initial
  b = a;

initial
  begin
    #1;
    $display("Value a=%d Value of b=%d",a,b);
  end
