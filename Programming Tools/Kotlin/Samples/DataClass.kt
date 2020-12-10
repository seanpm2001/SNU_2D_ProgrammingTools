fun main(args: Array) {
    // create a data class object like any other class object
    var book1 = Book("Kotlin Programming", 250)
    println(book1)
    // output: Book(name=Kotlin Programming, price=250)
}
     
// data class with parameters and their optional default values
data class Book(val name: String = "", val price: Int = 0)
