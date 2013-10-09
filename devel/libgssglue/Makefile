.PHONY: all fetch unpack patch build install clean distclean

PREFIX?=/usr
DESTDIR?=
VERSION?=0.4
FETCH?=curl -L --retry 3

all: build

fetch: libgssglue-$(VERSION).tar.gz
unpack: libgssglue-$(VERSION)/
patch: unpack
prepare: libgssglue-$(VERSION)/
	mkdir build/
	@touch $@

configure: prepare
	cd build && ../libgssglue-$(VERSION)/configure --prefix=$(PREFIX)
	@touch $@

build: configure
	$(MAKE) -C build

install: build
	$(MAKE) -C build install DESTDIR=$(DESTDIR)

clean:
	$(RM) prepare configure
	$(RM) -r build/
	$(RM) -r libgssglue-$(VERSION)/

distclean: clean
	$(RM) libgssglue-$(VERSION).tar.gz

libgssglue-$(VERSION).tar.gz:
	$(FETCH) http://www.citi.umich.edu/projects/nfsv4/linux/libgssglue/libgssglue-$(VERSION).tar.gz > $@

libgssglue-$(VERSION)/: libgssglue-$(VERSION).tar.gz
	tar xzf $<


.PHONY: Version
Version:
	@echo $(VERSION) > $@

