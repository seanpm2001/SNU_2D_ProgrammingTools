interface intf;
  logic a;
  logic b;
  modport in (input a, output b);
  modport out (input b, output a); 
endinterface

module top;
  intf i ();
  u_a m1 (.i1(i.in));
  u_b m2 (.i2(i.out));
endmodule

module u_a (intf.in i1);
endmodule

module u_b (intf.out i2);
endmodule
