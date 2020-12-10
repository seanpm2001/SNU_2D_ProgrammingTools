class User(val id: Int, val name: String, val address: String)
    
fun saveUserToDb(user: User) {
    fun validate(user: User, value: String, fieldName: String) {
        require(value.isNotEmpty()) { "Can't save user ${user.id}: empty $fieldName" }
    }
    
    validate(user, user.name, "Name") 
    validate(user, user.address, "Address")
        // Save user to the database 
    	// ...
}
