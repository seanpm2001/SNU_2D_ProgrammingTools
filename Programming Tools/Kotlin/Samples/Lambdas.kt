// the following function takes a lambda, f, and executes f passing it the string, "lambda"
// note that (s: String) -> Unit indicates a lambda with a String parameter and Unit return type
fun executeLambda(f: (s: String) -> Unit) {
    f("lambda")
}
