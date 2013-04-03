.PHONY: all fetch unpack patch build install clean distclean

PREFIX?=/usr
DESTDIR?=
FETCH?=curl
VERSION?=2.3.1

all: build

fetch: nano-$(VERSION).tar.gz
unpack: nano-$(VERSION)/
patch: unpack
prepare: nano-$(VERSION)/
	mkdir build/
	@touch $@

configure: prepare
	cd build && ../nano-$(VERSION)/configure --prefix=$(PREFIX)
	@touch $@

build: configure
	$(MAKE) -C build

install: build
	$(MAKE) -C build install DESTDIR=$(DESTDIR)

clean:
	$(RM) prepare configure
	$(RM) -r build/
	$(RM) -r nano-$(VERSION)/

distclean: clean
	$(RM) nano-$(VERSION).tar.gz

nano-$(VERSION).tar.gz:
	$(FETCH) ftp://ftp.gnu.org/gnu/nano/nano-$(VERSION).tar.gz > $@

nano-$(VERSION)/: nano-$(VERSION).tar.gz
	tar xzf $<

