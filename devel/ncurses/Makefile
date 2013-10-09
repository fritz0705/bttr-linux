.PHONY: all fetch unpack patch build install clean distclean

PREFIX?=/usr
DESTDIR?=
VERSION?=5.9
FETCH?=curl -L --retry 3

all: build
	
fetch: ncurses-$(VERSION).tar.gz
unpack: ncurses-$(VERSION)/
patch: unpack
prepare: ncurses-$(VERSION)/
	mkdir build/
	@touch $@

configure: prepare
	cd build && ../ncurses-$(VERSION)/configure --prefix=$(PREFIX) \
		--with-termlib \
		--with-normal \
		--with-shared
	@touch $@

build: configure
	$(MAKE) -C build all

install: build
	$(MAKE) -C build DESTDIR=$(DESTDIR) install

clean:
	$(RM) prepare configure
	$(RM) -r build/
	$(RM) -r ncurses-$(VERSION)/

distclean: clean
	$(RM) ncurses-$(VERSION).tar.gz

ncurses-$(VERSION).tar.gz:
	$(FETCH) ftp://ftp.gnu.org/gnu/ncurses/ncurses-$(VERSION).tar.gz > $@

ncurses-$(VERSION)/: ncurses-$(VERSION).tar.gz
	tar xzf $<

.PHONY: Version
Version:
	@echo $(VERSION) > $@

