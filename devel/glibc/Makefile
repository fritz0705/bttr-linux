.PHONY: all fetch unpack patch build install clean distclean

PREFIX?=/usr
DESTDIR?=

LIBDIR?=$(PREFIX)/lib
LIBEXECDIR?=$(PREFIX)/lib

VERSION?=2.18
KERNEL_VERSION?=3.2

FETCH?=curl -L --retry 3

all: build

fetch: glibc-$(VERSION).tar.gz
unpack: glibc-$(VERSION)/
patch: unpack
prepare: | glibc-$(VERSION)/
	mkdir build/
	@touch $@

configure: prepare
	cd build && ../glibc-$(VERSION)/configure --prefix=$(PREFIX) \
		--libdir=$(LIBDIR) \
		--libexecdir=$(LIBEXECDIR) \
		--enable-add-ons=nptl,libidn \
		--enable-obsolete-rpc \
		--enable-kernel=$(KERNEL_VERSION) \
		--enable-bind-now --disable-profile \
		--enable-stackguard-randomization \
		--enable-multi-arch \
		$(CONFIGURE_FLAGS)
	@touch $@

build: configure
	$(MAKE) -C build all

install: build
	$(MAKE) -C build install_root=$(DESTDIR) install

clean:
	$(RM) prepare configure
	$(RM) -r build/
	$(RM) -r glibc-$(VERSION)/

distclean: clean
	$(RM) glibc-$(VERSION).tar.gz

glibc-$(VERSION).tar.gz:
	$(FETCH) ftp://ftp.gnu.org/gnu/glibc/glibc-$(VERSION).tar.gz > $@

glibc-$(VERSION)/: glibc-$(VERSION).tar.gz
	tar xzf $<


.PHONY: Version
Version:
	@echo $(VERSION) > $@

