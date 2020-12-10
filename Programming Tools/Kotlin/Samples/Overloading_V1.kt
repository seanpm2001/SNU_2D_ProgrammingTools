// Overloading '+' operator using an extension function
operator fun Point.plus(other: Point): Point {
    return Point(x + other.x, y + other.y)
}

val p1 = Point(10, 20) // >>>
val p2 = Point(30, 40) // >>>
println(p1 + p2) // >>>
Point(x=40, y=60)

