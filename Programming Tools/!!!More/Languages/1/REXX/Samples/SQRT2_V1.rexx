numeric digits 50
n=2
r=1
do forever /* Newton's method */
rr=(n/r+r)/2
if r=rr then leave
r=rr
end
say "sqrt" n ' = ' r

