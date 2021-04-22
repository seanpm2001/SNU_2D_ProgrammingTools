lowp vec4 color; // for colors, lowp is usually fine
mediump vec4 position; // for positions and texture coordinates, mediump is usually ok
highp vec4 astronomical_position; // for some positions and time, highp is necessary
//(precision of time measurement decreases over time
//and things get jumpy if they rely on absolute time since start of the application)
