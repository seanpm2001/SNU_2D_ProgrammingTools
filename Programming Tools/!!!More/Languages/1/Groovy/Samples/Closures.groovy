list = [1, 2, 3, 4, 5, 6, 7, 8, 9]

/* 
 * Non-zero numbers are coerced to true, so when it % 2 == 0 (even), it is false.
 * The type of the implicit "it" parameter can be inferred as an Integer by the IDE.
 * It could also be written as:
 * list.findAll { Integer i -> i % 2 }
 * list.findAll { i -> i % 2 }
 */
def odds = list.findAll { it % 2 }

assert odds == [1, 3, 5, 7, 9]

