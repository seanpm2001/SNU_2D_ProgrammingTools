mat4 matrix; // upper, left 3x3 matrix is orthogonal
vec4 direction; // 4th component is 0
vec4 direction_transformed_with_inverse = vec4(vec3(direction * matrix), 0.0);
