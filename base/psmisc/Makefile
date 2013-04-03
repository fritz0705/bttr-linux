.PHONY: all fetch unpack patch build install clean distclean

PREFIX?=/usr
DESTDIR?=
VERSION?=22.20
FETCH?=curl -L

all: build

fetch: psmisc-$(VERSION).tar.gz
unpack: psmisc-$(VERSION)/
patch: unpack
prepare: psmisc-$(VERSION)/
	mkdir build/
	@touch $@

configure: prepare
	cd build && ../psmisc-$(VERSION)/configure --prefix=$(PREFIX)
	@touch $@

build: configure
	$(MAKE) -C build

install: build
	$(MAKE) -C build install DESTDIR=$(DESTDIR)

clean:
	$(RM) prepare configure
	$(RM) -r build/
	$(RM) -r psmisc-$(VERSION)/

distclean: clean
	$(RM) psmisc-$(VERSION).tar.gz

psmisc-$(VERSION).tar.gz:
	$(FETCH) http://sourceforge.net/projects/psmisc/files/psmisc/psmisc-$(VERSION).tar.gz > $@

psmisc-$(VERSION)/: psmisc-$(VERSION).tar.gz
	tar xzf $<

