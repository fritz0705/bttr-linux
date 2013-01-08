.PHONY: all build install clean

PREFIX=/usr
DESTDIR=
LANGUAGES=c
VERSION=4.7.1

override __configure_flags =

ifdef SYSROOT
override __configure_flags += --with-sysroot=$(SYSROOT)
endif

ifeq ($(WITHOUT_HEADERS),yes)
override __configure_flags += $(WITHOUT_HEADERS)
endif

override __configure_flags += $(CONFIGURE_FLAGS)

all: build

build: configure
	$(MAKE) -C build all

configure: prepare
	cd build && ../gcc-$(VERSION)/configure --prefix=$(PREFIX) \
		--enable-languages=$(LANGUAGES) --disable-multilib \
		$(__configure_flags)
	@touch configure

prepare: gcc-$(VERSION).tar.gz
	tar xzf gcc-$(VERSION).tar.gz
	@mkdir build
	@touch prepare

gcc-$(VERSION).tar.gz:
	wget ftp://ftp.gnu.org/gnu/gcc/gcc-$(VERSION)/gcc-$(VERSION).tar.gz

install: build
	$(MAKE) -C build install DESTDIR=$(DESTDIR)
	ln -sf gcc $(DESTDIR)/$(PREFIX)/bin/cc

clean:
	$(RM) prepare
	$(RM) configure
	$(RM) gcc-$(VERSION).tar.gz
	$(RM) -r build/
	$(RM) -r gcc-$(VERSION)/

