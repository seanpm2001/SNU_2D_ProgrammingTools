package MyStringExtensions

fun String.lastChar(): Char = get(length - 1)

// >>>
println("Kotlin".lastChar())
