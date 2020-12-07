my $squares = lazy gather for 0..Inf {
    take $_ * $_;
};
