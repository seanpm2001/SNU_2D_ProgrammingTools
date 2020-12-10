// open on the class means this class will allow derived classes
open class MegaButton  {

    // no-open on a function means that 
    //    polymorphic behavior disabled if function overridden in derived class
    fun disable() { ... }

    // open on a function means that
    //    polymorphic behavior allowed if function is overridden in derived class
    open fun animate() { ... }
}

class GigaButton: MegaButton {

    // Explicit use of override keyword required to override a function in derived class
    override fun animate() { println("Giga Click!") } 
}
