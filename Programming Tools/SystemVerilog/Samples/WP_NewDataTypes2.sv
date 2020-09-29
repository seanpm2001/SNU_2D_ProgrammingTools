int cmdline_elements; // # elements for dynamic array
int da[];             // dynamic array
int ai[int];          // associative array, indexed by int
int as[string];       // associative array, indexed by string
int qa[$];            // queue, indexed as an array, or by built-in methods

initial begin
    cmdline_elements = 16;
    da = new[ cmdline_elements ]; // Allocate array with 16 elements
end
