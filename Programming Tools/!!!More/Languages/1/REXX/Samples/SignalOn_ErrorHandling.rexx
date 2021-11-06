signal on halt;
do a = 1
	say a
	do 100000 /* a delay */
	end
end
halt:
say "The program was stopped by the user"
exit

