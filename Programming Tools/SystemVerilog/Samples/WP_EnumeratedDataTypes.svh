typedef enum logic [2:0] {
   RED, GREEN, BLUE, CYAN, MAGENTA, YELLOW
} color_t;

color_t   my_color = GREEN;
initial $display("The color is %s", my_color.name());

