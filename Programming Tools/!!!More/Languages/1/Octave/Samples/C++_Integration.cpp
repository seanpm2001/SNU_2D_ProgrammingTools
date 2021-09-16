#include <octave/oct.h>
...
ColumnVector NumRands(2);
NumRands(0) = 10;
NumRands(1) = 1;
octave_value_list f_arg, f_ret;
f_arg(0) = octave_value(NumRands);
f_ret = feval("rand", f_arg, 1);
Matrix unis(f_ret(0).matrix_value());

