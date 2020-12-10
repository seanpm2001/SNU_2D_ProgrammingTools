 1fun main(args: Array<String>) {
 2    greet {
 3        to.place
 4    }.print()
 5}
 6
 7// Inline higher-order functions
 8inline fun greet(s: () -> String) : String = greeting andAnother s()
 9
10// Infix functions, extensions, type inference, nullable types, 
11// lambda expressions, labeled this, Elvis operator (?:)
12infix fun String.andAnother(other : Any?) = buildString() 
13{ 
14    append(this@andAnother); append(" "); append(other ?: "") 
15}
16
17// Immutable types, delegated properties, lazy initialization, string templates
18val greeting by lazy { val doubleEl: String = "ll"; "he${doubleEl}o" }
19
20// Sealed classes, companion objects
21sealed class to { companion object { val place = "world"} }
22
23// Extensions, Unit
24fun String.print() = println(this)
