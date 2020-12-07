# Raku code
my @array = 'a', 'b', 'c';
my $element = @array[1];    # $element equals 'b'
my @extract = @array[1];    # @extract equals ('b')
my @extract = @array[1, 2]; # @extract equals ('b', 'c')
