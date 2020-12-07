# Example for | ("any") Junction:
my $color = 'white';
unless $color eq 'white' | 'black' | 'gray' | 'grey' {
    die "Color printing not supported\n";
}

# Example for & ("all") Junction:
my $password = 'secret!123';
if $password ~~ /<:alpha>/ & /<:digit>/ & /<:punct>/ {
    say "Your password is reasonably secure";
}
