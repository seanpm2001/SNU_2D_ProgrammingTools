// No need for the open keyword here, it’s already open by default
abstract class Animated {

    // This virtual function is already open by default as well
    abstract fun animate()
  
    open fun stopAnimating() { }

    fun animateTwice() { }
}
