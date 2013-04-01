.PHONY: all fetch unpack patch build install clean distclean

PREFIX=/usr
DESTDIR=
VERSION=451
FETCH=curl

all: build

fetch: less-$(VERSION).tar.gz
unpack: less-$(VERSION)/
patch: unpack
prepare: less-$(VERSION)/
	mkdir build/
	@touch $@

configure: prepare
	cd build && ../less-$(VERSION)/configure --prefix=$(PREFIX)
	@touch $@

build: configure
	$(MAKE) -C build

install: build
	$(MAKE) -C build install DESTDIR=$(DESTDIR)

clean:
	$(RM) prepare configure
	$(RM) -r build/
	$(RM) -r less-$(VERSION)/

distclean: clean
	$(RM) less-$(VERSION).tar.gz

less-$(VERSION).tar.gz:
	wget ftp://ftp.gnu.org/gnu/less/less-$(VERSION).tar.gz

less-$(VERSION)/: less-$(VERSION).tar.gz
	tar xzf $<

