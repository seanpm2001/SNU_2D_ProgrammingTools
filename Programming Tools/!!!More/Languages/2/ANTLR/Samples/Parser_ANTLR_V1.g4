TextReader reader;
// (...) Fill TextReader with character
SumLexer lexer = new SumLexer(reader);
SumParser parser = new SumParser(lexer);

parser.statement();
