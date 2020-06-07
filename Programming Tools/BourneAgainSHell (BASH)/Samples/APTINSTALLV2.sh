# Start of script
print ("----------------------------------------------------------------------------------------------------");
print ("APT-INSTALL TEST");
print ("For UNIX Bourne Again SHell (BASH)");
print ("-----");
print("This script installs some programs on your OS of choice with Super User permissions");
print("Recommended to use in a Virtual Machine, or if you want to install these on your Host PC, run it");
# Start of installer section
print ("-----");
# Debian
sudo apt-install("Mozilla_Firefox.deb"); # Installs Mozilla Firefox (Debian)
sudo apt-install("NotepadPlusPlus.deb"); # Installs Notepad++ (Debian)
# sudo apt-install python3-pip
sudo apt-get install python3-pip # Installs Python 3 (Debian)
sudo pip3 install MODULE_NAME # Installs Python 3 (Debian)
# Fedora/Red Hat
sudo apt-get install python3-pip # Installs Python 3 (Fedora 13 and up)
sudo pip3 install MODULE_NAME # Installs Python 3 (Fedora 13 and up)
sudo apt-install(""); # Installs (Fedora/RedHat)
sudo apt-install(""); # Installs (Fedora/RedHat)
# Arch
sudo apt-install(""); # Installs x (Arch)
sudo apt-install(""); # Installs y (Arch)
# Gentoo
sudo apt-install(""); # Installs x (Gentoo)
sudo apt-install(""); # Installs y (Gentoo)
# SuSE
sudo apt-install(""); # Installs x (SuSE)
sudo apt-install(""); # Installs y (Suse)
# Other
sudo apt-install(""); # Installs x (Other)
sudo apt-install(""); # Installs y (Other)
# End of installer section
print ("-----");
print ("End of file");
print ("Press any key to quit"); #Input section here (future)
# Syntax is possibly not correct
print ("----------------------------------------------------------------------------------------------------");
# End of script
'''
File info 
File version: 2 (October 10th 2019)
First version: 1 (October 9th 2019)
Latest version: 2 (October 10th 2019)
File type: .sh (Bourne Again SHell script)
Size: 01,.974 bytes (01,.974 Kilobytes)
Line count: 00,.048
'''