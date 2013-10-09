.PHONY: all fetch unpack patch build install clean distclean

PREFIX?=/usr
DESTDIR?=
VERSION?=2.5.37
FETCH?=curl -L --retry 3

all: build

fetch: flex-$(VERSION).tar.gz
unpack: flex-$(VERSION)/
patch: unpack
prepare: flex-$(VERSION)/
	mkdir build/
	@touch $@

configure: prepare
	cd build && ../flex-$(VERSION)/configure --prefix=$(PREFIX)
	@touch $@

build: configure
	$(MAKE) -C build

install: build
	$(MAKE) -C build install DESTDIR=$(DESTDIR)

clean:
	$(RM) prepare configure
	$(RM) -r build/
	$(RM) -r flex-$(VERSION)/

distclean: clean
	$(RM) flex-$(VERSION).tar.gz

flex-$(VERSION).tar.gz:
	$(FETCH) http://downloads.sourceforge.net/sourceforge/flex/flex-$(VERSION).tar.gz > $@

flex-$(VERSION)/: flex-$(VERSION).tar.gz
	tar xzf $<

.PHONY: Version
Version:
	@echo $(VERSION) > $@

