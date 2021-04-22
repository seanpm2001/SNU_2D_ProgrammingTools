mat4 matrix;
vec3 direction;
vec3 transformed_direction = vec3(matrix * vec4(direction, 0.0));
