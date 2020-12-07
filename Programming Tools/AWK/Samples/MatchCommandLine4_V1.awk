BEGIN {
    pattern = ARGV[1]
    for (i = 1; i < ARGC; i++) # remove first argument
        ARGV[i] = ARGV[i + 1]
    ARGC--
    if (ARGC == 1) { # the pattern was the only thing, so force read from standard input (used by book)
        ARGC = 2
        ARGV[1] = "-"
    }
}
$0 ~ pattern { print FILENAME ":" $0 }
