.PHONY: all fetch unpack patch build install clean distclean

PREFIX?=/usr
DESTDIR?=
ifeq ($(PREFIX),/usr)
	BINDIR?=/bin
else
	BINDIR?=$(PREFIX)/bin
endif
VERSION?=8.21
FETCH?=curl -L --retry 3

all: build
	
fetch: coreutils-$(VERSION).tar.xz
unpack: coreutils-$(VERSION)/
patch: unpack
prepare: coreutils-$(VERSION)/
	mkdir build/
	@touch $@

configure: prepare
	cd build && ../coreutils-$(VERSION)/configure --prefix=$(PREFIX) \
		--bindir=$(BINDIR)
	@touch $@

build: configure
	$(MAKE) -C build

install: build
	$(MAKE) -C build/ DESTDIR=$(DESTDIR) install
ifeq ($(BINDIR),/bin)
	ln -sf $(BINDIR)/env $(DESTDIR)/bin/env
endif

clean:
	$(RM) prepare configure
	$(RM) -r build/
	$(RM) -r coreutils-$(VERSION)/

distclean: clean
	$(RM) coreutils-$(VERSION).tar.xz

coreutils-$(VERSION).tar.xz:
	$(FETCH) ftp://ftp.gnu.org/gnu/coreutils/coreutils-$(VERSION).tar.xz > $@

coreutils-$(VERSION)/: coreutils-$(VERSION).tar.xz
	tar xJf $<


.PHONY: Version
Version:
	@echo $(VERSION) > $@

