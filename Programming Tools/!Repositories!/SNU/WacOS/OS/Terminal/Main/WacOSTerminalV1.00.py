# Start of script
"""
WacOS Python terminal Main
"""
# Integers
loop1 = int(1)
x = int(0)
y = int(0)
z = int(0)
# t = int(timecommand)
runTime = int(0)
# Strings
sudoPasswordMain = str("system64")
# String logs definitions
def startupMessage():
	print ("WacOS Python Terminal")
def inputPointer():
	wptermInput = str(input(">>"))
def versionHistoryList():
	print ("WacOS Python Terminal - Version history")
	print ("Version 1.00 - November 6th 2019")
	print ("Version 1.01 - Coming soon")
	noMore = input("You have reached the end of the version history log. Press [ENTER] key to quit")
def updateLog():
	print ("WacOS Update log")
	print ("Version 1 - November 6th 2019")
	print ("I have started to develop the basic foundation for the WacOS python terminal. This terminal will be separate from other terminals, and will be exclusive to WacOS libraries and the main system")
	print ("This terminal is currently written in Python 3.7.2. I am not going to go too in-depth with it, as it is partly a side project")
	print ("Size: 02,.629 bytes")
	print ("Line count: 0,.079")
	print ("Encoding: UTF-8")
	print ("Indent: UNIX (LF)")
	noMore = input("You have reached the end of the update log. Press [ENTER] key to quit")
# Command definitions
def kernelPanic001():
	print ("Kernel panic command")
	confirm1 = str(input("Are you sure you want to cause a test kernel panic? y/n"))
	confirm1 = confirm1.upper()
	if (confirm1 == "Y"):
		confirmSudo = str(input("Enter the sudo password for @user: "))
		if (confirmSudo == sudoPasswordMain):
			print ("Activating kernel panic")
			print ("Failed to load kernel panic - command instruction data not found")
			#kpanic script here
def helpCommand():
	print ("Help command")
	print ("Commands start with a .")
	print ("Command list")
	print (".updateLog")
	print (".kernelPanic")
	print (".versionHistory")
	print (".help")
''' Terminal start '''
print (startupMessage())
print (helpCommand())
print ("Terminal version: 1.00 (November 6th 2019 build)")
while (loop1 == loop1):
	#print (inputPointer())
	wptermInput = str(input(">>"))
	curInput = str(wptermInput)
	if (curInput == ".updateLog"):
		print (updateLog())
	if (curInput == ".versionHistory"):
		print (versionHistoryList())
	if (curInput == ".kernelPanic"):
		print (kernelPanic001())
	if (curInput == ".help"):
		print (helpCommand())
	else:
		print ("Invalid syntax. Type .help for command help")
print ("Pointer out of range")
quit1 = input("Press [ENTER] key to exit the terminal")
# End of file
''' Current issues:
Not enough commands
Kernel panic command not supported
"None" type at end of def output
'''
# End of script