mat2 m2x2 = mat2(
   1.1, 2.1, 
   1.2, 2.2
);
mat3 m3x3 = mat3(m2x2); // = mat3(
   // 1.1, 2.1, 0.0,   
   // 1.2, 2.2, 0.0,
   // 0.0, 0.0, 1.0)
mat2 mm2x2 = mat2(m3x3); // = m2x2
