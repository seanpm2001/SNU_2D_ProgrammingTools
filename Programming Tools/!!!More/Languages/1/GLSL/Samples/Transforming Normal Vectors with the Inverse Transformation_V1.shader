mat4 matrix_inverse;
vec3 normal;
vec3 transformed_normal = vec3(vec4(normal, 0.0) * matrix_inverse);
