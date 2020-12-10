// Class is visible only to current module
internal open class TalkativeButton : Focusable {
    // method is only visible to current class 
    private   fun yell() = println("Hey!")

    // method is visible to current class and derived classes
    protected fun whisper() = println("Let's talk!")
}
