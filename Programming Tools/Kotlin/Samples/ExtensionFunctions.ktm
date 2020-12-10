1package MyStringExtensions
2
3fun String.lastChar(): Char = get(length - 1)
4
5>>> println("Kotlin".lastChar())
