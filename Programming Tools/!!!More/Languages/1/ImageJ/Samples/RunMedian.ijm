specifiedRadius = 3;
//run("Median...", "radius=specifiedRadius");  // BAD - will literally pass "specifiedRadius"
run("Median...", "radius=" + specifiedRadius); // GOOD - will correctly pass the radius variable value
