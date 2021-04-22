mat3 matrix_inverse_transpose;
vec3 normal;
vec3 transformed_normal = matrix_inverse_transpose * normal;
