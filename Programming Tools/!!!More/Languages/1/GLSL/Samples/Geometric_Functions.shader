vec3 cross(vec3 a, vec3 b) // = vec3(a[1] * b[2] - a[2] * b[1], 
   // a[2] * b[0] - a[0] * b[2], 
   // a[0] * b[1] - a[1] * b[0]) 
float dot(TYPE a, TYPE b) // = a[0] * b[0] + a[1] * b[1] + ... 
float length(TYPE a) // = sqrt(dot(a, a))
float distance(TYPE a, TYPE b) // = length(a - b)
TYPE normalize(TYPE a) // = a / length(a)
TYPE faceforward(TYPE n, TYPE i, TYPE nRef) 
   // returns n if dot(nRef, i) < 0, -n otherwise
TYPE reflect(TYPE i, TYPE n) // = i - 2. * dot(n, i) * n  
   // this computes the reflection of vector 'i' 
   // at a plane of normalized(!) normal vector 'n'
