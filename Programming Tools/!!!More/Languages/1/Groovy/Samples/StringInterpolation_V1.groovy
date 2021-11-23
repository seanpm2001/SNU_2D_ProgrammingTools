BigDecimal minus = 4.0
text = "The account shows currently a balance of ${account - minus}"
assert text == "The account shows currently a balance of 6.0"

// Without the brackets to isolate the expression, this would result:
text = "The account shows currently a balance of $account - minus"
assert text == "The account shows currently a balance of 10.0 - minus"
