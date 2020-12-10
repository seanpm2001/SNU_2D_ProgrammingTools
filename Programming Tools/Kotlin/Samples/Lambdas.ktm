1// the following function takes a lambda, f, and executes f passing it the string, "lambda"
2// note that (s: String) -> Unit indicates a lambda with a String parameter and Unit return type
3fun executeLambda(f: (s: String) -> Unit) {
4    f("lambda")
5}
