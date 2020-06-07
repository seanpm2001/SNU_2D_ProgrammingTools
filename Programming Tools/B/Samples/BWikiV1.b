/* Start of file */
/* The following function will print a non-negative number, n, to
   the base b, where 2<=b<=10.  This routine uses the fact that
   in the ASCII character set, the digits 0 to 9 have sequential
   code values.  */
printn(n, b) {
        extrn putchar;
        auto a;
        if (a = n / b)        /* assignment, not test for equality */
                printn(a, b); /* recursive */
        putchar(n % b + '0');
}
/* The following program will calculate the constant e-2 to about
   4000 decimal digits, and print it 50 characters to the line in
   groups of 5 characters.  The method is simple output conversion
   of the expansion
     1/2! + 1/3! + ... = .111....
   where the bases of the digits are 2, 3, 4, . . . */
main() {
	extrn putchar, n, v;
	auto i, c, col, a;
	i = col = 0;
	while(i<n)
		v[i++] = 1;
	while(col<2*n) {
		a = n+1 ;
		c = i = 0;
		while (i<n) {
			c =+ v[i] *10;
			v[i++]  = c%a;
			c =/ a--;
		}
		putchar(c+'0');
		if(!(++col%5))
			putchar(col%50?' ': '*n');
	}
	putchar('*n*n');
}
v[2000];
n 2000;
/* File info
File type: .b (B Programming Language file)
Source(s): https://en.wikipedia.org/wiki/B_(programming_language)#Examples
Line count: 0,.050
Char count: 01,.414 bytes
Current version: 1 (October 13th 2019)
Latest version: 1 (October 13th 2019)
First version: 1 (October 13th 2019) 
*/
/* End of file */