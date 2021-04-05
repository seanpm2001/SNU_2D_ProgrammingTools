model Circuit
   Capacitor C1(C=1e-4) "A Capacitor instance from the model above";
   Capacitor C2(C=1e-5) "A Capacitor instance from the model above";
     ...
equation
   connect(C1.pin_p, C2.pin_n);
   ...
end Circuit;
