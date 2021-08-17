// We want to use the "Li white" threshold

userDefinedAutoThreshold = "Li";
//run("Auto Threshold", "method=" + userDefinedAutoThreshold + "white");   //does NOT work because the macro runs as "method=Liwhite"
run("Auto Threshold", "method=" + userDefinedAutoThreshold + " white");   //WORKS because including a space in " white" results in "method=Li white"
