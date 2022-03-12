// Common options, for example, the target language
options
{
 language = "CSharp";
}
// Followed by the parser 
class SumParser extends Parser;
options
{
  k = 1; // Parser Lookahead: 1 Token
}
// Definition of an expression
statement: INTEGER (PLUS^ INTEGER)*;
// Here is the Lexer
class SumLexer extends Lexer;
options
{
  k = 1; // Lexer Lookahead: 1 characters
}
PLUS: '+';
DIGIT: ('0'..'9');
INTEGER: (DIGIT)+;
