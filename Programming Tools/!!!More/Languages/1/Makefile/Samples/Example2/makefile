CFLAGS ?= -g

all: helloworld

helloworld: helloworld.o
	# Commands start with TAB not spaces
	$(CC) $(LDFLAGS) -o $@ $^

helloworld.o: helloworld.c
	$(CC) $(CFLAGS) -c -o $@ $<

clean: FRC
	$(RM) helloworld helloworld.o

# This pseudo target causes all targets that depend on FRC
# to be remade even in case a file with the name of the target exists.
# This works with any make implementation under the assumption that
# there is no file FRC in the current directory.
FRC:
