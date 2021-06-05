PACKAGE	 = package
VERSION	 = ` date "+%Y.%m%d%" `
RELEASE_DIR  = ..
RELEASE_FILE = $(PACKAGE)-$(VERSION)

# Notice that the variable LOGNAME comes from the environment in
# POSIX shells.
#
# target: all - Default target. Does nothing.
all:
	echo "Hello $(LOGNAME), nothing to do by default"
		# sometimes: echo "Hello ${LOGNAME}, nothing to do by default"
	echo "Try 'make help'"

# target: help - Display callable targets.
help:
	egrep "^# target:" [Mm]akefile

# target: list - List source files
list:
	# Won't work. Each command is in separate shell
	cd src
	ls

	# Correct, continuation of the same shell
	cd src; \
	ls

# target: dist - Make a release.
dist:
	tar -cf  $(RELEASE_DIR)/$(RELEASE_FILE) && \
	gzip -9  $(RELEASE_DIR)/$(RELEASE_FILE).tar

