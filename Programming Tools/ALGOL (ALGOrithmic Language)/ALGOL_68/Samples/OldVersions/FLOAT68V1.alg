floating point algol68 test:
(
  real a,b,c,d;
   
  # printf - sends output to the file stand out. #
  # printf($p$); – selects a new page #
  printf(($pg$,"Enter d:"));  
  read(d);
   
  for step from 0 while a:=step*d; a <= 2*pi do
    printf($l$);  # $l$ - selects a new line. #
    b := sin(a);
    c := cos(a);
    printf(($z-d.6d$,a,b,c))  # formats output with 1 digit before and 6 after the decimal point. #
  od
)
