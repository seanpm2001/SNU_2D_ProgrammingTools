1fun main(args: Array) {
2    // create a data class object like any other class object
3    var book1 = Book("Kotlin Programming", 250)
4    println(book1)
5    // output: Book(name=Kotlin Programming, price=250)
6}
7     
8// data class with parameters and their optional default values
9data class Book(val name: String = "", val price: Int = 0)
