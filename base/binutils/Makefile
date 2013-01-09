.PHONY: all build install clean

PREFIX=/usr
DESTDIR=
VERSION=2.23

override __configure_flags = 

ifdef LIB_PATH
override __configure_flags += --with-lib-path=$(LIB_PATH)
endif

ifdef SYSROOT
override __configure_flags += --with-sysroot=$(SYSROOT)
endif

ifeq ($(WITHOUT_SHARED),yes)
override __configure_flags += --disable-shared --enable-static
endif

override __configure_flags += $(CONFIGURE_FLAGS)

all: build

build: configure
	$(MAKE) -C build all

configure: prepare
	cd build && ../binutils-$(VERSION)/configure --prefix=$(PREFIX) \
		$(__configure_flags)
	@touch configure

prepare: binutils-$(VERSION).tar.gz
	tar xzf binutils-$(VERSION).tar.gz
	@mkdir build
	@touch prepare

binutils-$(VERSION).tar.gz:
	wget ftp://ftp.gnu.org/gnu/binutils/binutils-$(VERSION).tar.gz

install: build
	$(MAKE) -C build install DESTDIR=$(DESTDIR)

clean:
	$(RM) prepare
	$(RM) configure
	$(RM) binutils-$(VERSION).tar.gz
	$(RM) -r build/
	$(RM) -r binutils-$(VERSION)/

