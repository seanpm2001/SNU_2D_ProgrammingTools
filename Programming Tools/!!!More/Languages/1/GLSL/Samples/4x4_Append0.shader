mat4 matrix_inverse_transpose;
vec3 normal;
vec3 transformed_normal = vec3(matrix_inverse_transpose * vec4(normal, 0.0));
