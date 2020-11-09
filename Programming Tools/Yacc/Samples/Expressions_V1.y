expr : expr '+' expr  { $$ = node('+', $1, $3); }

