PREFIX=/usr
DESTDIR=
BINDIR:=/bin

CONFIGURE_FLAGS =

ifeq ($(shell id -u),0)
	CONFIGURE_FLAGS += FORCE_UNSAFE_CONFIGURE=1
endif


all: prepare
	cd build && ../coreutils-8.20/configure --prefix=$(PREFIX) \
		--bindir=$(BINDIR) $(CONFIGURE_FLAGS)
	$(MAKE) -C build/ all

prepare: coreutils-8.20.tar.xz
	tar xJf coreutils-8.20.tar.xz
	mkdir -p build
	touch prepare

coreutils-8.20.tar.xz:
	wget ftp://ftp.gnu.org/gnu/coreutils/coreutils-8.20.tar.xz

install: all
	$(MAKE) -C build/ DESTDIR=$(DESTDIR) install
	ln -sf $(BINDIR)/env $(DESTDIR)/$(PREFIX)/bin/env

clean:
	rm -rf build/
	rm -f prepare
	rm -rf coreutils-8.20.tar.xz
	rm -rf coreutils-8.20
