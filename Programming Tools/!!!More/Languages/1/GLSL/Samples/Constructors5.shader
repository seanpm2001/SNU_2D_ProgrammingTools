mat3 m = mat3(
   1.1, 2.1, 3.1, // first column (not row!)
   1.2, 2.2, 3.2, // second column
   1.3, 2.3, 3.3  // third column
);
mat3 id = mat3(1.0); // puts 1.0 on the diagonal
                     // all other components are 0.0
vec3 column0 = vec3(0.0, 1.0, 0.0);
vec3 column1 = vec3(1.0, 0.0, 0.0);
vec3 column2 = vec3(0.0, 0.0, 1.0);
mat3 n = mat3(column0, column1, column2); // sets columns of matrix n
