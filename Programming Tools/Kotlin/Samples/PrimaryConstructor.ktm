1// Example of class using primary constructor syntax
2// (Only one constructor required for this class)
3open class PowerUser : User (
4    protected val nickname: String, 
5    final override var isSubscribed: Boolean = true) 
6    {
7         ...
8    }
