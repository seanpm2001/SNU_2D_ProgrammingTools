1// Overloading '+' operator using an extension function
2operator fun Point.plus(other: Point): Point {
3    return Point(x + other.x, y + other.y)
4}
5
6>>> val p1 = Point(10, 20)
7>>> val p2 = Point(30, 40)
8>>> println(p1 + p2)
9Point(x=40, y=60)

