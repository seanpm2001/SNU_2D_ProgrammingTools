 1// open on the class means this class will allow derived classes
 2open class MegaButton  {
 3
 4    // no-open on a function means that 
 5    //    polymorphic behavior disabled if function overridden in derived class
 6    fun disable() { ... }
 7
 8    // open on a function means that
 9    //    polymorphic behavior allowed if function is overridden in derived class
10    open fun animate() { ... }
11}
12
13class GigaButton: MegaButton {
14
15    // Explicit use of override keyword required to override a function in derived class
16    override fun animate() { println("Giga Click!") } 
17}
