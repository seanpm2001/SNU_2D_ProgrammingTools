model FirstOrder
  parameter Real c=1 "Time constant";
  Real x (start=10) "An unknown";
equation
  der(x) = -c*x "A first order differential equation";
end FirstOrder;
