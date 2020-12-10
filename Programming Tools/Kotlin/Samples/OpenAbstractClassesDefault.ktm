 1// No need for the open keyword here, it’s already open by default
 2abstract class Animated {
 3
 4    // This virtual function is already open by default as well
 5    abstract fun animate()
 6  
 7    open fun stopAnimating() { }
 8
 9    fun animateTwice() { }
10}
