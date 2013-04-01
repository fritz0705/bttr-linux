.PHONY: all fetch unpack patch build install clean distclean

PREFIX=/usr
DESTDIR=
VERSION=2.23.2
FETCH=curl

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

fetch: binutils-$(VERSION).tar.gz
unpack: binutils-$(VERSION)/
patch: unpack
prepare: binutils-$(VERSION)/
	mkdir build/
	@touch $@

configure: prepare
	cd build && ../binutils-$(VERSION)/configure --prefix=$(PREFIX) \
		$(__configure_flags)
	@touch $@

build: configure
	$(MAKE) -C build

install: build
	$(MAKE) -C build install DESTDIR=$(DESTDIR)

clean:
	$(RM) prepare configure
	$(RM) -r build/
	$(RM) -r binutils-$(VERSION)/

distclean: clean
	$(RM) binutils-$(VERSION).tar.gz

binutils-$(VERSION).tar.gz:
	$(FETCH) ftp://ftp.gnu.org/gnu/binutils/binutils-$(VERSION).tar.gz > $@

binutils-$(VERSION)/: binutils-$(VERSION).tar.gz
	tar xzf $<

