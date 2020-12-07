{
    words += NF
    chars += length + 1 # add one to account for the newline character at the end of each record (line)
}
END { print NR, words, chars }
