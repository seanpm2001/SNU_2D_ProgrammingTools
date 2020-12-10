1// Class is visible only to current module
2internal open class TalkativeButton : Focusable {
3    // method is only visible to current class 
4    private   fun yell() = println("Hey!")
5
6    // method is visible to current class and derived classes
7    protected fun whisper() = println("Let's talk!")
8}
