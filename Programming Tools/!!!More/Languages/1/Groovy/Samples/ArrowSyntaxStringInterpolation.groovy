BigDecimal tax = 0.15
text = "The account shows currently a balance of ${->account - account*tax}"
tax = 0.10

// The tax value was changed AFTER declaration of the GString. The expression 
// variables are bound only when the expression must actually be evaluated:
assert text == "The account shows currently a balance of 9.000"

