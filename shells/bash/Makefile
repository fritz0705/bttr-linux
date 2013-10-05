.PHONY: all fetch unpack patch build install clean distclean

PREFIX?=/usr
DESTDIR?=
ifeq ($(PREFIX),/usr)
	BINDIR?=/bin
else
	BINDIR?=$(PREFIX)/bin
endif
VERSION?=4.2
FETCH?=curl -L --retry 3

all: build

fetch: bash-$(VERSION).tar.gz
unpack: bash-$(VERSION)/
patch: unpack
prepare: bash-$(VERSION)/
	mkdir build/
	@touch $@

configure: prepare
	cd build && ../bash-$(VERSION)/configure --prefix=$(PREFIX) \
		--bindir=$(BINDIR)
	@touch $@

build: configure
	$(MAKE) -C build all

install: build
	$(MAKE) -C build DESTDIR=$(DESTDIR) install
	ln -sf bash $(DESTDIR)/$(BINDIR)/sh

clean:
	$(RM) prepare configure
	$(RM) -r build/
	$(RM) -r bash-$(VERSION)/

distclean: clean
	$(RM) bash-$(VERSION).tar.gz

bash-$(VERSION).tar.gz:
	$(FETCH) ftp://ftp.gnu.org/gnu/bash/bash-$(VERSION).tar.gz > $@

bash-$(VERSION)/: bash-$(VERSION).tar.gz
	tar xzf $<

