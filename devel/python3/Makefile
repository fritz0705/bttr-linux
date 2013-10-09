.PHONY: all fetch unpack patch build install clean distclean

PREFIX?=/usr
DESTDIR?=
VERSION?=3.3.2
FETCH?=curl -L --retry 3

all: build
	
fetch: Python-$(VERSION).tgz
unpack: Python-$(VERSION)/
patch: unpack
prepare: Python-$(VERSION)/
	mkdir build/
	@touch $@

configure: prepare
	cd build && ../Python-$(VERSION)/configure --prefix=$(PREFIX)
	@touch $@

build: configure
	$(MAKE) -C build

install: build
	$(MAKE) -C build install DESTDIR=$(DESTDIR)

clean:
	$(RM) prepare configure
	$(RM) -r build/
	$(RM) -r Python-$(VERSION)/

distclean: clean
	$(RM) Python-$(VERSION).tgz

Python-$(VERSION).tgz:
	$(FETCH) http://python.org/ftp/python/$(VERSION)/Python-$(VERSION).tgz > $@

Python-$(VERSION)/: Python-$(VERSION).tgz
	tar xzf $<


.PHONY: Version
Version:
	@echo $(VERSION) > $@

