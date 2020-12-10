// Example of class using primary constructor syntax
// (Only one constructor required for this class)
open class PowerUser : User (
    protected val nickname: String, 
    final override var isSubscribed: Boolean = true) 
    {
         ...
    }
