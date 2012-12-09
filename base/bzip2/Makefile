.PHONY: all build install clean

PREFIX=/usr
DESTDIR=

all: build

build: configure
	make -C bzip2-1.0.6 -f Makefile-libbz2_so
	make -C bzip2-1.0.6 bzip2 bzip2recover libbz2.a

configure: prepare
	@touch configure

prepare: bzip2-1.0.6.tar.gz
	tar xzf bzip2-1.0.6.tar.gz
	@mkdir build
	@touch prepare

bzip2-1.0.6.tar.gz:
	wget http://bzip.org/1.0.6/bzip2-1.0.6.tar.gz

install: build
	install -dm755 $(DESTDIR)/usr/{bin,lib,include,share/man/man1}

	install -m755 bzip2-1.0.6/bzip2-shared $(DESTDIR)/usr/bin/bzip2
	install -m755 bzip2-1.0.6/bzip2recover bzip2-1.0.6/bzdiff bzip2-1.0.6/bzgrep bzip2-1.0.6/bzmore $(DESTDIR)/usr/bin
	ln -sf bzip2 $(DESTDIR)/usr/bin/bunzip2
	ln -sf bzip2 $(DESTDIR)/usr/bin/bzcat

	install -m755 bzip2-1.0.6/libbz2.so.1.0.6 $(DESTDIR)/usr/lib
	ln -s libbz2.so.1.0.6 $(DESTDIR)/usr/lib/libbz2.so
	ln -s libbz2.so.1.0.6 $(DESTDIR)/usr/lib/libbz2.so.1
	ln -s libbz2.so.1.0.6 $(DESTDIR)/usr/lib/libbz2.so.1.0
	install -m644 bzip2-1.0.6/libbz2.a ${DESTDIR}/usr/lib/libbz2.a

	install -m644 bzip2-1.0.6/bzlib.h $(DESTDIR)/usr/include/

	install -m644 bzip2-1.0.6/bzip2.1 $(DESTDIR)/usr/share/man/man1/
	ln -sf bzip2.1 $(DESTDIR)/usr/share/man/man1/bunzip2.1
	ln -sf bzip2.1 $(DESTDIR)/usr/share/man/man1/bzcat.1
	ln -sf bzip2.1 $(DESTDIR)/usr/share/man/man1/bzip2recover.1

clean:
	-rm prepare
	-rm configure
	-rm bzip2-1.0.6.tar.gz
	-rm -r build/
	-rm -r bzip2-1.0.6/

