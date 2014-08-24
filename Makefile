INSTALL = /usr/bin/install -c

# == Installation directories
prefix = ${DESTDIR}/usr
mandir = ${prefix}/share/man/man1
exec_prefix = ${prefix}
bindir = ${exec_prefix}/bin

all: histring

histring: histring.c getopt.c getopt1.c getopt.h
	$(CC) $(CFLAGS) $(CPPFLAGS) $(LDFLAGS) $@.c -o $@

clean:
	rm -f *.o *~ 

cleanall: clean
	rm -f histring

install:
	$(INSTALL) -m 755 -d $(bindir)
	$(INSTALL) -m 755 -d $(mandir)

	$(INSTALL) -m 755 -s histring $(bindir)
	$(INSTALL) -m 644 debian/histring.1 $(mandir)

