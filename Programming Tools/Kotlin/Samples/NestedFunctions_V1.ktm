 1class User(val id: Int, val name: String, val address: String)
 2    
 3fun saveUserToDb(user: User) {
 4    fun validate(user: User, value: String, fieldName: String) {
 5        require(value.isNotEmpty()) { "Can't save user ${user.id}: empty $fieldName" }
 6    }
 7    
 8    validate(user, user.name, "Name") 
 9    validate(user, user.address, "Address")
10    // Save user to the database 
11    ...
12}
