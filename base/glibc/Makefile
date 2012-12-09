.PHONY: all build install clean

PREFIX=/usr
DESTDIR=

LIBDIR:=$(PREFIX)/lib
LIBEXECDIR:=$(PREFIX)/lib

all: build

build: configure
	$(MAKE) -C build all

configure: prepare
	cd build && ../glibc-2.16.0/configure --prefix=$(PREFIX) \
		--libdir=$(LIBDIR) \
		--libexecdir=$(LIBEXECDIR) \
		--enable-add-ons=nptl,libidn \
		--enable-obsolete-rpc \
		--enable-kernel=2.6.32 \
		--enable-bind-now --disable-profile \
		--enable-stackguard-randomization \
		--enable-multi-arch
	@touch configure

prepare: glibc-2.16.0.tar.gz
	tar xzf glibc-2.16.0.tar.gz
	mkdir -p build
	@touch prepare

glibc-2.16.0.tar.gz:
	wget ftp://ftp.gnu.org/gnu/glibc/glibc-2.16.0.tar.gz

install: build
	ln -sf lib64 $(DESTDIR)/lib
	$(MAKE) -C build install_root=$(DESTDIR) install

clean:
	-rm prepare
	-rm configure
	-rm glibc-2.16.0.tar.gz
	-rm -r build/
	-rm -r glibc-2.16.0/

