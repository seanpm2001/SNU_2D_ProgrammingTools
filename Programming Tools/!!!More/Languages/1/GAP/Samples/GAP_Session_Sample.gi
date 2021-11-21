gap> G:=SmallGroup(8,1); # Set G to be a group of order 8.
<pc group of size 8 with 3 generators>
gap> i:=IsomorphismPermGroup(G); # Find an isomorphism from G to a group of permutations.
<action isomorphism>
gap> Image(i,G); # The image of G under I - these are the generators of im G.
Group([ (1,5,3,7,2,6,4,8), (1,3,2,4)(5,7,6,8), (1,2)(3,4)(5,6)(7,8) ])
gap> Elements(Image(i,G)); # All the elements of im G.
[ (), (1,2)(3,4)(5,6)(7,8), (1,3,2,4)(5,7,6,8), (1,4,2,3)(5,8,6,7), 
   (1,5,3,7,2,6,4,8), (1,6,3,8,2,5,4,7), (1,7,4,5,2,8,3,6), (1,8,4,6,2,7,3,5) ]
