.PHONY: all fetch unpack patch prepare configure build install clean distclean

PREFIX?=/usr
LIBDIR?=$(PREFIX)/lib
BINDIR?=$(PREFIX)/bin
DESTDIR?=
VERSION?=1.0.6
FETCH?=curl -L --retry 3

all: build

fetch: bzip2-$(VERSION).tar.gz
unpack: bzip2-$(VERSION)/
patch: unpack
prepare: bzip2-$(VERSION)/
configure: prepare

build: configure
	$(MAKE) -C bzip2-$(VERSION) -f Makefile-libbz2_so
	$(MAKE) -C bzip2-$(VERSION) bzip2 bzip2recover libbz2.a

install: build
	install -dm755 $(DESTDIR)/$(PREFIX)/{include,share/man/man1}
	install -dm755 $(DESTDIR)/$(LIBDIR) $(DESTDIR)/$(BINDIR)

	install -m755 bzip2-$(VERSION)/bzip2-shared $(DESTDIR)/$(BINDIR)/bzip2
	install -m755 bzip2-$(VERSION)/bzip2recover bzip2-$(VERSION)/bzdiff bzip2-$(VERSION)/bzgrep bzip2-$(VERSION)/bzmore $(DESTDIR)/$(BINDIR)
	ln -sf bzip2 $(DESTDIR)/$(BINDIR)/bunzip2
	ln -sf bzip2 $(DESTDIR)/$(BINDIR)/bzcat

	install -m755 bzip2-$(VERSION)/libbz2.so.$(VERSION) $(DESTDIR)/$(LIBDIR)
	ln -s libbz2.so.$(VERSION) $(DESTDIR)/$(LIBDIR)/libbz2.so
	ln -s libbz2.so.$(VERSION) $(DESTDIR)/$(LIBDIR)/libbz2.so.1
	ln -s libbz2.so.$(VERSION) $(DESTDIR)/$(LIBDIR)/libbz2.so.1.0
	install -m644 bzip2-$(VERSION)/libbz2.a ${DESTDIR}/$(LIBDIR)/libbz2.a

	install -m644 bzip2-$(VERSION)/bzlib.h $(DESTDIR)/$(PREFIX)/include/

	install -m644 bzip2-$(VERSION)/bzip2.1 $(DESTDIR)/$(PREFIX)/share/man/man1/
	ln -sf bzip2.1 $(DESTDIR)/$(PREFIX)/share/man/man1/bunzip2.1
	ln -sf bzip2.1 $(DESTDIR)/$(PREFIX)/share/man/man1/bzcat.1
	ln -sf bzip2.1 $(DESTDIR)/$(PREFIX)/share/man/man1/bzip2recover.1

clean:
	$(RM) -r build/
	$(RM) -r bzip2-$(VERSION)/

distclean: clean
	$(RM) -r bzip2-$(VERSION).tar.gz

bzip2-$(VERSION).tar.gz:
	$(FETCH) http://bzip.org/$(VERSION)/bzip2-$(VERSION).tar.gz > $@

bzip2-$(VERSION)/: bzip2-$(VERSION).tar.gz
	tar xzf $<

