all: helloworld

helloworld: helloworld.o
	$(CC) $(CFLAGS) $(LDFLAGS) -o $@ $^

clean: FRC
	$(RM) helloworld helloworld.o

# This is an explicit suffix rule. It may be omitted on systems
# that handle simple rules like this automatically.
.c.o:
	$(CC) $(CFLAGS) -c $<

FRC:
.SUFFIXES: .c
