print ("Exponentiation Test")
print ("Choose a calculation mode: ")
print ("-----")
exponchoice = int(input("Float (0) Int (1): "))
if (exponchoice == 0):
	exponentiationTest = float(input("Enter the first number: "))
	exponentiationTest2 = float(input("Enter the second number: "))
	answer = float(exponentiationTest ** exponentiationTest2)
	noMore = input("The exponentiation of " + str(exponentiationTest) + " and " + str(exponentiationTest2) + " is " + str(answer) + ".")
if (exponchoice == 1):
	exponentiationTest = int(input("Enter the first number: "))
	exponentiationTest2 = int(input("Enter the second number: "))
	answer = int(exponentiationTest ** exponentiationTest2)
	noMore = input("The exponentiation of " + str(exponentiationTest) + " and " + str(exponentiationTest2) + " is " + str(answer) + ".")
noMore = input("Thank you for testing this program! ")
print ("Goodbye")
# test of exponentiation in Python
# experimented 8:39 am on January 25th 2019