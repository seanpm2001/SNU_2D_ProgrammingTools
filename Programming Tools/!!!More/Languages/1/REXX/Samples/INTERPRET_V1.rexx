/* demonstrate INTERPRET with square(4) => 16 */
X = 'square'
interpret 'say' X || '(4) ; exit'
SQUARE: return arg(1)**2

