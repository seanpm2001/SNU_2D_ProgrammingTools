within ;
model HeatingResistor_Comment "Heating resistor"
  extends Modelica.Icons.Example;

  Modelica.Electrical.Analog.Basic.HeatingResistor heatingResistor(
    R_ref=100,
    alpha=1e-3,   // taken from Meyer 2016 paper
    T_ref=293.15, // this is 20C
    i(start=0));
  Modelica.Electrical.Analog.Basic.Ground G;
  Modelica.Electrical.Analog.Sources.SineVoltage SineVoltage1(
    V=220,
    freqHz=1);
  Modelica.Thermal.HeatTransfer.Components.ThermalConductor thermalConductor(G=50);
  Modelica.Thermal.HeatTransfer.Celsius.FixedTemperature fixedTemperature(T=20);

equation
  connect(SineVoltage1.n, G.p);
  connect(heatingResistor.heatPort, thermalConductor.port_a);
  connect(SineVoltage1.p, heatingResistor.p);
  connect(G.p, heatingResistor.n);
  connect(thermalConductor.port_b, fixedTemperature.port);

end HeatingResistor_Comment;
