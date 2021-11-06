say digits() fuzz() form() /* => 9 0 SCIENTIFIC */
say 999999999+1 /* => 1.000000000E+9 */
numeric digits 10 /* only limited by available memory */
say 999999999+1 /* => 1000000000 */

say 0.9999999999=1 /* => 0 (false) */
numeric fuzz 3
say 0.99999999=1 /* => 1 (true) */
say 0.99999999==1 /* => 0 (false) */

say 100*123456789 /* => 1.23456789E+10 */
numeric form engineering
say 100*123456789 /* => 12.34567890E+9 */

say 53 // 7   /* => 4   (rest of division)*/
