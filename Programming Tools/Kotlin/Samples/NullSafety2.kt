// returns null if...
// - foo() returns null,
// - or if foo() is non-null, but bar() returns null,
// - or if foo() and bar() are non-null, but baz() returns null.
// vice versa, return value is non-null if and only if foo(), bar() and baz() are non-null
foo()?.bar()?.baz()
