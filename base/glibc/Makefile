.PHONY: all build install clean

PREFIX=/usr
DESTDIR=

LIBDIR:=$(PREFIX)/lib
LIBEXECDIR:=$(PREFIX)/lib

VERSION=2.16.0
KERNEL_VERSION=2.6.32

all: build

build: configure
	$(MAKE) -C build all

configure: prepare
	cd build && ../glibc-$(VERSION)/configure --prefix=$(PREFIX) \
		--libdir=$(LIBDIR) \
		--libexecdir=$(LIBEXECDIR) \
		--enable-add-ons=nptl,libidn \
		--enable-obsolete-rpc \
		--enable-kernel=$(KERNEL_VERSION) \
		--enable-bind-now --disable-profile \
		--enable-stackguard-randomization \
		--enable-multi-arch
	@touch configure

prepare: glibc-$(VERSION).tar.gz
	tar xzf glibc-$(VERSION).tar.gz
	mkdir -p build
	@touch prepare

glibc-$(VERSION).tar.gz:
	wget ftp://ftp.gnu.org/gnu/glibc/glibc-$(VERSION).tar.gz

install: build
ifeq ($(PREFIX),/usr)
	ln -sf lib64 $(DESTDIR)/lib
endif
	$(MAKE) -C build install_root=$(DESTDIR) install

clean:
	$(RM) prepare
	$(RM) configure
	$(RM) glibc-$(VERSION).tar.gz
	$(RM) -r build/
	$(RM) -r glibc-$(VERSION)/

