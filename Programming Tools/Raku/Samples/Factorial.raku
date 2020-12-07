# Using recursion (with `if\else` construct)
sub fact( UInt $n --> UInt ) {
    if $n == 0 { 1 }
    else       { $n * fact($n-1) }
}

# Using recursion (with `if` as statement modifier)
sub fact( UInt $n --> UInt ) {
    return 1 if $n == 0;
    return $n * fact($n-1);
}

# Using recursion (with `when` construct)
sub fact( UInt $n --> UInt ) {
    when $n == 0 { 1 }
    default      { $n * fact($n-1) }
}

# Using the ternary operator
sub fact( UInt $n --> UInt ) {
    $n == 0 ?? 1 !! $n * fact($n-1)
}

# Using multiple dispatch
multi fact(0) { 1 }
multi fact( UInt $n --> UInt ) {
    $n * fact($n - 1)
}

# Using the reduction metaoperator
multi fact( UInt $n --> UInt ) {
    [*] 1..$n
}

# Creating a factorial operator and using the reduction metaoperator
sub postfix:<!>( UInt $n --> UInt ) { [*] 1..$n }

# Using `state` declarator to create a memoized factorial
sub fact( UInt $n --> UInt ) {
    state %known = 0 => 1;
    return %known{$n} if %known{$n}:exists;
    %known{$n} = $n * fact($n-1);
    return %known{$n};
}
