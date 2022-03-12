// A top-level higher-order function using block syntax (not associated with any user-created classes)
String process(String text, String transformString(String toChange)) {
    return transformString(text);
}

// A top-level function calling String.reverse in expression form.
String reverse(String text) => text.reversed;

// A function reference to String.reversed but mostly equivalent to the function above.
String(String) reverseFunctionReference = String.reversed;

// An example where the top-level function above is provided as an argument to the higher-order function above
String reversed1 = process("one", reverse);

// An example where an anonymous function - (text) => text+text - is provided to the higher-order function above. 
String reversed2 = process("one", (text) => text+text);

