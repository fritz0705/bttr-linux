.PHONY: all fetch unpack patch prepare configure build install clean distclean

PREFIX?=/usr
DESTDIR?=
FETCH?=curl -L --retry 3
VERSION?=050325

all: build

fetch: ex-$(VERSION).tar.bz2
unpack: ex-$(VERSION)/
patch: unpack
prepare: patch
configure: prepare

build: configure
	$(MAKE) -C ex-$(VERSION) PREFIX=$(PREFIX) LIBEXECDIR=$(PREFIX)/lib/ex TERMLIB=ncurses 'FEATURES=-DCHDIR -DFASTTAG -DUCVISUAL -DMB -DBIT8'

install: build
	$(MAKE) -C ex-$(VERSION) PREFIX=$(PREFIX) LIBEXECDIR=$(PREFIX)/lib/ex INSTALL=install DESTDIR=$(DESTDIR) install

clean:
	$(RM) -r ex-$(VERSION)/

distclean: clean
	$(RM) ex-$(VERSION).tar.bz2

ex-$(VERSION).tar.bz2:
	$(FETCH) http://downloads.sourceforge.net/sourceforge/ex-vi/ex-$(VERSION).tar.bz2 > $@

ex-$(VERSION)/: ex-$(VERSION).tar.bz2
	tar xjf $<

