model SignalVoltage 
  "Generic voltage source using the input signal as source voltage"
  Interfaces.PositivePin p;
  Interfaces.NegativePin n;
  Modelica.Blocks.Interfaces.RealInput v(unit="V") 
    "Voltage between pin p and n (= p.v - n.v) as input signal";
  SI.Current i "Current flowing from pin p to pin n";
equation 
  v = p.v - n.v;
  0 = p.i + n.i;
  i = p.i;
end SignalVoltage;

