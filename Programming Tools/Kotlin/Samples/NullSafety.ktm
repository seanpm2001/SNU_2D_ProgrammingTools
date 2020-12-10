1fun sayHello(maybe: String?, neverNull: Int) {
2    // use of elvis operator
3    val name: String = maybe ?: "stranger"
4    println("Hello $name")
5}
