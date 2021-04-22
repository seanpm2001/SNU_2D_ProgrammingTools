mat4 matrix; // upper, left 3x3 matrix is orthogonal; 
   // 4th row is (0,0,0,1) 
vec4 point; // 4th component is 1
vec4 point_transformed_with_inverse = vec4(vec3((point - matrix[3]) * matrix), 1.0);
