string s1 = "Hello";
string s2 = "world";
string p = ".?!";
string s3 = {s1, ", ", s2, p[2]}; // string concatenation
$display("[%d] %s", s3.len(), s3); // simulation will print: "[13] Hello, world!"
