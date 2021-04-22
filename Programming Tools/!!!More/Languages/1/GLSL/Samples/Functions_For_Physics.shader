float d = 1.0 - r * r * (1.0 - dot(n, i) * dot(n, i));
if (d < 0.0) return TYPE(0.0); // total internal reflection
return r * i - (r * dot(n, i) + sqrt(d)) * n;

