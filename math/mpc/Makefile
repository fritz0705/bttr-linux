.PHONY: all fetch unpack patch build install clean distclean

PREFIX?=/usr
DESTDIR?=
VERSION?=1.0.1
FETCH?=curl -L --retry 3

all: build

fetch: mpc-$(VERSION).tar.gz
unpack: mpc-$(VERSION)/
patch: unpack
prepare: mpc-$(VERSION)/
	mkdir build
	@touch $@

configure: prepare
	cd build && ../mpc-$(VERSION)/configure --prefix=$(PREFIX)
	@touch $@

build: configure
	$(MAKE) -C build

install: build
	$(MAKE) -C build install DESTDIR=$(DESTDIR)

clean:
	$(RM) prepare configure
	$(RM) -r build/
	$(RM) -r mpc-$(VERSION)/

distclean: clean
	$(RM) mpc-$(VERSION).tar.gz

mpc-$(VERSION).tar.gz:
	$(FETCH) http://www.multiprecision.org/mpc/download/mpc-$(VERSION).tar.gz > $@

mpc-$(VERSION)/: mpc-$(VERSION).tar.gz
	tar xzf $<

.PHONY: Version
Version:
	@echo $(VERSION) > $@

