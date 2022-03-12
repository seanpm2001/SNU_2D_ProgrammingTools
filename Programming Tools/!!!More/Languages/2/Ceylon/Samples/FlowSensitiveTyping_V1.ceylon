shared void integerOrString(Integer|String input) {
    Integer added = input + 6; // illegal; the + operator is not defined on Integer|String

    if (is Integer input) {
        Integer added = input + 6; // legal; input is now known to be an Integer
        print("Got the integer ``input``");
    } else {
        print("Got the string '``input``'");
    }
}

