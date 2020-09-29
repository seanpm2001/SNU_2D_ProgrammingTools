initial forever // Start at time 0 and repeat the begin/end forever
 begin
   clk = 0; // Set clk to 0
   #1; // Wait for 1 time unit
   clk = 1; // Set clk to 1
   #1; // Wait 1 time unit
 end
