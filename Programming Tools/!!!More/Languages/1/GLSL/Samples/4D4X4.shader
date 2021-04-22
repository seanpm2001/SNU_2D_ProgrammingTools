mat3 matrix;
vec4 direction; // 4th component is 0
vec4 transformed_direction = vec4(matrix * vec3(direction), 0.0);
