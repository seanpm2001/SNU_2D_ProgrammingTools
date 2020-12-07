BEGIN {
    FS="[^a-zA-Z]+"
}
{
    for (i=1; i<=NF; i++)
        words[tolower($i)]++
}
END {
    for (i in words)
        print i, words[i]
}
