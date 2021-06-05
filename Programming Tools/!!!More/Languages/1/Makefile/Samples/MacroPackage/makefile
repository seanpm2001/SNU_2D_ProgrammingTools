PACKAGE   = package
VERSION   = ` date +"%Y.%m%d" `
ARCHIVE   = $(PACKAGE)-$(VERSION)

dist:
	#  Notice that only now macros are expanded for shell to interpret:
	#    tar -cf package-`date +"%Y%m%d"`.tar

	tar -cf $(ARCHIVE).tar .
