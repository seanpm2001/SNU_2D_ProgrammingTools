         #ifdef VERTEX
 
         void main() 
         {
            gl_Position = gl_ModelViewProjectionMatrix 
            * (vec4(1.0, 0.1, 1.0, 1.0) * gl_Vertex);
         }
 
         #endif
