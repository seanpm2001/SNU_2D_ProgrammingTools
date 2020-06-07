# Start of script
# Duck typing in Python 3 (compatible with all versions of PY3
# From https://en.wikipedia.org/wiki/Duck_typing#Example
# Program terminal description
print ("Duck typing in Python 3")
print ("3 objects are used, duck, airplane and whale")
print ("Whale does not have the fly attribute.")
input1 = input("Press [ENTER] to see input")
# Class 1
class Duck: # Object: duck
	def fly(self):
		print("Duck flying")
# Class 2
class Airplane: # Object: airplane
	def fly(self):
		print("Airplane flying")
# Class 3
class Whale: # Object: Whale
	def swim(self):
		print("Whale swimming")
# Duck typing output (Whale is the error, as it doesn't contain the "fly" attribute)
# The processing starts here
for animal in Duck(), Airplane(), Whale():
	animal.fly()
# Divider
'''
Output
"""
Duck flying
Airplane flying
AttributeError: 'Whale' object has no attribute 'fly'
"""
'''
# Divider
"""
File info
File version: 1 (October 20th 2019)
First version: 1 (October 20th 2019)
File type: *.py (Python file)
Language: English/Python3
Line count: 0,.044
Character count: 01,.143
"""
# End of script