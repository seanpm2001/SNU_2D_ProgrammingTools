mat4 matrix_inverse;
vec4 normal;
vec4 transformed_normal = vec4(vec3(normal * matrix_inverse), 0.0);
