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
def sudoEnter():
	confirmSudo = str(input("Enter the sudo password for @user: "))
	if (confirmSudo == sudoPasswordMain):
		print ("Sudo password verified")
def sudoChange():
	print ("[Sudo change command]")
	confirmSudo = str(input("Enter the sudo password for @user: "))
	if (confirmSudo == sudoPasswordMain):
		print ("Sudo password verified")
		newSudo = str(input("Enter your new Sudo password: "))
		sudoPasswordMain == newSudo
		print ("Your SuperUser password has been changed.")
def versionHistoryList():
	print ("[WacOS Python Terminal - Version history command]")
	print ("Version 1.00 - November 6th 2019")
	print ("Version 1.01 - November 8th 2019")
	print ("Version 1.02 - Coming soon")
	noMore = input("You have reached the end of the version history log. Press [ENTER] key to quit")
def updateLog():
	print ("[WacOS Update log command]")
	print ("Version 1 - November 6th 2019")
	print ("I have started to develop the basic foundation for the WacOS python terminal. This terminal will be separate from other terminals, and will be exclusive to WacOS libraries and the main system")
	print ("This terminal is currently written in Python 3.7.2. I am not going to go too in-depth with it, as it is partly a side project")
	print ("Size: 02,.629 bytes")
	print ("Line count: 0,.079")
	print ("Encoding: UTF-8")
	print ("Indent: UNIX (LF)")
	print ("Version 2 - November 8th 2019")
	print ("I updated the terminal today, and included command legal statuses, and a documentation update. A new illegal command, system genocide was introduced, which deletes every file off your system. It is locked due to how dangerous it is")
	print ("Documentation has improved, and new commands were added.")
	print ("Size: 07,.260 bytes")
	print ("Line count: 0,.176")
	print ("Encoding: UTF-8")
	print ("Indent: UNIX (LF)")
	noMore = input("You have reached the end of the update log. Press [ENTER] key to quit")
# Command definitions
def kernelPanic001():
	print ("[Kernel panic command]")
	confirm1 = str(input("Are you sure you want to cause a test kernel panic? y/n"))
	confirm1 = confirm1.upper()
	if (confirm1 == "Y"):
		confirmSudo = str(input("Enter the sudo password for @user: "))
		if (confirmSudo == sudoPasswordMain):
			print ("Activating kernel panic")
			print ("Failed to load kernel panic - command instruction data not found")
			#kpanic script here
	if (confirm1 == "N"):
		print ("Kernel panic command has been stopped. Returning to terminal")
def helpCommand():
	print ("[Help command]")
	print ("Commands start with a .")
	print ("Command list")
	print (".updateLog - Shows the update log of the python terminal {Legal}")
	print (".kernelPanic - Emits a kernel panic on the system (WARNING: THIS WILL CRASH YOUR MACHINE, HOWEVER NOTHING THAT ISN'T OPEN WILL BE LOST) {Slightly legal}")
	print (".versionHistory - Shows the version history of the terminal {legal}")
	print (".help - Gives the user help on commands and terminal usage {legal}")
	print (".sysGenocide - Deletes all files from the system {illegal}")
	print (".fileGenocide - Deletes all of one type of file from the system {slighly legal}")
	print (".quit - Exits the terminal {legal}")
	print (".sudo - Get an example of entering the sudo password {slightly legal}")
	print (".sudoChange - Change your SuperUser password")
	more1 = input("Press [ENTER] key for more")
	print ("Terminal usage")
	print ("Command legal status")
	print ("Commands have 3 legal statuses")
	print ("{Legal} the command is safe and can be ran without special privileges.")
	print ("{Sligly legal} the command is not all the way safe, and may require admin privileges.")
	print ("{Illegal} the command is very dangerous, and cannot be performed.")
	print ("Other documentation unavailable")
	noMoreHelp1 = input("End of help\nPress [ENTER] key to continue")
def systemGenocideCommand():
	print ("[System Genocide command]")
	confirmGenocide1 = str(input("Delete all files from *? Y/N"))
	confirmGenocide1 == confirmGenocide1.upper()
	if (confirmGenocide1 == "Y"):
		print ("Illegal command")
		print ("Cannot delete all files from system")
		noMore = input("Press [ENTER] key to continue")
	if (confirmGenocide1 == "N"):
		print ("Illegal command cancelled")
def fileGenocideCommand():
	print ("[File Genocide command]")
	fileTypeSrch = str(input("Enter a file type to search for and delete (will delete all files with this extension"))
	fileTypeSrch == fileTypeSrch.upper()
	if (fileTypeSrch == ".dat"):
		print ("Cannot delete [.dat] files without permissions")
		print (sudoEnter())
		print ("Error, cannot delete .dat files")
	if (fileTypeSrch == ".png"):
		print ("Cannot delete [.png] files without permissions")
		print (sudoEnter())
		print ("Error, cannot delete .png files")
	if (fileTypeSrch == ".dmg"):
		print ("Cannot delete [.dmg] files without permissions")
		print (sudoEnter())
		print ("Error, cannot delete .dmg files")
	if (fileTypeSrch == ".ipa"):
		print ("Cannot delete [.ipa] files without permissions")
		print (sudoEnter())
		print ("Error, cannot delete .ipa files")
	if (fileTypeSrch == ".exe"):
		print ("Cannot delete [.exe] files without permissions")
		print (sudoEnter())
		print ("Error, cannot delete .exe files")
	if (fileTypeSrch == ".apk"):
		print ("Cannot delete [.apk] files without permissions")
		print (sudoEnter())
		print ("Error, cannot delete .apk files")
	if (fileTypeSrch == ".zip"):
		print ("Cannot delete [.zip] files without permissions")
		print (sudoEnter())
		print ("Error, cannot delete .zip files")
	else:
		print ("Cannot delete [" + str(fileTypeSrch) + " files without permissions")
		print (sudoEnter())
		print ("Error, cannot delete " + str(fileTypeSrch) + " files")
def terminalQuit():
	qu = int(6)
	it = float(0.4)
	now = int(it + qu)
	print (now / quit)
''' Terminal start '''
print (startupMessage())
print (helpCommand())
print ("Terminal version: 1.01 (November 8th 2019 build)")
while (loop1 == loop1):
	#print (inputPointer())
	wptermInput = str(input(">>"))
	curInput = str(wptermInput)
	if (curInput == ".updateLog"):
		print (updateLog())
	if (curInput == ".versionHistory"):
		print (versionHistoryList())
	if (curInput == ".kernelPanic"):
		print (kernelPanic001()) # Still in development
	if (curInput == ".help"):
		print (helpCommand())
	if (curInput == ".sysGenocide"):
		print (systemGenocideCommand()) # Still in development
	if (curInput == ".fileGenocide"):
		print (fileGenocideCommand()) # Still in development
	if (curInput == ".quit"):
		print (terminalQuit())
	if (curInput == ".sudo"):
		print (sudoEnter())
	if (curInput == ".sudoChange"): # Still in development
		print (sudoChange())
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